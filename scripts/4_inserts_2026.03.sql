-- =====================
-- Updates 2026.mar.17
-- =====================

-- Padronizando as nacionalidades dos autores
UPDATE autores
SET nacionalidade = CASE 
    WHEN nacionalidade = 'Coreana' THEN 'Sul-Coreana'
    WHEN nacionalidade = 'Chinesa-Americana' THEN 'Chinesa'
    WHEN nacionalidade = 'Americana' THEN 'Estadunidense'
    WHEN nacionalidade = 'Japonês' THEN 'Japonesa'
    ELSE nacionalidade
END;

INSERT INTO autores (nome, nacionalidade) VALUES
    ('Judy I. Lin', 'Taiwanesa'),
    ('Sanaka Hiiragi', 'Japonesa');

INSERT INTO editoras (nome, pais) VALUES
    ('Galera', 'Brasil');

INSERT INTO assinatura (servico, valor_mensal, data_pagamento) VALUES
    ('Kindle Unlimited', 24.90, '2026-03-04');

INSERT INTO livros (titulo, id_autor, id_editora, id_categoria, ano_publicacao, numero_paginas, isbn) VALUES
    ('Uma magia destilada em veneno', 45, 29, 1, 2022, 403, '978-6559812172'),
    ('Um veneno doce e sombrio', 45, 29, 1, 2023, 370, '978-6559813018'),
    ('Meu Dom Quixote coreano', 37, 25, 1, 2025, 356, '978-6558384021'),
    ('A lanterna das memórias perdidas', 46, 25, 1, 2024, 183,'978-6558383109');

INSERT INTO leituras (id_livro, data_inicio, data_fim, valor_pago, formato, id_assinatura)
SELECT id_livro, '2026-02-02', '2026-02-14', 0, 'kindle', 
    (SELECT id_assinatura FROM assinatura WHERE DATE_FORMAT(data_pagamento, '%Y-%m-%d') = '2026-02-04') 
FROM livros WHERE titulo = 'Uma magia destilada em veneno'
UNION ALL
SELECT id_livro, '2026-02-16', '2026-02-27', 12.21, 'kindle', 
    (SELECT id_assinatura FROM assinatura WHERE DATE_FORMAT(data_pagamento, '%Y-%m-%d') = '2026-02-04') 
FROM livros WHERE titulo = 'Um veneno doce e sombrio'
UNION ALL
SELECT id_livro, '2026-02-28', '2026-03-13', 0, 'kindle', 
    (SELECT id_assinatura FROM assinatura WHERE DATE_FORMAT(data_pagamento, '%Y-%m-%d') = '2026-03-04') 
FROM livros WHERE titulo = 'Meu Dom Quixote coreano';

INSERT INTO avaliacoes (id_leitura, nota, opiniao_texto)
SELECT l.id_leitura, 4, 'A história é envolvente e o final fica em aberto, tendo que ler o próximo livro.'
FROM leituras l JOIN livros lv ON l.id_livro = lv.id_livro 
WHERE lv.titulo = 'Uma magia destilada em veneno'
UNION ALL
SELECT l.id_leitura, 4.5, 'Estava ansiosa para saber como a história terminava. Têm alguns pontos que não me agradou muito, mas recomendo a leitura da coleção "Os livros do Chá"'
FROM leituras l JOIN livros lv ON l.id_livro = lv.id_livro 
WHERE lv.titulo = 'Um veneno doce e sombrio'
UNION ALL
SELECT l.id_leitura, 4, ''
FROM leituras l JOIN livros lv ON l.id_livro = lv.id_livro 
WHERE lv.titulo = 'Meu Dom Quixote coreano'