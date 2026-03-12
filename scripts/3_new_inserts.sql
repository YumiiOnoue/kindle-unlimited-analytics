-- =====================
-- Adicionando novos dados
-- =====================

-- ===================
-- LEITURAS DE 2025
-- ===================
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

-- LEITURAS
INSERT INTO leituras (id_livro, data_inicio, data_fim, valor_pago, formato, id_assinatura)
SELECT id_livro, '2024-12-23', '2025-01-15', 0, 'kindle', 
    (SELECT id_assinatura FROM assinatura WHERE DATE_FORMAT(data_pagamento, '%Y-%m-%d') = '2025-01-04') 
FROM livros WHERE titulo = 'Amanhã, amanhã, e ainda outro amanhã'
UNION ALL
SELECT id_livro, '2025-02-01', '2025-02-22', 0, 'kindle', 
    (SELECT id_assinatura FROM assinatura WHERE DATE_FORMAT(data_pagamento, '%Y-%m-%d') = '2025-02-04') 
FROM livros WHERE titulo = 'Amêndoas'
UNION ALL
SELECT id_livro, '2025-02-23', '2025-03-02', 0, 'kindle',
    (SELECT id_assinatura FROM assinatura WHERE DATE_FORMAT(data_pagamento, '%Y-%m-%d') = '2025-02-04') 
FROM livros WHERE titulo = 'Como tigres na neve'
UNION ALL
SELECT id_livro, '2025-03-03', '2025-04-01', 0, 'kindle',
    (SELECT id_assinatura FROM assinatura WHERE DATE_FORMAT(data_pagamento, '%Y-%m-%d') = '2025-03-04') 
FROM livros WHERE titulo = 'Clube de leitura dos corações solitários'
UNION ALL
SELECT id_livro, '2025-04-02', '2025-04-28', 0, 'kindle',
    (SELECT id_assinatura FROM assinatura WHERE DATE_FORMAT(data_pagamento, '%Y-%m-%d') = '2025-04-04') 
FROM livros WHERE titulo = 'O pequeno caderno das coisas não ditas'
UNION ALL
SELECT id_livro, '2025-04-29', '2025-05-12', 0, 'kindle', 
    (SELECT id_assinatura FROM assinatura WHERE DATE_FORMAT(data_pagamento, '%Y-%m-%d') = '2025-05-04') 
FROM livros WHERE titulo = 'As pessoas na plataforma 5'
UNION ALL
SELECT id_livro, '2025-05-13', '2025-05-26', 0, 'kindle', 
    (SELECT id_assinatura FROM assinatura WHERE DATE_FORMAT(data_pagamento, '%Y-%m-%d') = '2025-05-04') 
FROM livros WHERE titulo = 'Tudo que a gente sempre quis'
UNION ALL
SELECT id_livro, '2025-05-27', '2025-05-30', 0, 'kindle', 
    (SELECT id_assinatura FROM assinatura WHERE DATE_FORMAT(data_pagamento, '%Y-%m-%d') = '2025-05-04') 
FROM livros WHERE titulo = 'Um experimento de amor em Nova York'
UNION ALL
SELECT id_livro, '2025-06-01', '2025-06-30', 0, 'kindle', 
    (SELECT id_assinatura FROM assinatura WHERE DATE_FORMAT(data_pagamento, '%Y-%m-%d') = '2025-06-04') 
FROM livros WHERE titulo = 'A noiva do Deus Mar'
UNION ALL
SELECT id_livro, '2025-07-13', '2025-07-27', 0, 'kindle', 
    (SELECT id_assinatura FROM assinatura WHERE DATE_FORMAT(data_pagamento, '%Y-%m-%d') = '2025-07-04') 
FROM livros WHERE titulo = 'O guardião das coisas perdidas'
UNION ALL
SELECT id_livro, '2025-07-28', '2025-07-30', 0, 'kindle', 
    (SELECT id_assinatura FROM assinatura WHERE DATE_FORMAT(data_pagamento, '%Y-%m-%d') = '2025-07-04') 
FROM livros WHERE titulo = 'Vida de gato'
UNION ALL
SELECT id_livro, '2025-08-01', '2025-09-01', 0, 'kindle', 
    (SELECT id_assinatura FROM assinatura WHERE DATE_FORMAT(data_pagamento, '%Y-%m-%d') = '2025-08-04') 
FROM livros WHERE titulo = 'Mulherzinhas'
UNION ALL
SELECT id_livro, '2025-09-02', '2025-09-27', 0, 'kindle', 
    (SELECT id_assinatura FROM assinatura WHERE DATE_FORMAT(data_pagamento, '%Y-%m-%d') = '2025-09-04') 
FROM livros WHERE titulo = 'Algo como ser feliz'
UNION ALL
SELECT id_livro, '2025-09-28', '2025-10-13', 0, 'kindle', 
    (SELECT id_assinatura FROM assinatura WHERE DATE_FORMAT(data_pagamento, '%Y-%m-%d') = '2025-10-04') 
FROM livros WHERE titulo = 'Chocolate quente às quintas-feiras'     
UNION ALL
SELECT id_livro, '2025-10-14', '2025-10-31', 0, 'kindle', 
    (SELECT id_assinatura FROM assinatura WHERE DATE_FORMAT(data_pagamento, '%Y-%m-%d') = '2025-10-04') 
FROM livros WHERE titulo = 'Matcha às segundas-feiras'
UNION ALL
SELECT id_livro, '2025-11-01', '2025-11-16', 0, 'kindle', 
    (SELECT id_assinatura FROM assinatura WHERE DATE_FORMAT(data_pagamento, '%Y-%m-%d') = '2025-11-04') 
FROM livros WHERE titulo = 'Uma tempestade de verão'
UNION ALL
SELECT id_livro, '2025-11-17', '2025-11-30', 0, 'kindle', 
    (SELECT id_assinatura FROM assinatura WHERE DATE_FORMAT(data_pagamento, '%Y-%m-%d') = '2025-11-04') 
FROM livros WHERE titulo = 'Parte do meu mundo' 
UNION ALL
SELECT id_livro, '2025-12-01', '2025-12-20', 0, 'kindle', 
    (SELECT id_assinatura FROM assinatura WHERE DATE_FORMAT(data_pagamento, '%Y-%m-%d') = '2025-12-04') 
FROM livros WHERE titulo = 'Sete verões';

-- AVALIÇÕES
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


-- ======================
-- Leitura de 2021
-- ======================
INSERT INTO autores (nome, nacionalidade) VALUES
    ('Jenny Han', 'Americana' ),
    ('Robert T. Kiyosaki', 'Americana'),
    ('Maya Angelou', 'Americana'),
    ('John Green', 'Americana'),
    ('Frances Hodgson Burnett', 'Britânica'),
    ('Charles Duhigg', 'Americana'),
    ('Dale Carnegie', 'Americana'),
    ('George Orwell', 'Britânica'),
    ('Paulo Vieira', 'Brasileira'),
    ('Alec Silva','Brasileira'),
    ('Laura Jane Williams', 'Britânica');

INSERT INTO editoras (nome, pais) VALUES
    ('Sextante', 'Brasil'),
    ('Zahar', 'Brasil'),
    ('Alta Books', 'Brasil'),
    ('Seguinte', 'Brasil'),
    ('Astral Cultural', 'Brasil'),
    ('Gente', 'Brasil'),
    ('Objetiva', 'Brasil'),
    ('Companhia Editora Nacional', 'Brasil');

INSERT INTO categorias (nome_categoria) VALUES
    ('Educação Financeira'),
    ('Autobiografia'),
    ('Autoajuda'),
    ('Literatura Infantil'),
    ('Biografia');

INSERT INTO livros (titulo, id_autor, id_editora, id_categoria, ano_publicacao, numero_paginas, isbn) VALUES
    ('Pai Rico, Pai Pobre', 22, 19, 11, 2017, 322, '978-8550801483'),
    ('1984', 28, 5, 2, 2009, 416, '978-8535914849'),
    ('Eu sei por que o pássaro canta na gaiola', 23, 21, 12, 2018, 336, '978-8582467190'),
    ('Para Todos os Garotos que Já Amei', 21, 7, 3, 2015, 320, '978-8580577266'),
    ('P.S.: Ainda Amo Você', 21, 7, 3, 2016, 304, '978-8580578690'),
    ('Agora e Para Sempre, Lara Jean', 21, 7, 3, 2017, 304, '978-8551001981'),
    ('Como fazer amigos e influenciar pessoas', 27, 24 , 13, 2003, 318, '978-8543108698'),
    ('O poder do hábito', 26, 23, 13, 2012, 407,'978-8539004119'),
    ('O jardim secreto', 25, 5, 14, 2013, 344, '978-8563560605'),
    ('Cidades de Papel', 24, 7, 3, 2013, 368, '978-8580573749'),
    ('Decifre e Influencie Pessoas', 29, 22, 13, 2018, 224, '978-8545202516'),
    ('Resolva A Porra Dos Seus Problemas', 31, 21, 13, 2018, 224, '978-8582467459'),
    ('Se não fosse por você, eu não estaria aqui', 29, 20, 15, 2020, 102, '978-8554517861');

-- LEITURA

INSERT INTO leituras (id_livro, data_inicio, data_fim, valor_pago, formato)
SELECT id_livro, '2021-01-10', '2021-01-20', 14.15, 'kindle'
FROM livros WHERE titulo = 'Pai Rico, Pai Pobre'
UNION ALL
SELECT id_livro, '2021-02-01', '2021-02-28', 0, 'kindle'
FROM livros WHERE titulo = '1984'
UNION ALL
SELECT id_livro, '2021-03-01', '2021-03-31', 0, 'kindle'
FROM livros WHERE titulo = 'Eu sei por que o pássaro canta na gaiola'
UNION ALL
SELECT id_livro, '2021-04-01', '2021-04-30', 28.90, 'físico'
FROM livros WHERE titulo = 'Para Todos os Garotos que Já Amei'
UNION ALL
SELECT id_livro, '2021-05-01', '2021-05-31', 28.90, 'físico'
FROM livros WHERE titulo = 'P.S.: Ainda Amo Você'
UNION ALL
SELECT id_livro, '2021-06-01', '2021-06-30', 28.90, 'físico'
FROM livros WHERE titulo = 'Agora e Para Sempre, Lara Jean'
UNION ALL
SELECT id_livro, '2021-07-01', '2021-07-31', 0, 'kindle'
FROM livros WHERE titulo = 'Como fazer amigos e influenciar pessoas'
UNION ALL
SELECT id_livro, '2021-08-01', '2021-08-31', 0, 'kindle'
FROM livros WHERE titulo = 'O poder do hábito'
UNION ALL
SELECT id_livro, '2021-09-01', '2021-09-30', 0, 'kindle'
FROM livros WHERE titulo = 'O jardim secreto'
UNION ALL
SELECT id_livro, '2021-10-01', '2021-10-31', 22.64, 'físico'
FROM livros WHERE titulo = 'Cidades de Papel'
UNION ALL
SELECT id_livro, '2021-11-01', '2021-11-16', 0, 'kindle'
FROM livros WHERE titulo = 'Decifre e Influencie Pessoas'
UNION ALL
SELECT id_livro, '2021-11-17', '2021-11-30', 0, 'kindle'
FROM livros WHERE titulo = 'Resolva A Porra Dos Seus Problemas'
UNION ALL
SELECT id_livro, '2021-12-01', '2021-12-20', 0, 'kindle'
FROM livros WHERE titulo = 'Se não fosse por você, eu não estaria aqui';    

-- AVALIAÇÕES

INSERT INTO avaliacoes (id_leitura, nota, opiniao_texto)
SELECT l.id_leitura, 4, ''
FROM leituras l JOIN livros li ON l.id_livro = li.id_livro
WHERE li.titulo = 'Pai Rico, Pai Pobre'
UNION ALL
SELECT l.id_leitura, 4.5, 'Um clássico da literatura distópica, muito relevante para os dias atuais.'
FROM leituras l JOIN livros li ON l.id_livro = li.id_livro
WHERE li.titulo = '1984'
UNION ALL
SELECT l.id_leitura, 3.5, ''
FROM leituras l JOIN livros li ON l.id_livro = li.id_livro
WHERE li.titulo = 'Eu sei por que o pássaro canta na gaiola'
UNION ALL
SELECT l.id_leitura, 4.5, 'Li esse livro por causa do filme.'
FROM leituras l JOIN livros li ON l.id_livro = li.id_livro
WHERE li.titulo = 'Para Todos os Garotos que Já Amei'
UNION ALL
SELECT l.id_leitura, 4, ''
FROM leituras l JOIN livros li ON l.id_livro = li.id_livro
WHERE li.titulo = 'P.S.: Ainda Amo Você'
UNION ALL
SELECT l.id_leitura, 4.5, ''
FROM leituras l JOIN livros li ON l.id_livro = li.id_livro
WHERE li.titulo = 'Agora e Para Sempre, Lara Jean'
UNION ALL
SELECT l.id_leitura, 4.5, 'Um ótimo livro para aprender a lidar com pessoas.'
FROM leituras l JOIN livros li ON l.id_livro = li.id_livro
WHERE li.titulo = 'Como fazer amigos e influenciar pessoas'
UNION ALL
SELECT l.id_leitura, 3.5, ''
FROM leituras l JOIN livros li ON l.id_livro = li.id_livro
WHERE li.titulo = 'O poder do hábito'
UNION ALL
SELECT l.id_leitura, 4, 'Um clássico da literatura infantil, uma história encantadora sobre amizade e descoberta.'
FROM leituras l JOIN livros li ON l.id_livro = li.id_livro
WHERE li.titulo = 'O jardim secreto'    
UNION ALL
SELECT l.id_leitura, 3, ''
FROM leituras l JOIN livros li ON l.id_livro = li.id_livro
WHERE li.titulo = 'Cidades de Papel'
UNION ALL
SELECT l.id_leitura, 4, ''
FROM leituras l JOIN livros li ON l.id_livro = li.id_livro
WHERE li.titulo = 'Decifre e Influencie Pessoas'
UNION ALL
SELECT l.id_leitura, 3.5, ''
FROM leituras l JOIN livros li ON l.id_livro = li.id_livro
WHERE li.titulo = 'Resolva A Porra Dos Seus Problemas'
UNION ALL
SELECT l.id_leitura, 3.5, ''
FROM leituras l JOIN livros li ON l.id_livro = li.id_livro
WHERE li.titulo = 'Se não fosse por você, eu não estaria aqui';

-- Assinatura do kindle unlimited 
INSERT INTO assinatura (servico, valor_mensal, data_pagamento) VALUES
    ('Kindle Unlimited', 19.90, '2024-12-04');

-- ========================
-- Inserindo dados de 2023
-- ========================

INSERT INTO autores (nome, nacionalidade) VALUES
    ('Cornelia Maria Funke', 'Alemã');

INSERT INTO livros (titulo, id_autor, id_editora, id_categoria, ano_publicacao, numero_paginas, isbn) VALUES
    ('Sangue de Tinta', 32, 20, 1, 2009, 560, '978-8535915761');

INSERT INTO leituras (id_livro, data_inicio, data_fim, valor_pago, formato)
SELECT id_livro, '2023-08-09', '2023-12-31', 0, 'físico'
FROM livros WHERE titulo = 'Sangue de Tinta';

INSERT INTO avaliacoes (id_leitura, nota, opiniao_texto)
SELECT l.id_leitura, 4, 'É um livro denso, demorei um pouco para me envolver com a história.'
FROM leituras l JOIN livros lv ON l.id_livro = lv.id_livro 
WHERE lv.titulo = 'Sangue de Tinta';

-- ========================
-- Inserindo dados de 2024
-- ========================
INSERT INTO autores (nome, nacionalidade) VALUES
    ('Hwang Bo-Reum', 'Coreana'),
    ('Leonard Mlodinow', 'Americana'),
    ('Genki Kawamura', 'Japonesa'),
    ('Syou Ishida', 'Japonesa'),
    ('Kim Ho-Yeon', 'Coreana'),
    ('Sosuke Natsukawa', 'Japonesa'),
    ('Danilo H. Gomes', 'Brasileira'),
    ('Daniel Kondo', 'Brasileira'),
    ('Baek Sehee', 'Coreana'),
    ('Fredrik Backman', 'Sueca'),
    ('Rosa Silva', 'Brasileira'),
    ('Satoshi Yagisawa', 'Japonesa');

INSERT INTO editoras (nome, pais) VALUES
    ('Bertrand Brasil', 'Brasil'),
    ('Independente', 'Brasil'),
    ('Universo das Livros', 'Brasil'),
    ('Estação Liberdade', 'Brasil');

INSERT INTO categorias (nome_categoria) VALUES
    ('Ciências Sociais'),
    ('Ficção de Cura');

INSERT INTO livros (titulo, id_autor, id_editora, id_categoria, ano_publicacao, numero_paginas, isbn) VALUES
    ('O andar do bêbado: Como o acaso determina nossas vidas', 34, 18, 16, 2009, 264, '978-8537801550'),
    ('Se os gatos desaparecessem do mundo', 35, 25, 1, 2023, 176, '978-6558382867'),
    ('Vou te receitar um gato', 36, 7, 17, 2023, 224, '978-8551009796'),
    ('A inconveniente loja de conveniência', 37, 25, 17, 2023, 270, '978-6558382447'),
    ('O gato que amava livros', 38, 15, 17, 2022, 240, '978-6555357783'),
    ('15 Incríveis Truques Mentais: Facilite sua vida mudando sua mente', 39, 26, 13, 2019, 49, 'ASIN:B07S5XB91G'),
    ('Entregas expressas da Kiki', 40, 28, 3, 2021, 236, '9786586068221'),
    ('Queria morrer, mas no céu não tem tteokbokki', 41, 27, 13, 2023, 192, '978-6556093765'),
    ('Gente ansiosa', 42, 9, 3, 2021, 368, '978-6555321111'),
    ('O Gato Preto que Só Queria Ser Amado', 43, 26, 14, 2021, 89, 'ASIN:B08ZYJ77JX'),
    ('Uma noite na livraria Morisaki', 44, 25, 17, 2024, 175, ' 978-6558383185'),
    ('Meus dias na livraria Morisaki', 44, 25, 17, 2023, 167, '978-6558382461'),
    ('Bem-vindos à livraria Hyunam-dong', 33, 7, 17, 2023, 272, '978-6555606355');

-- LEITURAS 2024
INSERT INTO leituras (id_livro, data_inicio, data_fim, valor_pago, formato)
SELECT id_livro, '2024-01-02', '2024-01-30', 0, 'kindle'
FROM livros WHERE titulo = 'O andar do bêbado: Como o acaso determina nossas vidas'
UNION ALL
SELECT id_livro, '2024-02-02', '2024-02-15', 0, 'kindle'
FROM livros WHERE titulo = 'Se os gatos desaparecessem do mundo'
UNION ALL
SELECT id_livro, '2024-03-02', '2024-03-21', 0, 'kindle' 
FROM livros WHERE titulo = 'Vou te receitar um gato'
UNION ALL
SELECT id_livro, '2024-03-27', '2024-04-28', 0, 'kindle'
FROM livros WHERE titulo = 'A inconveniente loja de conveniência'
UNION ALL
SELECT id_livro, '2024-05-03', '2024-05-14', 0, 'kindle'
FROM livros WHERE titulo = 'O gato que amava livros'
UNION ALL
SELECT id_livro, '2024-06-02', '2024-06-02', 0, 'kindle'
FROM livros WHERE titulo = '15 Incríveis Truques Mentais: Facilite sua vida mudando sua mente'
UNION ALL
SELECT id_livro, '2024-06-14', '2024-07-02', 0, 'kindle'
FROM livros WHERE titulo = 'Entregas expressas da Kiki'
UNION ALL
SELECT id_livro, '2024-07-05', '2024-07-30', 0, 'kindle' 
FROM livros WHERE titulo = 'Queria morrer, mas no céu não tem tteokbokki'
UNION ALL
SELECT id_livro, '2024-08-02', '2024-08-27', 0, 'kindle' 
FROM livros WHERE titulo = 'Gente ansiosa'
UNION ALL
SELECT id_livro, '2024-09-06', '2024-09-18', 0, 'kindle' 
FROM livros WHERE titulo = 'O Gato Preto que Só Queria Ser Amado'
UNION ALL
SELECT id_livro, '2024-11-02', '2024-11-14', 0, 'kindle' 
FROM livros WHERE titulo = 'Uma noite na livraria Morisaki';

INSERT INTO leituras (id_livro, data_inicio, data_fim, valor_pago, formato, id_assinatura)
SELECT id_livro, '2024-11-21', '2024-11-30', 0, 'kindle',  
    (SELECT id_assinatura FROM assinatura WHERE DATE_FORMAT(data_pagamento, '%Y-%m-%d') = '2024-11-04')
FROM livros WHERE titulo = 'Meus dias na livraria Morisaki'
UNION ALL
SELECT id_livro, '2024-12-02', '2024-12-31', 0, 'kindle', 
    (SELECT id_assinatura FROM assinatura WHERE DATE_FORMAT(data_pagamento, '%Y-%m-%d') = '2024-12-04')
FROM livros WHERE titulo = 'Bem-vindos à livraria Hyunam-dong';

-- AVALIAÇÕES 2024
INSERT INTO avaliacoes (id_leitura, nota, opiniao_texto)
SELECT l.id_leitura, 4, ''
FROM leituras l JOIN livros lv ON l.id_livro = lv.id_livro 
WHERE lv.titulo = 'O andar do bêbado: Como o acaso determina nossas vidas'
UNION ALL
SELECT l.id_leitura, 4, ''
FROM leituras l JOIN livros lv ON l.id_livro = lv.id_livro 
WHERE lv.titulo = 'Se os gatos desaparecessem do mundo'
UNION ALL
SELECT l.id_leitura, 4, 'É um livro fofo com várias histórias.'
FROM leituras l JOIN livros lv ON l.id_livro = lv.id_livro 
WHERE lv.titulo = 'Vou te receitar um gato'
UNION ALL
SELECT l.id_leitura, 5, 'Amei esse livro. É aquele livro que você  lê e se identifica com os personagens.'
FROM leituras l JOIN livros lv ON l.id_livro = lv.id_livro 
WHERE lv.titulo = 'Bem-vindos à livraria Hyunam-dong'
UNION ALL
SELECT l.id_leitura, 4, ''
FROM leituras l JOIN livros lv ON l.id_livro = lv.id_livro 
WHERE lv.titulo = 'Meus dias na livraria Morisaki'
UNION ALL
SELECT l.id_leitura, 4, ''
FROM leituras l JOIN livros lv ON l.id_livro = lv.id_livro 
WHERE lv.titulo = 'Uma noite na livraria Morisaki'
UNION ALL
SELECT l.id_leitura, 3.5, ''
FROM leituras l JOIN livros lv ON l.id_livro = lv.id_livro 
WHERE lv.titulo = 'O Gato Preto que Só Queria Ser Amado'
UNION ALL
SELECT l.id_leitura, 4, ''
FROM leituras l JOIN livros lv ON l.id_livro = lv.id_livro 
WHERE lv.titulo = 'Gente ansiosa'
UNION ALL
SELECT l.id_leitura, 3.5, 'É um livro mais pesado. É melhor ler quando você estiver se sentindo bem emocionalmente.'
FROM leituras l JOIN livros lv ON l.id_livro = lv.id_livro 
WHERE lv.titulo = 'Queria morrer, mas no céu não tem tteokbokki'
UNION ALL
SELECT l.id_leitura, 3.5, ''
FROM leituras l JOIN livros lv ON l.id_livro = lv.id_livro 
WHERE lv.titulo = 'Entregas expressas da Kiki'
UNION ALL
SELECT l.id_leitura, 3.5, 'Demorei um pouco para me envolver com os personagens.'
FROM leituras l JOIN livros lv ON l.id_livro = lv.id_livro 
WHERE lv.titulo = 'A inconveniente loja de conveniência'
UNION ALL
SELECT l.id_leitura, 4, ''
FROM leituras l JOIN livros lv ON l.id_livro = lv.id_livro 
WHERE lv.titulo = 'O gato que amava livros'
UNION ALL
SELECT l.id_leitura, 3, 'Leitura rápida e sem aprofundamento do assunto.'
FROM leituras l JOIN livros lv ON l.id_livro = lv.id_livro 
WHERE lv.titulo = '15 Incríveis Truques Mentais: Facilite sua vida mudando sua mente';
