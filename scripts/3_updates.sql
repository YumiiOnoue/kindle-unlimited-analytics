USE book_analytics;

-- ==============================================
-- Adição de dados na tabela dim_livros 
-- ================== 09/10 =====================
INSERT INTO dim_livros (isbn, titulo, autor, editora, ano_publicacao, numero_paginas) 
VALUES 
    ('978-6525943480', 'Maruru e Hachi', 'Sonoda Yuri', 'Panini', 2026, 176),
    ('978-6559244430', 'Um amor como nos livros', 'Moira Macdonald', 'Verus', 2025, 352),
    ('978-6559700875', 'Mapa do Coração', 'Susan Wiggs', 'Harlequin', 2021, 432),
    ('978-8582357316', 'Melodia prateada, chamas da noite', 'Amélie Wen Zhao', 'Gutenberg Editora', 2024, 505),
    ('978-8582358078', 'Estrela Escura em brasas, neve caindo em cinzas', 'Amélie Wen Zhao', 'Gutenberg Editora', 2025, 280),
    ('ASIN:B0FPPSN9QZ', 'Novos começos em Wildflower Lock', 'Hannah Lynn', 'Paper Cat Publishing', 2026, 282),
    ('978-6502057568', 'Traduzindo dados: como transformar números em decisões', 'Cristina Torres', 'Clube de Autores', 2026, 203),
    ('ASIN:B0GNC3MFRN', 'Café e Bolo em Wildflower Lock', 'Hannah Lynn', 'Paper Cat Publishing', 2026, 282),
    ('ASIN:B0GNPFLY39', 'Céus Azuis sobre Wildflower Lock', 'Hannah Lynn', 'Paper Cat Publishing', 2026, 348);


-- ==============================================
-- Adição de dados na tabela fato_leituras 
-- ================== 09/10 =====================
INSERT INTO fato_leituras (id_livro, data_inicio, data_fim, formato, origem_acesso, valor_pago, preco_digital_na_leitura, preco_fisico_na_leitura, motivacao_leitura, nota, opiniao_texto, status_leitura)
VALUES 
       ((SELECT id_livro FROM dim_livros WHERE titulo = 'A lanterna das memórias perdidas'), '2026-03-14', '2026-03-19', 'Digital', 'Kindle Unlimited', 0.00, 35.91, 59.90, 'Sim', 4.5, NULL, 'Lido'),
       ((SELECT id_livro FROM dim_livros WHERE titulo = 'Maruru e Hachi'), '2026-04-14', '2026-04-14', 'Físico', 'Emprestimo', 0.00, 0.00, 35.18, 'Não', 5, NULL, 'Lido'),
       ((SELECT id_livro FROM dim_livros WHERE titulo = 'Um amor como nos livros'), '2026-04-27', '2026-05-08', 'Digital', 'Kindle Unlimited', 9.99, 9.99, 46.70, 'Não', 3, NULL, 'Lido'),
       ((SELECT id_livro FROM dim_livros WHERE titulo = 'Mapa do Coração'), '2026-05-11', '2026-05-25', 'Digital', 'Kindle Unlimited', 0.00, 34.90, 45.08, 'Não', 3.5, NULL, 'Lido'),
       ((SELECT id_livro FROM dim_livros WHERE titulo = 'Melodia prateada, chamas da noite'), '2026-06-01', '2026-06-18', 'Digital', 'Kindle Unlimited', 49.78, 49.78, 51.69, 'Não', 4.9, NULL, 'Lido'),
       ((SELECT id_livro FROM dim_livros WHERE titulo = 'Estrela Escura em brasas, neve caindo em cinzas'), '2026-06-22', '2026-07-02', 'Digital', 'Emprestimo', 0.00, 49.78, 51.69, 'Sim', 4.0, NULL, 'Lido'),
       ((SELECT id_livro FROM dim_livros WHERE titulo = 'Novos começos em Wildflower Lock'), '2026-07-27', '2026-08-30', 'Digital', 'Kindle Unlimited', 0.00, 5.99, 96.04, 'Não', 4.5, NULL, 'Lido'),
       ((SELECT id_livro FROM dim_livros WHERE titulo = 'Traduzindo dados: como transformar números em decisões'), '2026-08-26', NULL, 'Digital', 'Emprestimo', 0.00, 0.00, 62.95, 'Sim', 3,NULL,'Lendo'),
       ((SELECT id_livro FROM dim_livros WHERE titulo = 'Café e Bolo em Wildflower Lock'), '2026-09-03','2026-09-13','Digital','Kindle Unlimited', 0.00, 16.99, 96.15, 'Sim', 4.8, NULL ,'Lido'),
       ((SELECT id_livro FROM dim_livros WHERE titulo = 'Céus Azuis sobre Wildflower Lock'), '2026-09-15', '2026-09-24', 'Digital', 'Kindle Unlimited', 0.00, 19.99, 96.84, 'Sim', 4.0, NULL, 'Lido');

-- ==============================================
-- Atualização de dados na tabela livro_categoria 
-- ================== 09/10 =====================
INSERT INTO livro_categoria (id_livro, id_categoria)
VALUES 
       ((SELECT id_livro FROM dim_livros WHERE titulo = 'A lanterna das memórias perdidas'), (SELECT id_categoria FROM dim_categoria WHERE categoria = 'Fantasia')), 
       ((SELECT id_livro FROM dim_livros WHERE titulo = 'A lanterna das memórias perdidas'), (SELECT id_categoria FROM dim_categoria WHERE categoria = 'Ficção')),
       ((SELECT id_livro FROM dim_livros WHERE titulo = 'A lanterna das memórias perdidas'), (SELECT id_categoria FROM dim_categoria WHERE categoria = 'Literatura Asiática')),
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

-- ============================================================================
-- Atualizações das tabelas 28/10
-- ============================================================================
-- Alterações na tabela dim_livros, fato_leituras, concentrando as informações dos livros em uma única tabela
ALTER TABLE dim_livros
ADD COLUMN preco_digital DECIMAL(10, 2) DEFAULT 0.00,
ADD COLUMN preco_fisico DECIMAL(10, 2) DEFAULT 0.00;

-- Adiciona preços dos livros
UPDATE dim_livros d
SET d.preco_digital = COALESCE((
        SELECT f.preco_digital_na_leitura
        FROM fato_leituras f 
        WHERE f.id_livro = d.id_livro
    ), 0.00),
    d.preco_fisico = COALESCE((
        SELECT f.preco_fisico_na_leitura
        FROM fato_leituras f 
        WHERE f.id_livro = d.id_livro
    ), 0.00);

-- Tratando os preços nulos do dim_livros
UPDATE dim_livros 
SET preco_digital = 14.13
WHERE titulo = 'Como fazer amigos e influenciar pessoas';

UPDATE dim_livros 
SET preco_digital = 2.97
WHERE titulo = 'O jardim secreto';

UPDATE dim_livros 
SET preco_digital = 1.99
WHERE titulo = '15 Incríveis Truques Mentais: Facilite sua vida mudando sua mente';

UPDATE dim_livros 
SET preco_digital = 39.90,
    preco_fisico = 42.75
WHERE titulo = 'O guardião das coisas perdidas';

UPDATE dim_livros 
SET preco_digital = 14.90
WHERE titulo = 'Vida de gato';

UPDATE dim_livros 
SET preco_digital = 30.18
WHERE titulo = 'Uma tempestade de verão';

-- Remove as restrições (constraints) de preço primeiro
ALTER TABLE fato_leituras DROP CONSTRAINT chk_preco_digital;
ALTER TABLE fato_leituras DROP CONSTRAINT chk_preco_fisico;
ALTER TABLE fato_leituras DROP CONSTRAINT chk_valor_pago;

-- Remove as colunas da tabela
ALTER TABLE fato_leituras 
DROP COLUMN preco_digital_na_leitura,
DROP COLUMN preco_fisico_na_leitura,
DROP COLUMN valor_pago;

-- Trocando a origem_acesso de alguns livros
UPDATE fato_leituras 
SET origem_acesso = 'Cortesia'
WHERE id_livro IN (
    SELECT id_livro 
    FROM dim_livros 
    WHERE titulo = 'Resolva A Porra Dos Seus Problemas'
);

UPDATE fato_leituras 
SET origem_acesso = 'Cortesia'
WHERE id_livro IN (
    SELECT id_livro 
    FROM dim_livros 
    WHERE titulo = 'Se não fosse por você, eu não estaria aqui'
);


UPDATE fato_leituras 
SET origem_acesso = 'Cortesia'
WHERE id_livro IN (
    SELECT id_livro 
    FROM dim_livros 
    WHERE titulo = 'Se os gatos desaparecessem do mundo'
);

UPDATE fato_leituras 
SET origem_acesso = 'Cortesia'
WHERE id_livro IN (
    SELECT id_livro 
    FROM dim_livros 
    WHERE titulo = 'Traduzindo dados: como transformar números em decisões'
);
