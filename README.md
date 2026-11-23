# 📚 Book Analytics: Análise Financeira e Comportamental de Leituras (MySQL)

## 1. Resumo Executivo
Projeto de Engenharia e Análise de Dados desenvolvido em **MySQL 8.0** para avaliar o retorno financeiro e o comportamento de leitura do meu acervo pessoal entre 2021 e 2026. O estudo responde se vale a pena manter a assinatura do **Kindle Unlimited** ao comparar o custo mensal recorrente contra o preço de referência digital das obras concluídas no catálogo, além de mapear ritmo de leitura, intenção de compra e avaliação por gênero.

## 2. Contexto e Objetivo
Assinaturas digitais recorrentes exigem acompanhamento periódico para verificar se o uso real justifica o custo fixo. A partir do histórico real de 58 livros e 59 registros de leitura, o banco `book_analytics` foi modelado para:
- Medir a economia líquida mensal e acumulada do Kindle Unlimited frente à compra avulsa de e-books.
- Calcular o custo rateado real por livro concluído via assinatura.
- Identificar o ritmo de leitura (dias por livro e páginas por dia) por formato (`Digital` vs. `Físico`) e origem de acesso (`Kindle Unlimited`, `Compra`, `Emprestimo`, `Cortesia`, `Presente`).
- Avaliar quais categorias, autores e editoras concentram as melhores notas e intenções de compra.

## 3. Arquitetura e Modelagem
O banco segue uma modelagem dimensional (**Star Schema** com relacionamento muitos-para-muitos resolvido por tabela ponte):
- **Tabelas Fato:** `fato_leituras` (eventos de leitura, datas, status, nota e intenção de compra) e `fato_assinatura` (histórico de cobranças mensais do Kindle Unlimited).
- **Tabelas Dimensão:** `dim_livros` (metadados bibliográficos e preços de referência digital/físico) e `dim_categoria` (gêneros literários).
- **Tabela Associativa:** `livro_categoria` (permite classificar cada livro em múltiplas categorias simultaneamente).

[Visualizar Diagrama Entidade-Relacionamento](docs/diagrama-er.md)
[Consultar Dicionário de Dados Completo](docs/dicionario_de_dados.md)

## 4. Perguntas de Negocio e Principais Insights


## 5. Habilidades Tecnicas 
- **Modelagem Dimensional e Integridade:** 
- **Data Quality e Auditoria (`4_data_quality.sql`):** 
- **SQL Analítico Avançado:** 

## 6. Como Executar o Projeto

### Pré-requisitos
- MySQL 8.0+
- Power BI Desktop (para visualizar o dashboard)

### 1. Clone o repositório

```bash
git clone https://github.com/YumiiOnoue/kindle-unlimited-analytics.git
cd kindle-unlimited-analytics
```

### 2. Configure o banco de dados

Crie o banco no MySQL:

```sql
CREATE DATABASE book_analytics;
```

### 3. Execute os scripts SQL

No MySQL Workbench, execute os arquivos na seguinte ordem:

1. `scripts/1_create_table.sql`
2. `scripts/2_inserts.sql`
3. `scripts/3_updates.sql`
4. `scripts/4_data_quality.sql`

O script de carga inicial deve ser executado apenas uma vez em um banco vazio.

O script de atualização deve ser executado somente quando houver novos dados ou correções a registrar, após verificar se os registros já não existem no banco.

O script `4_data_quality.sql` deve ser executado após as cargas para verificar a integridade e consistência dos dados.


### 4. Acesse o dashboard

Abra o arquivo Power BI disponível na pasta `power_bi/`, configure a conexão com o MySQL e atualize os dados.

**Observação:** execute os scripts de criação, carga e atualização somente uma vez, em um banco recém-criado.