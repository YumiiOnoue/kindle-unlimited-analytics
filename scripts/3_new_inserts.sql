-- =====================
-- Adicionando novos dados
-- =====================

-- 
-- Atualização do dia 04/03/2026
-- 
INSERT INTO autores (nome, nacionalidade) VALUES
    ('Gabrielle Zevin', 'Americana'),
    ('Won-pyung Sohn', 'Sul-Coreana'),
    ('Juhea Kim', 'Sul-Coreana'),
    ('Lucy Gilmore', 'Americana'),
    ('Clare Pooley', 'Britânica'),
    ('Emily Giffin', 'Americana'),
    ('Elena Armas', 'Espanhola'),
    ('Axie Oh', 'Americana'),
    ('Ruth Hogan', 'Britânica'),
    ('Lucilia Reale', 'Brasileira'),
    ('Louisa May Alcott', 'Americana'),
    ('Eva Woods', 'Irlandesa'),
    ('Michiko Aoyama', 'Japonesa'),
    ('K. L. Walther', 'Americana'),
    ('Abby Jimenez', 'Americana'),
    ('Paige Toon', 'Britânica');

INSERT INTO editoras (nome, pais) VALUES
    ('Lucília Reale', 'Brasil'),
    ('Melhoramentos', 'Brasil'),
    ('Buzz', 'Brasil'),
    ('Verus', 'Brasil'),
    ('Arqueiro', 'Brasil'),
    ('Planeta', 'Brasil'),
    ('Martin Claret', 'Brasil');

INSERT INTO categorias (nome_categoria) VALUES
    ('Casa e Estilo de Vida');

INSERT INTO assinatura (servico, valor_mensal, data_pagamento) VALUES
    ('Kindle Unlimited', 19.90, '2025-01-04'),
    ('Kindle Unlimited', 19.90, '2025-02-04'),
    ('Kindle Unlimited', 19.90, '2025-03-04'),
    ('Kindle Unlimited', 19.90, '2025-04-04'),
    ('Kindle Unlimited', 19.90, '2025-05-04'),
    ('Kindle Unlimited', 19.90, '2025-06-04'),
    ('Kindle Unlimited', 19.90, '2025-07-04'),
    ('Kindle Unlimited', 19.90, '2025-08-04'),
    ('Kindle Unlimited', 19.90, '2025-09-04'),
    ('Kindle Unlimited', 19.90, '2025-10-04'),
    ('Kindle Unlimited', 19.90, '2025-11-04'),
    ('Kindle Unlimited', 19.90, '2025-12-04');

INSERT INTO livros (titulo, id_autor, id_editora, id_categoria, ano_publicacao, numero_paginas, isbn) VALUES
    ('Amanhã, amanhã, e ainda outro amanhã', 5, 9, 2, 2022, 528, '978-6555951479'),
    ('Amêndoas', 6, 9, 2, 2023, 240, '978-6555951783'),
    ('Como tigres na neve', 7, 11, 2, 2022, 454, '978-6555395846'),
    ('Clube de leitura dos corações solitários', 8, 12, 2, 2024, 353, '978-6553933194'),
    ('O pequeno caderno das coisas não ditas', 9, 13, 3, 2022, 414, '978-6559240708'),
    ('As pessoas na plataforma 5', 9, 13, 3, 2024, 373, '978-6559243174'),
    ('Tudo que a gente sempre quis', 10, 14, 3, 2019, 366, '978-8580419450'),
    ('Um experimento de amor em Nova York', 11, 14, 6, 2023, 490, '978-6555654752'),
    ('A noiva do Deus Mar', 12, 11, 1, 2022, 251, '978-6555394474'),
    ('O guardião das coisas perdidas', 13, 13, 3, 2023, 322, '978-6559242139'),
    ('Vida de gato', 14, 10, 10, 2019, 26, 'ASIN:B07TFB3DL8'),
    ('Mulherzinhas', 15, 16, 2, 2019, 680, '978-8544002124'),
    ('Algo como ser feliz', 16, 13, 2, 2022, 481, '978-6559241255'),
    ('Chocolate quente às quintas-feiras', 17, 14, 2, 2024, 138, '978-6555656725'),
    ('Matcha às segundas-feiras', 17, 14, 2, 2025, 155, '978-6555658774'),
    ('Uma tempestade de verão', 18, 9, 3, 2023, 345, '978-6555951912'),
    ('Parte do meu mundo', 19, 14, 3, 2023, 419, '978-6555654899'),
    ('Sete verões', 20, 13, 3, 2024, 429, '978-6559243426');

INSERT INTO leituras (id_livro, data_inicio, data_fim, valor_pago, formato)
SELECT id_livro, '2024-12-23', '2025-01-15', 0, 'kindle' 
FROM livros WHERE titulo = 'Amanhã, amanhã, e ainda outro amanhã'
UNION ALL
SELECT id_livro, '2025-02-01', '2025-02-22', 0, 'kindle' 
FROM livros WHERE titulo = 'Amêndoas'
UNION ALL
SELECT id_livro, '2025-02-23', '2025-03-02', 0, 'kindle'
FROM livros WHERE titulo = 'Como tigres na neve'
UNION ALL
SELECT id_livro, '2025-03-03', '2025-04-01', 0, 'kindle'
FROM livros WHERE titulo = 'Clube de leitura dos corações solitários'
UNION ALL
SELECT id_livro, '2025-04-02', '2025-04-28', 0, 'kindle'
FROM livros WHERE titulo = 'O pequeno caderno das coisas não ditas'
UNION ALL
SELECT id_livro, '2025-04-29', '2025-05-12', 0, 'kindle'
FROM livros WHERE titulo = 'As pessoas na plataforma 5'
UNION ALL
SELECT id_livro, '2025-05-13', '2025-05-26', 0, 'kindle'
FROM livros WHERE titulo = 'Tudo que a gente sempre quis'
UNION ALL
SELECT id_livro, '2025-05-27', '2025-05-30', 0, 'kindle'
FROM livros WHERE titulo = 'Um experimento de amor em Nova York'
UNION ALL
SELECT id_livro, '2025-06-01', '2025-06-30', 0, 'kindle'
FROM livros WHERE titulo = 'A noiva do Deus Mar'
UNION ALL
SELECT id_livro, '2025-07-13', '2025-07-27', 0, 'kindle'
FROM livros WHERE titulo = 'O guardião das coisas perdidas'
UNION ALL
SELECT id_livro, '2025-07-28', '2025-07-30', 0, 'kindle'
FROM livros WHERE titulo = 'Vida de gato'
UNION ALL
SELECT id_livro, '2025-08-01', '2025-09-01', 0, 'kindle'
FROM livros WHERE titulo = 'Mulherzinhas'
UNION ALL
SELECT id_livro, '2025-09-02', '2025-09-27', 0, 'kindle'
FROM livros WHERE titulo = 'Algo como ser feliz'
UNION ALL
SELECT id_livro, '2025-09-28', '2025-10-13', 0, 'kindle'
FROM livros WHERE titulo = 'Chocolate quente às quintas-feiras'     
UNION ALL
SELECT id_livro, '2025-10-14', '2025-10-31', 0, 'kindle'
FROM livros WHERE titulo = 'Matcha às segundas-feiras'
UNION ALL
SELECT id_livro, '2025-11-01', '2025-11-16', 0, 'kindle'
FROM livros WHERE titulo = 'Uma tempestade de verão'
UNION ALL
SELECT id_livro, '2025-11-17', '2025-11-30', 0, 'kindle'
FROM livros WHERE titulo = 'Parte do meu mundo' 
UNION ALL
SELECT id_livro, '2025-12-01', '2025-12-20', 0, 'kindle'
FROM livros WHERE titulo = 'Sete verões';



INSERT INTO avaliacoes (id_leitura, nota, opiniao_texto)
SELECT l.id_leitura, 3.5, 'É um livro denso, demorei um pouco para me envolver com a história.'
FROM leituras l JOIN livros lv ON l.id_livro = lv.id_livro 
WHERE lv.titulo = 'Amanhã, amanhã, e ainda outro amanhã'
UNION ALL
SELECT l.id_leitura, 3.5, ''
FROM leituras l JOIN livros lv ON l.id_livro = lv.id_livro
WHERE lv.titulo = 'Amêndoas'
UNION ALL
SELECT l.id_leitura, 3.0, ''
FROM leituras l JOIN livros lv ON l.id_livro = lv.id_livro
WHERE lv.titulo = 'Como tigres na neve'
UNION ALL       
SELECT l.id_leitura, 4.0, ''
FROM leituras l JOIN livros lv ON l.id_livro = lv.id_livro
WHERE lv.titulo = 'Clube de leitura dos corações solitários'
UNION ALL
SELECT l.id_leitura, 4.0, ''
FROM leituras l JOIN livros lv ON l.id_livro = lv.id_livro
WHERE lv.titulo = 'O pequeno caderno das coisas não ditas'      
UNION ALL
SELECT l.id_leitura, 5.0, 'Amei esse livro! Cada personagem tem uma história tão rica e a trama é super envolvente.'
FROM leituras l JOIN livros lv ON l.id_livro = lv.id_livro
WHERE lv.titulo = 'As pessoas na plataforma 5'
UNION ALL
SELECT l.id_leitura, 3.0, ''
FROM leituras l JOIN livros lv ON l.id_livro = lv.id_livro
WHERE lv.titulo = 'Tudo que a gente sempre quis'
UNION ALL
SELECT l.id_leitura, 5.0, 'Uma leitura viciante! Amei o desenvolvimento dos personagens e a trama envolvente.'
FROM leituras l JOIN livros lv ON l.id_livro = lv.id_livro
WHERE lv.titulo = 'Um experimento de amor em Nova York'
UNION ALL
SELECT l.id_leitura, 4.0, ''
FROM leituras l JOIN livros lv ON l.id_livro = lv.id_livro
WHERE lv.titulo = 'A noiva do Deus Mar'
UNION ALL
SELECT l.id_leitura, 3.0, 'Achei que a história seria contada do ponto de vista do guardião, mas foi narrada do ponto de vista da protagonista.'
FROM leituras l JOIN livros lv ON l.id_livro = lv.id_livro
WHERE lv.titulo = 'O guardião das coisas perdidas'
UNION ALL
SELECT l.id_leitura, 3.0, 'É uma leitura rápida, mas não me cativou tanto quanto eu esperava.'
FROM leituras l JOIN livros lv ON l.id_livro = lv.id_livro
WHERE lv.titulo = 'Vida de gato'    
UNION ALL
SELECT l.id_leitura, 4.0, ''
FROM leituras l JOIN livros lv ON l.id_livro = lv.id_livro
WHERE lv.titulo = 'Mulherzinhas'    
UNION ALL
SELECT l.id_leitura, 3.0, ''
FROM leituras l JOIN livros lv ON l.id_livro = lv.id_livro
WHERE lv.titulo = 'Algo como ser feliz'
UNION ALL
SELECT l.id_leitura, 4.0, 'É uma leitura divertida e leve, perfeita para relaxar e se distrair. Só queria saber mais sobre os personagens. Fiquei curiosa de como eles estão depois do final do livro.'
FROM leituras l JOIN livros lv ON l.id_livro = lv.id_livro
WHERE lv.titulo = 'Chocolate quente às quintas-feiras'
UNION ALL
SELECT l.id_leitura, 4.0, 'A história se passa na mesma cafeteria do livro anterior, mas com personagens diferentes.'
FROM leituras l JOIN livros lv ON l.id_livro = lv.id_livro
WHERE lv.titulo = 'Matcha às segundas-feiras'
UNION ALL
SELECT l.id_leitura, 3.0, ''
FROM leituras l JOIN livros lv ON l.id_livro = lv.id_livro
WHERE lv.titulo = 'Uma tempestade de verão'
UNION ALL
SELECT l.id_leitura, 3.0, ''
FROM leituras l JOIN livros lv ON l.id_livro = lv.id_livro
WHERE lv.titulo = 'Parte do meu mundo'
UNION ALL
SELECT l.id_leitura, 3.0, 'Achei massante a história da protagonista e o final não me agradou.'
FROM leituras l JOIN livros lv ON l.id_livro = lv.id_livro
WHERE lv.titulo = 'Sete verões';



