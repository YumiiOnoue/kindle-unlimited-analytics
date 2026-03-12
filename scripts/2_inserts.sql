INSERT INTO autores (nome, nacionalidade) VALUES 
    ('Haruki Murakami', 'Japonês'),
    ('R.F. Kuang', 'Chinesa-Americana'),
    ('You Yeong Gwang', 'Sul-Coreana'),
    ('Sophie Kinsella', 'Britânica');

INSERT INTO editoras (nome, pais) VALUES 
    ('Bloomsbury', 'Reino Unido'),
    ('Bantam Books', 'Estados Unidos'),
    ('Shinchosha', 'Japão'),
    ('Livros da Alice', 'Brasil'),
    ('Companhia das Letras', 'Brasil'),
    ('Record', 'Brasil'),
    ('Intrínseca', 'Brasil'),
    ('Suma de Letras', 'Brasil'),
    ('Rocco', 'Brasil');


INSERT INTO categorias (nome_categoria) VALUES 
    ('Fantasia'),
    ('Ficção'),
    ('Romance'),
    ('Mistério'),
    ('Não Ficção'),
    ('Comédia'),
    ('Drama'),
    ('Economia'),
    ('Tecnologia');


INSERT INTO livros (titulo, id_autor, id_editora, id_categoria, ano_publicacao, numero_paginas, isbn) VALUES 
    ('Yellowface', 2, 3, 2, 2023, 346, '978-8551010082'),
    ('A loja dos dias de chuva', 3, 4, 1, 2025, 253, '978-6585659253'),
    ('O burnout', 4, 6, 6, 2024, 396, '978-6555877731'); 


INSERT INTO assinatura (servico, valor_mensal, data_pagamento) VALUES
    ('Kindle Unlimited', 19.90, '2026-01-04'),
    ('Kindle Unlimited', 24.90, '2026-02-04');

INSERT INTO leituras (id_livro, data_inicio, data_fim, valor_pago, formato, id_assinatura)
SELECT id_livro, '2025-12-22', '2026-01-12', 0.00, 'kindle', 
    (SELECT id_assinatura FROM assinatura WHERE DATE_FORMAT(data_pagamento, '%Y-%m-%d') = '2026-01-04') 
FROM livros WHERE titulo = 'Yellowface'
UNION ALL
SELECT id_livro, '2026-01-13', '2026-01-25', 0.00, 'kindle',
    (SELECT id_assinatura FROM assinatura WHERE DATE_FORMAT(data_pagamento, '%Y-%m-%d') = '2026-01-04') 
FROM livros WHERE titulo = 'A loja dos dias de chuva'
UNION ALL
SELECT id_livro, '2026-01-26', '2026-02-01', 0.00, 'kindle',
    (SELECT id_assinatura FROM assinatura WHERE DATE_FORMAT(data_pagamento, '%Y-%m-%d') = '2026-02-04') 
FROM livros WHERE titulo = 'O burnout';



INSERT INTO avaliacoes (id_leitura, nota, opiniao_texto)
SELECT l.id_leitura, 4.5, 'É um livro intrigante, que te deixa pensativa e revoltada. A escrita da autora é muito envolvente.'
FROM leituras l JOIN livros lv ON l.id_livro = lv.id_livro 
WHERE lv.titulo = 'Yellowface'
UNION ALL
SELECT l.id_leitura, 4.0, 'É um livro leve e divertido, perfeito para passar o tempo.'
FROM leituras l JOIN livros lv ON l.id_livro = lv.id_livro 
WHERE lv.titulo = 'A loja dos dias de chuva'
UNION ALL
SELECT l.id_leitura, 3.5, 'O começo do livro é interessante, me identifiquei em algumas partes, mas o final me decepcionou um pouco.'
FROM leituras l JOIN livros lv ON l.id_livro = lv.id_livro 
WHERE lv.titulo = 'O burnout';