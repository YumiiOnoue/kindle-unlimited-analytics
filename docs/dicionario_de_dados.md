# Dicionario de Dados (`book_analytics`)

## Tabela: `dim_livros`
| Nome da Coluna | Tipo de Dado | Chave / Restricao | Descricao de Negocio |
| :--- | :--- | :--- | :--- |
| `id_livro` | `INT` | `PK, AUTO_INCREMENT` | Identificador unico do livro. |
| `isbn` | `VARCHAR(20)` | `UNIQUE, NOT NULL` | Codigo ISBN-13 ou ASIN da Amazon. |
| `titulo` | `VARCHAR(255)` | `NOT NULL` | Titulo completo da obra. |
| `autor` | `VARCHAR(150)` | `NOT NULL` | Nome do autor principal. |
| `editora` | `VARCHAR(100)` | `DEFAULT 'Independente'` | Editora responsavel pela publicacao. |
| `ano_publicacao` | `INT` | `NULL` | Ano de publicacao da edicao lida. |
| `numero_paginas` | `INT` | `DEFAULT 0, CHECK (>= 0)` | Quantidade total de paginas da edicao. |
| `preco_digital` | `DECIMAL(10,2)` | `DEFAULT 0.00, CHECK (>= 0)` | Preco de referencia do e-book avulso na Amazon (R$). |
| `preco_fisico` | `DECIMAL(10,2)` | `DEFAULT 0.00, CHECK (>= 0)` | Preco de referencia da edicao fisica (R$). |

## Tabela: `dim_categoria`
| Nome da Coluna | Tipo de Dado | Chave / Restricao | Descricao de Negocio |
| :--- | :--- | :--- | :--- |
| `id_categoria` | `INT` | `PK, AUTO_INCREMENT` | Identificador unico da categoria literaria. |
| `categoria` | `VARCHAR(100)` | `UNIQUE, NOT NULL` | Nome do genero ou tema (ex: Romance, Dados, Fantasia). |

## Tabela: `livro_categoria`
| Nome da Coluna | Tipo de Dado | Chave / Restricao | Descricao de Negocio |
| :--- | :--- | :--- | :--- |
| `id_livro` | `INT` | `PK, FK -> dim_livros` | Referencia ao livro. |
| `id_categoria` | `INT` | `PK, FK -> dim_categoria` | Referencia a categoria associada ao livro. |

## Tabela: `fato_leituras`
| Nome da Coluna | Tipo de Dado | Chave / Restricao | Descricao de Negocio |
| :--- | :--- | :--- | :--- |
| `id_leitura` | `INT` | `PK, AUTO_INCREMENT` | Identificador unico do evento de leitura. |
| `id_livro` | `INT` | `FK -> dim_livros, NOT NULL` | Livro lido na sessao. |
| `data_inicio` | `DATE` | `NOT NULL` | Data em que a leitura foi iniciada. |
| `data_fim` | `DATE` | `NULL, CHECK (>= data_inicio)` | Data de conclusao ou abandono (nula se status for `Lendo`). |
| `formato` | `ENUM` | `NOT NULL, DEFAULT 'Digital'` | Midia utilizada: `Digital` ou `Fisico`. |
| `origem_acesso` | `ENUM` | `NOT NULL` | Canal de obtencao: `Kindle Unlimited`, `Compra`, `Emprestimo`, `Presente` ou `Cortesia`. |
| `motivacao_leitura` | `ENUM` | `NOT NULL` | Indica se queria ler ou se só leu por estar disponível no KU: `Sim` ou `Nao`. |
| `nota` | `DECIMAL(2,1)` | `NOT NULL, CHECK (1.0 a 5.0)` | Avaliacao pessoal atribuida ao livro. |
| `opiniao_texto` | `TEXT` | `NULL` | Resenha ou comentário pessoal sobre a leitura. |
| `status_leitura` | `ENUM` | `NOT NULL, DEFAULT 'Lido'` | Situação da leitura: `Lido`, `Lendo` ou `Abandonado`. |

## Tabela: `fato_assinatura`
| Nome da Coluna | Tipo de Dado | Chave / Restricao | Descricao de Negocio |
| :--- | :--- | :--- | :--- |
| `id_assinatura` | `INT` | `PK, AUTO_INCREMENT` | Identificador unico do registro mensal da assinatura. |
| `servico` | `VARCHAR(50)` | `UQ (servico, mes_referencia)` | Nome do servico assinado (`Kindle Unlimited`). |
| `valor_mensal` | `DECIMAL(10,2)` | `NOT NULL` | Valor pago na fatura mensal (R$). |
| `mes_referencia` | `DATE` | `UQ (servico, mes_referencia)` | Data de cobranca do ciclo mensal. |