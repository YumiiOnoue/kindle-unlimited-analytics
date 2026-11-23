# Diagrama Entidade-Relacionamento (`book_analytics`)

```mermaid
erDiagram
    DIM_LIVROS ||--o{ FATO_LEITURAS : "registrado_em"
    DIM_LIVROS ||--o{ LIVRO_CATEGORIA : "classificado_em"
    DIM_CATEGORIA ||--o{ LIVRO_CATEGORIA : "agrupa"

    DIM_LIVROS {
        int id_livro PK
        varchar isbn UK
        varchar titulo
        varchar autor
        varchar editora
        int ano_publicacao
        int numero_paginas
        decimal preco_digital
        decimal preco_fisico
    }

    DIM_CATEGORIA {
        int id_categoria PK
        varchar categoria UK
    }

    LIVRO_CATEGORIA {
        int id_livro PK, FK
        int id_categoria PK, FK
    }

    FATO_LEITURAS {
        int id_leitura PK
        int id_livro FK
        date data_inicio
        date data_fim
        enum formato
        enum origem_acesso
        enum motivacao_leitura
        decimal nota
        text opiniao_texto
        enum status_leitura
    }

    FATO_ASSINATURA {
        int id_assinatura PK
        varchar servico UK
        decimal valor_mensal
        date mes_referencia UK
    }