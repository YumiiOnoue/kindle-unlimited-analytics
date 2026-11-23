# Modelo de Dados — Power BI

## 1. Visão geral

O Power BI utiliza conexão direta com o banco de dados MySQL `book_analytics`.

A modelagem dos relacionamentos, os cálculos analíticos e os indicadores são desenvolvidos diretamente no Power BI, utilizando o modelo semântico e a linguagem DAX.

O objetivo é organizar os dados para permitir análises financeiras, comportamentais e de segmentação das leituras.

### Fluxo de dados

```mermaid
    A[MySQL<br/>book_analytics] -->|Conexão direta| B[Power BI]

    B --> C[Modelo Semântico]

    C --> D[Relacionamentos entre tabelas]
    C --> E[Medidas DAX]
    C --> F[Filtros e Segmentações]

    D --> G[Dashboards Analíticos]
    E --> G
    F --> G

    G --> H[Visão Geral]
    G --> I[Viabilidade Financeira]
    G --> J[Análise Comportamental]
    G --> K[Segmentação por Categoria]
```

## 2. Tabelas utilizadas

| Tabela | Finalidade |
|---|---|
| `dim_livros` | Cadastro bibliográfico, características e preços de referência dos livros. |
| `dim_categoria` | Cadastro das categorias literárias. |
| `livro_categoria` | Relacionamento entre livros e categorias. |
| `fato_leituras` | Registros de leitura, datas, formato, origem de acesso, intenção de compra e avaliação. |
| `fato_assinatura` | Histórico mensal de assinaturas e valores cobrados. |

## 3. Relacionamentos

Os relacionamentos são definidos diretamente no Power BI.

### Relacionamentos principais

| Tabela de origem | Coluna | Tabela de destino | Coluna |
|---|---|---|---|
| `dim_livros` | `id_livro` | `fato_leituras` | `id_livro` |
| `dim_livros` | `id_livro` | `livro_categoria` | `id_livro` |
| `dim_categoria` | `id_categoria` | `livro_categoria` | `id_categoria` |
| `Calendario` | `Data` | `fato_leituras` | `data_fim` |
| `Calendario` | `Data` | `fato_assinatura` | `mes_referencia` |

### Regras de relacionamento

- Livros e leituras: relacionamento de um para muitos.
- Livros e categorias: relacionamento de muitos para muitos, intermediado por `livro_categoria`.
- Calendário e leituras: relacionamento pela data de conclusão (`data_fim`).
- Calendário e assinatura: relacionamento pela referência mensal (`mes_referencia`).
- O relacionamento entre categorias e livros utiliza direção de filtro bidirecional (`Both`), conforme configuração do modelo.

**Observação:** os relacionamentos devem ser revisados sempre que houver alteração na estrutura das tabelas ou inclusão de novas fontes.

## 4. Medidas DAX

As medidas DAX são utilizadas para calcular os indicadores apresentados nos dashboards.

### 4.1. Indicadores de leitura

**Livros Concluídos**

```dax
Livros Concluídos =
CALCULATE(
    DISTINCTCOUNT(fato_leituras[id_livro]),
    fato_leituras[status_leitura] = "Lido"
)
```

**Livros Lidos com Intenção de Compra**

```dax
Livros Lidos com Intenção de Compra =
CALCULATE(
    DISTINCTCOUNT(fato_leituras[id_livro]),
    fato_leituras[status_leitura] = "Lido",
    fato_leituras[motivacao_leitura] = "Sim"
)
```

**Nota Média das Leituras**

```dax
Nota Média das Leituras =
CALCULATE(
    AVERAGE(fato_leituras[nota]),
    fato_leituras[status_leitura] = "Lido"
)
```

### 4.2. Indicadores financeiros

**Total de Mensalidades KU**

```dax
Total Mensalidades KU =
SUM(fato_assinatura[valor_mensal])
```

**Custo por Livro Concluído via KU**

```dax
Custo por Livro KU =
DIVIDE(
    [Total Mensalidades KU],
    [Livros Concluídos via KU],
    0
)
```

**Valor de Referência dos Livros KU**

```dax
Valor Referência Livros KU =
CALCULATE(
    SUMX(
        fato_leituras,
        RELATED(dim_livros[preco_digital])
    ),
    fato_leituras[status_leitura] = "Lido",
    fato_leituras[origem_acesso] = "Kindle Unlimited"
)
```

## 4.3. Catálogo de Medidas DAX

Esta seção documenta as principais medidas utilizadas no modelo semântico do Power BI, apresentando suas finalidades, regras de cálculo, tabelas de origem e páginas do dashboard em que são aplicadas.

| Medida DAX | Objetivo | Regra de cálculo | Tabelas utilizadas | Página do dashboard |
|---|---|---|---|---|
| `Livros Concluídos` | Quantificar os livros finalizados. | Contagem distinta de livros com status "Lido". | `fato_leituras` | Visão Geral |
| `Nota Média das Leituras` | Avaliar a satisfação com as leituras. | Média das notas dos livros concluídos. | `fato_leituras` | Visão Geral |
| `Total Mensalidades KU` | Mensurar o investimento na assinatura. | Soma dos valores mensais registrados. | `fato_assinatura` | Visão Geral / Viabilidade Financeira |
| `Livros Concluídos via KU` | Identificar os livros concluídos pelo serviço. | Contagem distinta de livros com origem "Kindle Unlimited" e status "Lido". | `fato_leituras` | Viabilidade Financeira |
| `Custo por Livro KU` | Calcular o custo médio da assinatura por livro concluído via KU. | Total de mensalidades dividido pela quantidade de livros concluídos via KU. | `fato_assinatura`, `fato_leituras` | Viabilidade Financeira |
| `Valor Referência Livros KU` | Estimar o valor de mercado dos livros lidos via assinatura. | Soma dos preços digitais de referência dos livros concluídos via KU. | `fato_leituras`, `dim_livros` | Viabilidade Financeira |
| `Livros Lidos com Intenção de Compra` | Identificar livros que já despertavam interesse de compra. | Contagem distinta de livros concluídos com intenção de compra igual a "Sim". | `fato_leituras` | Análise Comportamental |
| `% Livros com Intenção de Compra` | Mensurar a participação dos livros com intenção prévia de compra. | Livros com intenção de compra divididos pelo total de livros concluídos. | `fato_leituras` | Análise Comportamental |


## 5. Regras de negócio

### Intenção de compra

A coluna `motivacao_leitura` identifica se o livro fazia parte do interesse de leitura da pessoa ou se foi lido por estar disponível no Kindle Unlimited.

- `Sim`: havia intenção de compra ou interesse prévio no livro.
- `Não`: o livro foi lido por estar disponível, sem intenção prévia de compra.
- `Indefinido`: não foi possível determinar a intenção.

### Origem de acesso

A coluna `origem_acesso` identifica como o livro foi obtido:

- Kindle Unlimited;
- Compra;
- Empréstimo;
- Presente;
- Cortesia.

### Preços de referência

Os campos `preco_digital` e `preco_fisico`, armazenados em `dim_livros`, representam valores de referência dos livros.

Esses valores não devem ser interpretados automaticamente como pagamentos efetivamente realizados.

### Custos da assinatura

Os valores registrados em `fato_assinatura` representam os custos mensais da assinatura e são utilizados para calcular o investimento acumulado no serviço.

## 6. Organização dos dashboards

| Página | Objetivo | Principais análises |
|---|---|---|
| Visão Geral | Apresentar os principais indicadores do histórico de leitura. | Livros concluídos, custos, notas e evolução anual. |
| Viabilidade Financeira | Avaliar o custo da assinatura em relação ao uso do serviço. | Mensalidades, custo por livro e preços de referência. |
| Análise Comportamental | Identificar padrões e preferências de leitura. | Tempo de leitura, intenção de compra, avaliações e origem de acesso. |
| Segmentação por Categoria | Identificar preferências por gênero literário. | Quantidade de livros, avaliações e categorias mais lidas. |

## 7. Considerações técnicas

- A fonte de dados é o banco MySQL `book_analytics`.
- Os relacionamentos são configurados no Power BI.
- As medidas analíticas são implementadas em DAX.
- Não são utilizadas views SQL como fonte intermediária do dashboard.
- As consultas SQL exploratórias permanecem separadas do modelo semântico do Power BI.

## 8. Formato e versionamento do projeto

O projeto de Power BI utiliza o formato **Power BI Project (`.pbip`)**, permitindo organizar e versionar os componentes do relatório e do modelo semântico separadamente.

Os arquivos do projeto são armazenados no GitHub, possibilitando acompanhar alterações, manter o histórico de desenvolvimento e documentar a evolução do modelo analítico.

### Componentes principais

| Componente | Finalidade |
|---|---|
| Arquivo `.pbip` | Arquivo de entrada do projeto Power BI. |
| Pasta `.Report` | Armazena a definição e os elementos do relatório. |
| Pasta `.SemanticModel` | Armazena a definição do modelo semântico, incluindo tabelas, relacionamentos e medidas. |

### Controle de versão

O GitHub é utilizado para versionamento dos arquivos do projeto, permitindo acompanhar modificações realizadas no relatório e no modelo semântico ao longo do desenvolvimento.