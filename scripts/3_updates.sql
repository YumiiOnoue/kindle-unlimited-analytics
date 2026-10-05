USE book_analytics;

-- ==============================================
-- Adição de dados na tabela fato_assinatura
-- ================== 16/09 =====================
INSERT INTO fato_assinatura (servico, valor_mensal, data_pagamento) 
VALUES ('Kindle Unlimited', 24.90, '2026-04-04'),
       ('Kindle Unlimited', 24.90, '2026-05-04'),
       ('Kindle Unlimited', 24.90, '2026-06-04'),
       ('kindle Unlimited', 24.90, '2026-07-04'),
       ('Kindle Unlimited', 24.90, '2026-08-04'),
       ('Kindle Unlimited', 24.90, '2026-09-04');


-- ==============================================
-- Adição de dados na tabela dim_livros 
-- ================== 16/09 =====================
INSERT INTO dim_livros (isbn, titulo, autor, editora, categorias, ano_publicacao, numero_paginas) 
VALUES ('ASIN:B0GNC3MFRN', 'Café e Bolo em Wildflower Lock', 'Hannah Lynn', 'Paper Cat Publishing', 'Romance, Ficção', 2026, 282),
       ('ASIN:B0GNPFLY39', 'Céus Azuis sobre Wildflower Lock', 'Hannah Lynn', 'Paper Cat Publishing', 'Romance, Ficção', 2026, 348);


-- ==============================================
-- Adição de dados na tabela fato_leituras 
-- ================== 16/09 =====================
INSERT INTO fato_leituras (id_livro, data_inicio, data_fim, formato, preco_livro_avulso, valor_pago, nota, opiniao_texto)
VALUES ()