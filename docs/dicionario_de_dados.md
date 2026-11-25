# Dicionário de Dados (`book_analytics`)

Este documento descreve as tabelas, colunas, tipos de dados, chaves e regras de integridade do banco de dados `book_analytics`.

## Tabela: `dim_livros`

Armazena as informações cadastrais e os preços de referência dos livros.

| Nome da coluna | Tipo de dado | Chave / Restrição | Descrição de negócio |
|---|---|---|---|
| `id_livro` | `INT` | PK, AUTO_INCREMENT | Identificador único do livro. |
| `id_externo` | `VARCHAR(20)` | UNIQUE, NOT NULL | Identificador externo do livro, como ISBN-13 ou ASIN da Amazon. |
| `titulo` | `VARCHAR(255)` | NOT NULL | Título completo da obra. |
| `autor` | `VARCHAR(150)` | NOT NULL | Nome do autor principal. |
| `editora` | `VARCHAR(100)` | DEFAULT 'Independente' | Editora responsável pela publicação. |
| `ano_publicacao` | `INT` | NULL | Ano de publicação da edição. |
| `numero_paginas` | `INT` | NULL, CHECK (> 0) | Quantidade de páginas da edição. |
| `preco_digital` | `DECIMAL(10,2)` | NULL, CHECK (>= 0) | Preço de referência do e-book avulso (R$). |
| `preco_fisico` | `DECIMAL(10,2)` | NULL, CHECK (>= 0) | Preço de referência da edição física (R$). |

**Observação:** os preços são valores de referência do catálogo e não representam necessariamente o valor efetivamente pago pelo livro.

## Tabela: `dim_categoria`

Armazena as categorias literárias utilizadas na classificação dos livros.

| Nome da coluna | Tipo de dado | Chave / Restrição | Descrição de negócio |
|---|---|---|---|
| `id_categoria` | `INT` | PK, AUTO_INCREMENT | Identificador único da categoria. |
| `categoria` | `VARCHAR(100)` | UNIQUE, NOT NULL | Nome do gênero ou tema literário, como Romance, Dados e Fantasia. |

## Tabela: `livro_categoria`

Tabela associativa que relaciona livros e categorias, permitindo que um livro pertença a várias categorias e que uma categoria esteja associada a vários livros.

| Nome da coluna | Tipo de dado | Chave / Restrição | Descrição de negócio |
|---|---|---|---|
| `id_livro` | `INT` | PK, FK → dim_livros | Identificador do livro associado. |
| `id_categoria` | `INT` | PK, FK → dim_categoria | Identificador da categoria associada. |

A chave primária é composta por `id_livro` e `id_categoria`, impedindo a duplicação da mesma associação.

## Tabela: `fato_leituras`

Registra os eventos de leitura, incluindo datas, formato, origem de acesso, motivação, avaliação e status.

| Nome da coluna | Tipo de dado | Chave / Restrição | Descrição de negócio |
|---|---|---|---|
| `id_leitura` | `INT` | PK, AUTO_INCREMENT | Identificador único do evento de leitura. |
| `id_livro` | `INT` | FK, NOT NULL | Identificador do livro relacionado ao evento. |
| `data_inicio` | `DATE` | NOT NULL | Data em que a leitura foi iniciada. |
| `data_fim` | `DATE` | NULL, CHECK (>= data_inicio) | Data de conclusão ou abandono da leitura. Obrigatória para leituras concluídas; pode ser nula para leituras em andamento ou abandonadas. |
| `formato` | `ENUM` | NOT NULL, DEFAULT 'Digital' | Formato utilizado: `Digital` ou `Físico`. |
| `origem_acesso` | `ENUM` | NOT NULL, DEFAULT 'Kindle+' | Origem de acesso ao livro: `Kindle+`, `Compra`, `Emprestado`, `Presente` ou `Cortesia`. |
| `motivacao_leitura` | `ENUM` | NOT NULL, DEFAULT 'Sim' | Indica se havia intenção prévia de ler o livro: `Sim` ou `Não`. |
| `nota` | `DECIMAL(2,1)` | NULL, CHECK (1,0 a 5,0) | Avaliação pessoal atribuída ao livro. Opcional; quando preenchida, deve estar entre 1,0 e 5,0. |
| `opiniao_texto` | `TEXT` | NULL | Resenha ou comentário pessoal sobre a leitura. |
| `status_leitura` | `ENUM` | NOT NULL, DEFAULT 'Lido' | Situação da leitura: `Lido`, `Lendo` ou `Abandonado`. |

## Tabela: `fato_assinatura`

Registra os valores mensais da assinatura, permitindo acompanhar a evolução dos custos ao longo do tempo.

| Nome da coluna | Tipo de dado | Chave / Restrição | Descrição de negócio |
|---|---|---|---|
| `id_assinatura` | `INT` | PK, AUTO_INCREMENT | Identificador único do registro de assinatura. |
| `servico` | `VARCHAR(50)` | NOT NULL, DEFAULT 'Kindle+'; UNIQUE composta | Nome do serviço assinado. |
| `valor_mensal` | `DECIMAL(10,2)` | NOT NULL | Valor cobrado pela assinatura no período de referência (R$). |
| `mes_referencia` | `DATE` | NOT NULL, UNIQUE composta | Data de referência da cobrança mensal. |

A combinação de `servico` e `mes_referencia` possui restrição de unicidade, evitando registros duplicados para a mesma combinação de serviço e data.

## Regras de integridade e negócio

### Leituras

- Cada registro em `fato_leituras` representa um evento de leitura. Um mesmo livro pode possuir vários registros.
- `data_fim` deve ser igual ou posterior a `data_inicio`, quando preenchida.
- Para o status `Lido`, `data_fim` é obrigatória.
- Para o status `Lendo`, `data_fim` deve ser nula.
- Para o status `Abandonado`, `data_fim` pode ser nula ou preenchida.
- A nota é opcional. Quando informada, deve estar entre 1,0 e 5,0.

### Categorias

- Um livro pode estar associado a várias categorias.
- Uma categoria pode estar associada a vários livros.
- A tabela `livro_categoria` implementa esse relacionamento muitos-para-muitos.

### Assinatura

- Os registros de `fato_assinatura` são independentes dos registros de leitura.
- A combinação de serviço e data de referência não pode se repetir.
- A restrição de unicidade considera a data exata armazenada em `mes_referencia`.