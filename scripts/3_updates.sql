-- =========================================================
-- ATUALIZAÇÃO E INCLUSÃO DE DADOS
-- =========================================================

-- IMPORTANTE:
-- Este script contém operações de INSERT e deve ser executado uma única vez para cada conjunto de dados.
--
-- Antes da execução, verificar se os registros já existem no banco para evitar duplicidades.
-- =========================================================

-- =====================
-- BANCO DE DADOS
-- =====================
USE book_analytics;

-- ==============================================
-- Adição de dados na tabela dim_livros 
-- Dia da nova inclusão 09/10 
INSERT INTO dim_livros (id_externo, titulo, autor, editora, ano_publicacao, numero_paginas, preco_digital, preco_fisico) 
VALUES 
    ('978-6525943480', 'Maruru e Hachi', 'Sonoda Yuri', 'Panini', 2026, 176, 0.00, 35.18),
    ('978-6559244430', 'Um amor como nos livros', 'Moira Macdonald', 'Verus', 2025, 352, 9.99, 46.70),
    ('978-6559700875', 'Mapa do Coração', 'Susan Wiggs', 'Harlequin', 2021, 432, 34.90, 45.08),
    ('978-8582357316', 'Melodia prateada, chamas da noite', 'Amélie Wen Zhao', 'Gutenberg Editora', 2024, 505, 49.78, 51.69),
    ('978-8582358078', 'Estrela Escura em brasas, neve caindo em cinzas', 'Amélie Wen Zhao', 'Gutenberg Editora', 2025, 280, 49.78, 51.69),
    ('ASIN:B0FPPSN9QZ', 'Novos começos em Wildflower Lock', 'Hannah Lynn', 'Paper Cat Publishing', 2026, 282, 5.99, 96.04),
    ('978-6502057568', 'Traduzindo dados: como transformar números em decisões', 'Cristina Torres', 'Clube de Autores', 2026, 203, 0.00, 62.95),
    ('ASIN:B0GNC3MFRN', 'Café e Bolo em Wildflower Lock', 'Hannah Lynn', 'Paper Cat Publishing', 2026, 282, 16.99, 96.15),
    ('ASIN:B0GNPFLY39', 'Céus Azuis sobre Wildflower Lock', 'Hannah Lynn', 'Paper Cat Publishing', 2026, 348, 19.99, 96.84);

-- ==============================================
-- Adição de dados na tabela fato_leituras 
-- Dia da nova inclusão 09/10 
INSERT INTO fato_leituras (id_livro, data_inicio, data_fim, formato, origem_acesso, motivacao_leitura, nota, opiniao_texto, status_leitura)
VALUES 
       ((SELECT id_livro FROM dim_livros WHERE titulo = 'Maruru e Hachi'), '2026-04-14', '2026-04-14', 'Físico', 'Emprestado', 'Não', 5, NULL, 'Lido'),
       ((SELECT id_livro FROM dim_livros WHERE titulo = 'Um amor como nos livros'), '2026-04-27', '2026-05-08', 'Digital', 'Kindle+', 'Não', 3, NULL, 'Lido'),
       ((SELECT id_livro FROM dim_livros WHERE titulo = 'Mapa do Coração'), '2026-05-11', '2026-05-25', 'Digital', 'Kindle+', 'Não', 3.5, NULL, 'Lido'),
       ((SELECT id_livro FROM dim_livros WHERE titulo = 'Melodia prateada, chamas da noite'), '2026-06-01', '2026-06-18', 'Digital', 'Kindle+', 'Não', 4.9, NULL, 'Lido'),
       ((SELECT id_livro FROM dim_livros WHERE titulo = 'Estrela Escura em brasas, neve caindo em cinzas'), '2026-06-22', '2026-07-02', 'Digital', 'Emprestado', 'Sim', 4.0, NULL, 'Lido'),
       ((SELECT id_livro FROM dim_livros WHERE titulo = 'Novos começos em Wildflower Lock'), '2026-07-27', '2026-08-30', 'Digital', 'Kindle+', 'Não', 4.5, NULL, 'Lido'),
       ((SELECT id_livro FROM dim_livros WHERE titulo = 'Traduzindo dados: como transformar números em decisões'), '2026-08-26', NULL, 'Digital', 'Cortesia', 'Sim', 3, NULL, 'Lendo'),
       ((SELECT id_livro FROM dim_livros WHERE titulo = 'Café e Bolo em Wildflower Lock'), '2026-09-03','2026-09-13','Digital','Kindle+', 'Sim', 4.8, NULL ,'Lido'),
       ((SELECT id_livro FROM dim_livros WHERE titulo = 'Céus Azuis sobre Wildflower Lock'), '2026-09-15', '2026-09-24', 'Digital', 'Kindle+', 'Sim', 4.0, NULL, 'Lido');

-- ==============================================
-- Atualização de dados na tabela livro_categoria 
-- Dia da nova inclusão 09/10 
INSERT INTO livro_categoria (id_livro, id_categoria)
VALUES 
       ((SELECT id_livro FROM dim_livros WHERE titulo = 'Maruru e Hachi'), (SELECT id_categoria FROM dim_categoria WHERE categoria = 'Mangá')), 
       ((SELECT id_livro FROM dim_livros WHERE titulo = 'Um amor como nos livros'), (SELECT id_categoria FROM dim_categoria WHERE categoria = 'Romance')), 
       ((SELECT id_livro FROM dim_livros WHERE titulo = 'Mapa do Coração'), (SELECT id_categoria FROM dim_categoria WHERE categoria = 'Romance')), 
       ((SELECT id_livro FROM dim_livros WHERE titulo = 'Melodia prateada, chamas da noite'), (SELECT id_categoria FROM dim_categoria WHERE categoria = 'Fantasia')), 
       ((SELECT id_livro FROM dim_livros WHERE titulo = 'Melodia prateada, chamas da noite'), (SELECT id_categoria FROM dim_categoria WHERE categoria = 'Ficção')),
       ((SELECT id_livro FROM dim_livros WHERE titulo = 'Estrela Escura em brasas, neve caindo em cinzas'), (SELECT id_categoria FROM dim_categoria WHERE categoria = 'Fantasia')), 
       ((SELECT id_livro FROM dim_livros WHERE titulo = 'Estrela Escura em brasas, neve caindo em cinzas'), (SELECT id_categoria FROM dim_categoria WHERE categoria = 'Ficção')),
       ((SELECT id_livro FROM dim_livros WHERE titulo = 'Novos começos em Wildflower Lock'), (SELECT id_categoria FROM dim_categoria WHERE categoria = 'Romance')), 
       ((SELECT id_livro FROM dim_livros WHERE titulo = 'Traduzindo dados: como transformar números em decisões'), (SELECT id_categoria FROM dim_categoria WHERE categoria = 'Tomada de Decisão')), 
       ((SELECT id_livro FROM dim_livros WHERE titulo = 'Traduzindo dados: como transformar números em decisões'), (SELECT id_categoria FROM dim_categoria WHERE categoria = 'Negócios')),
       ((SELECT id_livro FROM dim_livros WHERE titulo = 'Traduzindo dados: como transformar números em decisões'), (SELECT id_categoria FROM dim_categoria WHERE categoria = 'Dados')),
       ((SELECT id_livro FROM dim_livros WHERE titulo = 'Café e Bolo em Wildflower Lock'), (SELECT id_categoria FROM dim_categoria WHERE categoria = 'Romance')),
       ((SELECT id_livro FROM dim_livros WHERE titulo = 'Céus Azuis sobre Wildflower Lock'), (SELECT id_categoria FROM dim_categoria WHERE categoria = 'Romance'));

-- ===============================================
-- Inclusão de dados do dia 25/11

INSERT INTO fato_assinatura (servico, valor_mensal, mes_referencia)
VALUES ('Kindle+', 24.90, '2026-11-04');

INSERT INTO dim_livros (id_externo, titulo, autor, editora, ano_publicacao, numero_paginas, preco_digital, preco_fisico)
VALUES
       ('ASIN:B0GNP99Q2K', 'Amor para Sempre em Wildflower Lock', 'Hannah Lynn', 'Paper Cat Publishing', 2026, 293, 21.99, 111.89),
       ('978-6558100140', 'Sem medo de rejeição: Como superei o medo de ouvir um não e me tornei mais confiante', 'Jia Jiang', 'GEN Trade+', 2021, 216, 0.00, 52.43),
       ('ASIN:B0DLY1LT83', 'Queria morrer, mas no céu (ainda) não tem tteokbokki', 'Baek Sehee', 'Universo dos Livros', 2024, 183, 9.98, 37.04);

INSERT INTO livro_categoria (id_livro, id_categoria)
VALUES
       ((SELECT id_livro FROM dim_livros WHERE titulo = 'Amor para Sempre em Wildflower Lock'), (SELECT id_categoria FROM dim_categoria WHERE categoria = 'Romance')),
       ((SELECT id_livro FROM dim_livros WHERE titulo = 'Sem medo de rejeição: Como superei o medo de ouvir um não e me tornei mais confiante'), (SELECT id_categoria FROM dim_categoria WHERE categoria = 'Autoajuda')),
       ((SELECT id_livro FROM dim_livros WHERE titulo = 'Sem medo de rejeição: Como superei o medo de ouvir um não e me tornei mais confiante'), (SELECT id_categoria FROM dim_categoria WHERE categoria = 'Desenvolvimento Pessoal')),
       ((SELECT id_livro FROM dim_livros WHERE titulo = 'Queria morrer, mas no céu (ainda) não tem tteokbokki'), (SELECT id_categoria FROM dim_categoria WHERE categoria = 'Autoajuda')),
       ((SELECT id_livro FROM dim_livros WHERE titulo = 'Queria morrer, mas no céu (ainda) não tem tteokbokki'), (SELECT id_categoria FROM dim_categoria WHERE categoria = 'Memórias'));

INSERT INTO fato_leituras (id_livro, data_inicio, data_fim, formato, origem_acesso, motivacao_leitura, nota, opiniao_texto, status_leitura)
VALUES
       ((SELECT id_livro FROM dim_livros WHERE titulo = 'Amor para Sempre em Wildflower Lock'), '2026-09-28', '2026-10-14', 'Digital', 'Kindle+', 'Não', 3.5, NULL, 'Lido'),
       ((SELECT id_livro FROM dim_livros WHERE titulo = 'Sem medo de rejeição: Como superei o medo de ouvir um não e me tornei mais confiante'), '2026-10-31', NULL, 'Físico', 'Presente', 'Sim', 4.5, NULL, 'Lendo'),
       ((SELECT id_livro FROM dim_livros WHERE titulo = 'Queria morrer, mas no céu (ainda) não tem tteokbokki'), '2026-11-01', NULL, 'Digital', 'Kindle+', 'Sim', 4.0, NULL, 'Lendo');