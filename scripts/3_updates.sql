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
INSERT INTO fato_leituras (id_livro, data_inicio, data_fim, formato, origem_acesso, valor_pago, preco_digital_na_leitura, preco_fisico_na_leitura, intencao_compra, nota, opiniao_texto, status_leitura)
VALUES 
       (52, '2026-03-14', '2026-03-19', 'Digital', 'Kindle Unlimited', 0.00, 35.91, 59.90, 'Sim', 4.5, NULL, 'Lido'),
       (63, '2026-04-14', '2026-04-14', 'Físico', 'Emprestimo', 0.00, 0.00, 35.18, 'Não', 5, NULL, 'Lido'),
       (64, '2026-04-27', '2026-05-08', 'Digital', 'Kindle Unlimited', 9.99, 9.99, 46.70, 'Não', 3, NULL, 'Lido'),
       (65, '2026-05-11', '2026-05-25', 'Digital', 'Kindle Unlimited', 0.00, 34.90, 45.08, 'Não', 3.5, NULL, 'Lido'),
       (66, '2026-06-01', '2026-06-18', 'Digital', 'Kindle Unlimited', 49.78, 49.78, 51.69, 'Não', 4.9, NULL, 'Lido'),
       (67, '2026-06-22', '2026-07-02', 'Digital', 'Emprestimo', 0.00, 49.78, 51.69, 'Sim', 4, NULL, 'Lido'),
       (68, '2026-07-27', '2026-08-30', 'Digital', 'Kindle Unlimited', 0.00, 5.99, 96.04, 'Não', 4.5, NULL, 'Lido'),
       (69, '2026-08-26', NULL, 'Digital', 'Emprestimo', 0.00, 0.00, 62.95, 'Indefinido', 3,NULL,'Lendo'),
       (70, '2026-09-03','2026-09-13','Digital','Kindle Unlimited', 0.00, 16.99, 96.15, 'Sim', 4.8, NULL ,'Lido'),
       (71, '2026-09-15', '2026-09-24', 'Digital', 'Kindle Unlimited', 0.00, 19.99, 96.84, 'Sim', 4.0, NULL, 'Lido');

-- ==============================================
-- Atualização de dados na tabela livro_categoria 
-- ================== 09/10 =====================
INSERT INTO livro_categoria (id_livro, id_categoria)
VALUES 
       (52, 12), -- A lanterna das memorias perdidas
       (52, 13),
       (52, 19),
       (63, 21), -- Maruru e Hachi
       (64, 26), -- Um amor como nos livros - Ficção
       (65, 26), -- Mapa do Coração - Romance
       (66, 12), -- Melodia prateada, chamas da noite - Fantasia
       (66, 13),
       (67, 12), -- Estrela Escura em brasas, neve caindo em cinzas - Fantasia
       (67, 13),
       (68, 26), -- Novos começos em Wildflower Lock - Romance
       (69, 28), -- Traduzindo dados: como transformar números em decisões - Não-ficção
       (69, 24),
       (69, 7),
       (70, 26), -- Café e Bolo em Wildflower Lock - Romance
       (71, 26); -- Céus Azuis sobre Wildflower Lock - Romance