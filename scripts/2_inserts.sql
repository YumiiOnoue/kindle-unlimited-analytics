USE book_analytics;

-- =========================================================
-- 1. FATO ASSINATURA (Mensalidade do Kindle+)
-- =========================================================
INSERT INTO fato_assinatura (servico, valor_mensal, mes_referencia) VALUES
    ('Kindle+', 19.90, '2024-12-04'),
    ('Kindle+', 19.90, '2025-01-04'),
    ('Kindle+', 19.90, '2025-02-04'),
    ('Kindle+', 19.90, '2025-03-04'),
    ('Kindle+', 19.90, '2025-04-04'),
    ('Kindle+', 19.90, '2025-05-04'),
    ('Kindle+', 19.90, '2025-06-04'),
    ('Kindle+', 19.90, '2025-07-04'),
    ('Kindle+', 19.90, '2025-08-04'),
    ('Kindle+', 19.90, '2025-09-04'),
    ('Kindle+', 19.90, '2025-10-04'),
    ('Kindle+', 19.90, '2025-11-04'),
    ('Kindle+', 19.90, '2025-12-04'),
    ('Kindle+', 19.90, '2026-01-04'),
    ('Kindle+', 24.90, '2026-02-04'),
    ('Kindle+', 24.90, '2026-03-04'),
    ('Kindle+', 24.90, '2026-04-04'),
    ('Kindle+', 24.90, '2026-05-04'),
    ('Kindle+', 24.90, '2026-06-04'),
    ('Kindle+', 24.90, '2026-07-04'),
    ('Kindle+', 24.90, '2026-08-04'),
    ('Kindle+', 24.90, '2026-09-04'),
    ('Kindle+', 24.90, '2026-10-04');

-- =========================================================
-- 2. DIMENSÃO LIVROS
-- =========================================================
INSERT INTO dim_livros (id_externo, titulo, autor, editora, ano_publicacao, numero_paginas, preco_digital, preco_fisico) VALUES
    -- Leituras Históricas (2021)
    ('978-8550801483', 'Pai Rico, Pai Pobre', 'Robert T. Kiyosaki', 'Alta Books', 2017, 322, 14.15, 44.11),
    ('978-8535914849', '1984', 'George Orwell', 'Companhia das Letras', 2009, 416, 14.90, 15.00),
    ('978-8582467190', 'Eu sei por que o pássaro canta na gaiola', 'Maya Angelou', 'Astral Cultural', 2018, 336, 46.29, 48.73),
    ('978-8580577266', 'Para Todos os Garotos que Já Amei', 'Jenny Han', 'Intrínseca', 2015, 320, 19.90, 32.52),
    ('978-8580578690', 'P.S.: Ainda Amo Você', 'Jenny Han', 'Intrínseca', 2016, 304, 14.07, 43.90),
    ('978-8551001981', 'Agora e Para Sempre, Lara Jean', 'Jenny Han', 'Intrínseca', 2017, 304, 19.90, 36.49),
    ('978-8543108698', 'Como fazer amigos e influenciar pessoas', 'Dale Carnegie', 'Sextante', 2003, 318, 14.13, 26.84),
    ('978-8539004119', 'O poder do hábito', 'Charles Duhigg', 'Objetiva', 2012, 407, 39.90, 50.00),
    ('978-8563560605', 'O jardim secreto', 'Frances Hodgson Burnett', 'Companhia das Letras', 2013, 344, 2.97, 15.00),
    ('978-8580573749', 'Cidades de Papel', 'John Green', 'Intrínseca', 2013, 368, 14.07, 42.90),
    ('978-8545202516', 'Decifre e Influencie Pessoas', 'Paulo Vieira', 'Gente', 2018, 224, 37.90, 39.90),
    ('978-8582467459', 'Resolva A Porra Dos Seus Problemas', 'Laura Jane Williams', 'Astral Cultural', 2018, 224, 0.00, 20.00),
    ('978-8554517861', 'Se não fosse por você, eu não estaria aqui', 'Paulo Vieira', 'Companhia Editora Nacional', 2020, 102, 0.00, 0.00),

    -- Leituras 2023
    ('978-8535915761', 'Sangue de Tinta', 'Cornelia Maria Funke', 'Companhia Editora Nacional', 2009, 560, 19.90, 89.90),

    -- Leituras 2024
    ('978-8537801550', 'O andar do bêbado: Como o acaso determina nossas vidas', 'Leonard Mlodinow', 'Zahar', 2009, 264, 29.90, 38.30),
    ('978-6558382867', 'Se os gatos desaparecessem do mundo', 'Genki Kawamura', 'Bertrand Brasil', 2023, 176, 0.00, 29.34),
    ('978-8551009796', 'Vou te receitar um gato', 'Syou Ishida', 'Intrínseca', 2023, 224, 23.90, 59.90),
    ('978-6558382447', 'A inconveniente loja de conveniência', 'Kim Ho-Yeon', 'Bertrand Brasil', 2023, 270, 27.84, 29.93),
    ('978-6555357783', 'O gato que amava livros', 'Sosuke Natsukawa', 'Planeta', 2022, 240, 31.97, 64.90),
    ('ASIN:B07S5XB91G', '15 Incríveis Truques Mentais: Facilite sua vida mudando sua mente', 'Danilo H. Gomes', 'Independente', 2019, 49, 1.99, 30.72),
    ('9786586068221', 'Entregas expressas da Kiki', 'Daniel Kondo', 'Estação Liberdade', 2021, 236, 1.99, 30.72),
    ('978-6556093765', 'Queria morrer, mas no céu não tem tteokbokki', 'Baek Sehee', 'Universo das Livros', 2023, 192, 19.90, 42.14),
    ('978-6555321111', 'Gente ansiosa', 'Fredrik Backman', 'Rocco', 2021, 368, 31.26, 79.90),
    ('ASIN:B08ZYJ77JX', 'O Gato Preto que Só Queria Ser Amado', 'Rosa Silva', 'Independente', 2021, 89, 15.33, 72.15),
    ('978-6558383185', 'Uma noite na livraria Morisaki', 'Satoshi Yagisawa', 'Bertrand Brasil', 2024, 175, 25.80, 54.90),
    ('978-6558382461', 'Meus dias na livraria Morisaki', 'Satoshi Yagisawa', 'Bertrand Brasil', 2023, 167, 34.90, 59.90),
    ('978-6555606355', 'Bem-vindos à livraria Hyunam-dong', 'Hwang Bo-Reum', 'Intrínseca', 2023, 272, 21.55, 59.90),

    -- Leituras 2025
    ('978-6555951479', 'Amanhã, amanhã, e ainda outro amanhã', 'Gabrielle Zevin', 'Rocco', 2022, 528, 37.90, 53.94),
    ('978-6555951783', 'Amêndoas', 'Won-pyung Sohn', 'Rocco', 2023, 240, 29.90, 40.00),
    ('978-6555395846', 'Como tigres na neve', 'Juhea Kim', 'Verus', 2022, 454, 37.62, 39.92),
    ('978-6553933194', 'Clube de leitura dos corações solitários', 'Lucy Gilmore', 'Arqueiro', 2024, 353, 35.94, 59.90),
    ('978-6559240708', 'O pequeno caderno das coisas não ditas', 'Clare Pooley', 'Buzz', 2022, 414, 34.90, 42.19),
    ('978-6559243174', 'As pessoas na plataforma 5', 'Clare Pooley', 'Buzz', 2024, 373, 39.90, 74.90),
    ('978-8580419450', 'Tudo que a gente sempre quis', 'Emily Giffin', 'Record', 2019, 366, 15.99, 69.90),
    ('978-6555654752', 'Um experimento de amor em Nova York', 'Elena Armas', 'Record', 2023, 490, 30.39, 64.90),
    ('978-6555394474', 'A noiva do Deus Mar', 'Axie Oh', 'Verus', 2022, 251, 42.00, 60.00),
    ('978-6559242139', 'O guardião das coisas perdidas', 'Ruth Hogan', 'Buzz', 2023, 322, 39.90, 42.75),
    ('ASIN:B07TFB3DL8', 'Vida de gato', 'Lucilia Reale', 'Lucília Reale', 2019, 26, 14.90, 0.00),
    ('978-8544002124', 'Mulherzinhas', 'Louisa May Alcott', 'Martin Claret', 2019, 680, 29.90, 32.17),
    ('978-6559241255', 'Algo como ser feliz', 'Eva Woods', 'Buzz', 2022, 481, 38.95, 69.90),
    ('978-6555656725', 'Chocolate quente às quintas-feiras', 'Michiko Aoyama', 'Record', 2024, 138, 33.24, 54.90),
    ('978-6555658774', 'Matcha às segundas-feiras', 'Michiko Aoyama', 'Record', 2025, 155, 17.90, 54.90),
    ('978-6555951912', 'Uma tempestade de verão', 'K. L. Walther', 'Rocco', 2023, 345, 30.18, 64.90),
    ('978-6555654899', 'Parte do meu mundo', 'Abby Jimenez', 'Record', 2023, 419, 39.90, 69.90),
    ('978-6559243426', 'Sete verões', 'Paige Toon', 'Buzz', 2024, 429, 31.23, 31.90),

    -- Leituras 2026
    ('978-8551010082', 'Yellowface', 'R.F. Kuang', 'Shinchosha', 2023, 346, 30.52, 41.41),
    ('978-6585659253', 'A loja dos dias de chuva', 'You Yeong Gwang', 'Livros da Alice', 2025, 253, 41.99, 59.90),
    ('978-6555877731', 'O burnout', 'Sophie Kinsella', 'Record', 2024, 396, 39.13, 79.90),
    ('978-6559812172', 'Uma magia destilada em veneno', 'Judy I. Lin', 'Galera', 2022, 403, 41.90, 64.90),
    ('978-6559813018', 'Um veneno doce e sombrio', 'Judy I. Lin', 'Galera', 2023, 370, 12.21, 64.90),
    ('978-6558384021', 'Meu Dom Quixote coreano', 'Kim Ho-Yeon', 'Bertrand Brasil', 2025, 356, 12.99, 59.90),
    ('978-6558383109', 'A lanterna das memórias perdidas', 'Sanaka Hiiragi', 'Bertrand Brasil', 2024, 183, 35.91, 59.90);

INSERT INTO dim_categoria (categoria)
VALUES
    ('Autoajuda'),
    ('Aventura'),
    ('Biografia'),
    ('Ciências Sociais'),
    ('Clássicos'),
    ('Comédia'),
    ('Comédia Romântica'),
    ('Dados'),
    ('Desenvolvimento Pessoal'),
    ('Distopia'),
    ('Drama'),
    ('Educação Financeira'),
    ('Fantasia'),
    ('Ficção'),
    ('Ficção Científica'),
    ('Ficção de Cura'),
    ('Gestão'),
    ('Histórico'),
    ('Jovem Adulto'),
    ('Literatura Asiática'),
    ('Literatura Infantil'),
    ('Mangá'),
    ('Memórias'),
    ('Mistério'),
    ('Negócios'),
    ('Não Ficção'),
    ('Romance'),
    ('Suspense'),
    ('Tomada de Decisão');


INSERT INTO livro_categoria (id_livro, id_categoria)
VALUES
    ((SELECT id_livro FROM dim_livros WHERE titulo = 'Pai Rico, Pai Pobre'), 
    (SELECT id_categoria FROM dim_categoria WHERE categoria = 'Educação Financeira')),
    
    ((SELECT id_livro FROM dim_livros WHERE titulo = '1984'), 
    (SELECT id_categoria FROM dim_categoria WHERE categoria = 'Distopia')),

    ((SELECT id_livro FROM dim_livros WHERE titulo = '1984'), 
    (SELECT id_categoria FROM dim_categoria WHERE categoria = 'Ficção')),

    ((SELECT id_livro FROM dim_livros WHERE titulo = 'Eu sei por que o pássaro canta na gaiola'),
    (SELECT id_categoria FROM dim_categoria WHERE categoria = 'Biografia')),

    ((SELECT id_livro FROM dim_livros WHERE titulo = 'Para Todos os Garotos que Já Amei'), 
    (SELECT id_categoria FROM dim_categoria WHERE categoria = 'Comédia Romântica')),
    
    ((SELECT id_livro FROM dim_livros WHERE titulo = 'P.S.: Ainda Amo Você'), 
    (SELECT id_categoria FROM dim_categoria WHERE categoria = 'Comédia Romântica')),
    
    ((SELECT id_livro FROM dim_livros WHERE titulo = 'Agora e Para Sempre, Lara Jean'), 
    (SELECT id_categoria FROM dim_categoria WHERE categoria = 'Comédia Romântica')),
    
    ((SELECT id_livro FROM dim_livros WHERE titulo = 'Como fazer amigos e influenciar pessoas'), 
    (SELECT id_categoria FROM dim_categoria WHERE categoria = 'Desenvolvimento Pessoal')),

    ((SELECT id_livro FROM dim_livros WHERE titulo = 'Como fazer amigos e influenciar pessoas'), 
    (SELECT id_categoria FROM dim_categoria WHERE categoria = 'Autoajuda')),

    ((SELECT id_livro FROM dim_livros WHERE titulo = 'O poder do hábito'), 
    (SELECT id_categoria FROM dim_categoria WHERE categoria = 'Desenvolvimento Pessoal')),

    ((SELECT id_livro FROM dim_livros WHERE titulo = 'O poder do hábito'),
    (SELECT id_categoria FROM dim_categoria WHERE categoria = 'Autoajuda')),
    
    ((SELECT id_livro FROM dim_livros WHERE titulo = 'O jardim secreto'), 
    (SELECT id_categoria FROM dim_categoria WHERE categoria = 'Literatura Infantil')),

    ((SELECT id_livro FROM dim_livros WHERE titulo = 'O jardim secreto'),
    (SELECT id_categoria FROM dim_categoria WHERE categoria = 'Clássicos')),
    
    ((SELECT id_livro FROM dim_livros WHERE titulo = 'Cidades de Papel'), 
    (SELECT id_categoria FROM dim_categoria WHERE categoria = 'Romance')),

    ((SELECT id_livro FROM dim_livros WHERE titulo = 'Decifre e Influencie Pessoas'),
    (SELECT id_categoria FROM dim_categoria WHERE categoria = 'Desenvolvimento Pessoal')),

    ((SELECT id_livro FROM dim_livros WHERE titulo = 'Decifre e Influencie Pessoas'),
    (SELECT id_categoria FROM dim_categoria WHERE categoria = 'Autoajuda')),

    ((SELECT id_livro FROM dim_livros WHERE titulo = 'Resolva A Porra Dos Seus Problemas'),
    (SELECT id_categoria FROM dim_categoria WHERE categoria = 'Autoajuda')),

    ((SELECT id_livro FROM dim_livros WHERE titulo = 'Se não fosse por você, eu não estaria aqui'),
    (SELECT id_categoria FROM dim_categoria WHERE categoria = 'Romance')),

    ((SELECT id_livro FROM dim_livros WHERE titulo = 'Se não fosse por você, eu não estaria aqui'),
    (SELECT id_categoria FROM dim_categoria WHERE categoria = 'Biografia')),

    ((SELECT id_livro FROM dim_livros WHERE titulo = 'Sangue de Tinta'),
    (SELECT id_categoria FROM dim_categoria WHERE categoria = 'Fantasia')),

    ((SELECT id_livro FROM dim_livros WHERE titulo = 'Sangue de Tinta'),
    (SELECT id_categoria FROM dim_categoria WHERE categoria = 'Aventura')),

    ((SELECT id_livro FROM dim_livros WHERE titulo = 'O andar do bêbado: Como o acaso determina nossas vidas'),
    (SELECT id_categoria FROM dim_categoria WHERE categoria = 'Ciências Sociais')),

    ((SELECT id_livro FROM dim_livros WHERE titulo = 'O andar do bêbado: Como o acaso determina nossas vidas'),
    (SELECT id_categoria FROM dim_categoria WHERE categoria = 'Não Ficção')),

    ((SELECT id_livro FROM dim_livros WHERE titulo = 'O andar do bêbado: Como o acaso determina nossas vidas'),
    (SELECT id_categoria FROM dim_categoria WHERE categoria = 'Dados')),

    ((SELECT id_livro FROM dim_livros WHERE titulo = 'Se os gatos desaparecessem do mundo'),
    (SELECT id_categoria FROM dim_categoria WHERE categoria = 'Fantasia')),

    ((SELECT id_livro FROM dim_livros WHERE titulo = 'Se os gatos desaparecessem do mundo'),
    (SELECT id_categoria FROM dim_categoria WHERE categoria = 'Ficção')),

    ((SELECT id_livro FROM dim_livros WHERE titulo = 'Vou te receitar um gato'),
    (SELECT id_categoria FROM dim_categoria WHERE categoria = 'Ficção de Cura')),

    ((SELECT id_livro FROM dim_livros WHERE titulo = 'Vou te receitar um gato'),
    (SELECT id_categoria FROM dim_categoria WHERE categoria = 'Literatura Asiática')),

    ((SELECT id_livro FROM dim_livros WHERE titulo = 'A inconveniente loja de conveniência'),
    (SELECT id_categoria FROM dim_categoria WHERE categoria = 'Ficção de Cura')),

    ((SELECT id_livro FROM dim_livros WHERE titulo = 'A inconveniente loja de conveniência'),   
    (SELECT id_categoria FROM dim_categoria WHERE categoria = 'Literatura Asiática')),

    ((SELECT id_livro FROM dim_livros WHERE titulo = 'O gato que amava livros'),
    (SELECT id_categoria FROM dim_categoria WHERE categoria = 'Ficção de Cura')),

    ((SELECT id_livro FROM dim_livros WHERE titulo = 'O gato que amava livros'),
    (SELECT id_categoria FROM dim_categoria WHERE categoria = 'Literatura Asiática')),

    ((SELECT id_livro FROM dim_livros WHERE titulo = '15 Incríveis Truques Mentais: Facilite sua vida mudando sua mente'),
    (SELECT id_categoria FROM dim_categoria WHERE categoria = 'Autoajuda')),

    ((SELECT id_livro FROM dim_livros WHERE titulo = 'Entregas expressas da Kiki'),
    (SELECT id_categoria FROM dim_categoria WHERE categoria = 'Romance')),

    ((SELECT id_livro FROM dim_livros WHERE titulo = 'Entregas expressas da Kiki'),
    (SELECT id_categoria FROM dim_categoria WHERE categoria = 'Fantasia')),

    ((SELECT id_livro FROM dim_livros WHERE titulo = 'Queria morrer, mas no céu não tem tteokbokki'),
    (SELECT id_categoria FROM dim_categoria WHERE categoria = 'Autoajuda')),

    ((SELECT id_livro FROM dim_livros WHERE titulo = 'Queria morrer, mas no céu não tem tteokbokki'),
    (SELECT id_categoria FROM dim_categoria WHERE categoria = 'Memórias')),

    ((SELECT id_livro FROM dim_livros WHERE titulo = 'Gente ansiosa'),
    (SELECT id_categoria FROM dim_categoria WHERE categoria = 'Romance')),

    ((SELECT id_livro FROM dim_livros WHERE titulo = 'Gente ansiosa'),
    (SELECT id_categoria FROM dim_categoria WHERE categoria = 'Drama')),

    ((SELECT id_livro FROM dim_livros WHERE titulo = 'O Gato Preto que Só Queria Ser Amado'),
    (SELECT id_categoria FROM dim_categoria WHERE categoria = 'Literatura Infantil')),

    ((SELECT id_livro FROM dim_livros WHERE titulo = 'Uma noite na livraria Morisaki'),
    (SELECT id_categoria FROM dim_categoria WHERE categoria = 'Ficção de Cura')),

    ((SELECT id_livro FROM dim_livros WHERE titulo = 'Uma noite na livraria Morisaki'),
    (SELECT id_categoria FROM dim_categoria WHERE categoria = 'Literatura Asiática')),

    ((SELECT id_livro FROM dim_livros WHERE titulo = 'Meus dias na livraria Morisaki'),
    (SELECT id_categoria FROM dim_categoria WHERE categoria = 'Ficção de Cura')),

    ((SELECT id_livro FROM dim_livros WHERE titulo = 'Meus dias na livraria Morisaki'),
    (SELECT id_categoria FROM dim_categoria WHERE categoria = 'Literatura Asiática')),

    ((SELECT id_livro FROM dim_livros WHERE titulo = 'Bem-vindos à livraria Hyunam-dong'),
    (SELECT id_categoria FROM dim_categoria WHERE categoria = 'Ficção de Cura')),

    ((SELECT id_livro FROM dim_livros WHERE titulo = 'Bem-vindos à livraria Hyunam-dong'),  
    (SELECT id_categoria FROM dim_categoria WHERE categoria = 'Literatura Asiática')),

    ((SELECT id_livro FROM dim_livros WHERE titulo = 'Amanhã, amanhã, e ainda outro amanhã'),
    (SELECT id_categoria FROM dim_categoria WHERE categoria = 'Drama')),

    ((SELECT id_livro FROM dim_livros WHERE titulo = 'Amanhã, amanhã, e ainda outro amanhã'),
    (SELECT id_categoria FROM dim_categoria WHERE categoria = 'Ficção')),

    ((SELECT id_livro FROM dim_livros WHERE titulo = 'Amêndoas'),
    (SELECT id_categoria FROM dim_categoria WHERE categoria = 'Ficção de Cura')),

    ((SELECT id_livro FROM dim_livros WHERE titulo = 'Amêndoas'),
    (SELECT id_categoria FROM dim_categoria WHERE categoria = 'Romance')),

    ((SELECT id_livro FROM dim_livros WHERE titulo = 'Amêndoas'),
    (SELECT id_categoria FROM dim_categoria WHERE categoria = 'Literatura Asiática')),

    ((SELECT id_livro FROM dim_livros WHERE titulo = 'Como tigres na neve'),
    (SELECT id_categoria FROM dim_categoria WHERE categoria = 'Ficção')),

    ((SELECT id_livro FROM dim_livros WHERE titulo = 'Como tigres na neve'),
    (SELECT id_categoria FROM dim_categoria WHERE categoria = 'Literatura Asiática')),

    ((SELECT id_livro FROM dim_livros WHERE titulo = 'Como tigres na neve'),
    (SELECT id_categoria FROM dim_categoria WHERE categoria = 'Histórico')),

    ((SELECT id_livro FROM dim_livros WHERE titulo = 'Clube de leitura dos corações solitários'),
    (SELECT id_categoria FROM dim_categoria WHERE categoria = 'Romance')),

    ((SELECT id_livro FROM dim_livros WHERE titulo = 'Clube de leitura dos corações solitários'),   
    (SELECT id_categoria FROM dim_categoria WHERE categoria = 'Ficção')),
    
    ((SELECT id_livro FROM dim_livros WHERE titulo = 'O pequeno caderno das coisas não ditas'),
    (SELECT id_categoria FROM dim_categoria WHERE categoria = 'Romance')),

    ((SELECT id_livro FROM dim_livros WHERE titulo = 'O pequeno caderno das coisas não ditas'),
    (SELECT id_categoria FROM dim_categoria WHERE categoria = 'Drama')),

    ((SELECT id_livro FROM dim_livros WHERE titulo = 'As pessoas na plataforma 5'),
    (SELECT id_categoria FROM dim_categoria WHERE categoria = 'Drama')),

    ((SELECT id_livro FROM dim_livros WHERE titulo = 'As pessoas na plataforma 5'),
    (SELECT id_categoria FROM dim_categoria WHERE categoria = 'Romance')),

    ((SELECT id_livro FROM dim_livros WHERE titulo = 'Tudo que a gente sempre quis'),
    (SELECT id_categoria FROM dim_categoria WHERE categoria = 'Drama')),

    ((SELECT id_livro FROM dim_livros WHERE titulo = 'Tudo que a gente sempre quis'),
    (SELECT id_categoria FROM dim_categoria WHERE categoria = 'Romance')),

    ((SELECT id_livro FROM dim_livros WHERE titulo = 'Um experimento de amor em Nova York'),
    (SELECT id_categoria FROM dim_categoria WHERE categoria = 'Comédia Romântica')),

    ((SELECT id_livro FROM dim_livros WHERE titulo = 'Um experimento de amor em Nova York'),
    (SELECT id_categoria FROM dim_categoria WHERE categoria = 'Ficção')),

    ((SELECT id_livro FROM dim_livros WHERE titulo = 'A noiva do Deus Mar'),
    (SELECT id_categoria FROM dim_categoria WHERE categoria = 'Romance')),

    ((SELECT id_livro FROM dim_livros WHERE titulo = 'A noiva do Deus Mar'),
    (SELECT id_categoria FROM dim_categoria WHERE categoria = 'Fantasia')),

    ((SELECT id_livro FROM dim_livros WHERE titulo = 'O guardião das coisas perdidas'),
    (SELECT id_categoria FROM dim_categoria WHERE categoria = 'Romance')),

    ((SELECT id_livro FROM dim_livros WHERE titulo = 'O guardião das coisas perdidas'),
    (SELECT id_categoria FROM dim_categoria WHERE categoria = 'Drama')),

    ((SELECT id_livro FROM dim_livros WHERE titulo = 'Vida de gato'),
    (SELECT id_categoria FROM dim_categoria WHERE categoria = 'Literatura Infantil')),

    ((SELECT id_livro FROM dim_livros WHERE titulo = 'Mulherzinhas'),
    (SELECT id_categoria FROM dim_categoria WHERE categoria = 'Romance')),

    ((SELECT id_livro FROM dim_livros WHERE titulo = 'Mulherzinhas'),
    (SELECT id_categoria FROM dim_categoria WHERE categoria = 'Clássicos')),

    ((SELECT id_livro FROM dim_livros WHERE titulo = 'Algo como ser feliz'),
    (SELECT id_categoria FROM dim_categoria WHERE categoria = 'Drama')),

    ((SELECT id_livro FROM dim_livros WHERE titulo = 'Algo como ser feliz'),
    (SELECT id_categoria FROM dim_categoria WHERE categoria = 'Ficção')),

    ((SELECT id_livro FROM dim_livros WHERE titulo = 'Chocolate quente às quintas-feiras'),
    (SELECT id_categoria FROM dim_categoria WHERE categoria = 'Romance')),

    ((SELECT id_livro FROM dim_livros WHERE titulo = 'Chocolate quente às quintas-feiras'),
    (SELECT id_categoria FROM dim_categoria WHERE categoria = 'Ficção')),

    ((SELECT id_livro FROM dim_livros WHERE titulo = 'Chocolate quente às quintas-feiras'),
    (SELECT id_categoria FROM dim_categoria WHERE categoria = 'Literatura Asiática')), 

    ((SELECT id_livro FROM dim_livros WHERE titulo = 'Matcha às segundas-feiras'),
    (SELECT id_categoria FROM dim_categoria WHERE categoria = 'Romance')),

    ((SELECT id_livro FROM dim_livros WHERE titulo = 'Matcha às segundas-feiras'),
    (SELECT id_categoria FROM dim_categoria WHERE categoria = 'Ficção')),

    ((SELECT id_livro FROM dim_livros WHERE titulo = 'Matcha às segundas-feiras'),
    (SELECT id_categoria FROM dim_categoria WHERE categoria = 'Literatura Asiática')),

    ((SELECT id_livro FROM dim_livros WHERE titulo = 'Uma tempestade de verão'),
    (SELECT id_categoria FROM dim_categoria WHERE categoria = 'Romance')),

    ((SELECT id_livro FROM dim_livros WHERE titulo = 'Uma tempestade de verão'),
    (SELECT id_categoria FROM dim_categoria WHERE categoria = 'Ficção')),

    ((SELECT id_livro FROM dim_livros WHERE titulo = 'Parte do meu mundo'),
    (SELECT id_categoria FROM dim_categoria WHERE categoria = 'Romance')),

    ((SELECT id_livro FROM dim_livros WHERE titulo = 'Parte do meu mundo'),
    (SELECT id_categoria FROM dim_categoria WHERE categoria = 'Comédia Romântica')),

    ((SELECT id_livro FROM dim_livros WHERE titulo = 'Sete verões'),
    (SELECT id_categoria FROM dim_categoria WHERE categoria = 'Romance')),

    ((SELECT id_livro FROM dim_livros WHERE titulo = 'Sete verões'),
    (SELECT id_categoria FROM dim_categoria WHERE categoria = 'Drama')),
    
    ((SELECT id_livro FROM dim_livros WHERE titulo = 'Yellowface'),
    (SELECT id_categoria FROM dim_categoria WHERE categoria = 'Suspense')),

    ((SELECT id_livro FROM dim_livros WHERE titulo = 'Yellowface'),
    (SELECT id_categoria FROM dim_categoria WHERE categoria = 'Ficção')),

    ((SELECT id_livro FROM dim_livros WHERE titulo = 'A loja dos dias de chuva'),
    (SELECT id_categoria FROM dim_categoria WHERE categoria = 'Fantasia')),

    ((SELECT id_livro FROM dim_livros WHERE titulo = 'A loja dos dias de chuva'),
    (SELECT id_categoria FROM dim_categoria WHERE categoria = 'Ficção')),

    ((SELECT id_livro FROM dim_livros WHERE titulo = 'O burnout'),
    (SELECT id_categoria FROM dim_categoria WHERE categoria = 'Romance')),

    ((SELECT id_livro FROM dim_livros WHERE titulo = 'O burnout'),
    (SELECT id_categoria FROM dim_categoria WHERE categoria = 'Comédia')),

    ((SELECT id_livro FROM dim_livros WHERE titulo = 'Uma magia destilada em veneno'),
    (SELECT id_categoria FROM dim_categoria WHERE categoria = 'Fantasia')),

    ((SELECT id_livro FROM dim_livros WHERE titulo = 'Uma magia destilada em veneno'),
    (SELECT id_categoria FROM dim_categoria WHERE categoria = 'Ficção')),

    ((SELECT id_livro FROM dim_livros WHERE titulo = 'Uma magia destilada em veneno'),
    (SELECT id_categoria FROM dim_categoria WHERE categoria = 'Romance')),

    ((SELECT id_livro FROM dim_livros WHERE titulo = 'Um veneno doce e sombrio'),
    (SELECT id_categoria FROM dim_categoria WHERE categoria = 'Romance')),

    ((SELECT id_livro FROM dim_livros WHERE titulo = 'Um veneno doce e sombrio'),
    (SELECT id_categoria FROM dim_categoria WHERE categoria = 'Ficção')),

    ((SELECT id_livro FROM dim_livros WHERE titulo = 'Um veneno doce e sombrio'),
    (SELECT id_categoria FROM dim_categoria WHERE categoria = 'Fantasia')),

    ((SELECT id_livro FROM dim_livros WHERE titulo = 'Meu Dom Quixote coreano'),
    (SELECT id_categoria FROM dim_categoria WHERE categoria = 'Romance')),

    ((SELECT id_livro FROM dim_livros WHERE titulo = 'Meu Dom Quixote coreano'),
    (SELECT id_categoria FROM dim_categoria WHERE categoria = 'Ficção')),

    ((SELECT id_livro FROM dim_livros WHERE titulo = 'Meu Dom Quixote coreano'),
    (SELECT id_categoria FROM dim_categoria WHERE categoria = 'Literatura Asiática')), 

    ((SELECT id_livro FROM dim_livros WHERE titulo = 'A lanterna das memórias perdidas'),
    (SELECT id_categoria FROM dim_categoria WHERE categoria = 'Romance')),

    ((SELECT id_livro FROM dim_livros WHERE titulo = 'A lanterna das memórias perdidas'),
    (SELECT id_categoria FROM dim_categoria WHERE categoria = 'Ficção')),

    ((SELECT id_livro FROM dim_livros WHERE titulo = 'A lanterna das memórias perdidas'),
    (SELECT id_categoria FROM dim_categoria WHERE categoria = 'Literatura Asiática'));


-- =========================================================
-- 3. FATO LEITURAS
-- =========================================================
INSERT INTO fato_leituras (id_livro, data_inicio, data_fim, formato, origem_acesso, motivacao_leitura, nota, opiniao_texto, status_leitura)
VALUES
    -- 2021
    ((SELECT id_livro FROM dim_livros WHERE titulo = 'Pai Rico, Pai Pobre'), '2021-01-10', '2021-01-20', 'Digital', 'Compra', 'Sim', 4.0, '', 'Lido'),
    ((SELECT id_livro FROM dim_livros WHERE titulo = '1984'), '2021-02-01', '2021-02-28', 'Digital', 'Compra', 'Não', 4.5, 'Um clássico da literatura distópica, muito relevante para os dias atuais.', 'Lido'),
    ((SELECT id_livro FROM dim_livros WHERE titulo = 'Eu sei por que o pássaro canta na gaiola'), '2021-03-01', '2021-03-31', 'Digital', 'Compra', 'Não', 3.5, '', 'Lido'),
    ((SELECT id_livro FROM dim_livros WHERE titulo = 'Para Todos os Garotos que Já Amei'), '2021-04-01', '2021-04-30', 'Físico', 'Emprestado', 'Sim', 4.5, 'Li esse livro por causa do filme.', 'Lido'),
    ((SELECT id_livro FROM dim_livros WHERE titulo = 'P.S.: Ainda Amo Você'), '2021-05-01', '2021-05-31', 'Físico', 'Emprestado', 'Sim', 4.0, '', 'Lido'),
    ((SELECT id_livro FROM dim_livros WHERE titulo = 'Agora e Para Sempre, Lara Jean'), '2021-06-01', '2021-06-30', 'Físico', 'Emprestado', 'Sim', 4.5, '', 'Lido'),
    ((SELECT id_livro FROM dim_livros WHERE titulo = 'Como fazer amigos e influenciar pessoas'), '2021-07-01', '2021-07-31', 'Digital', 'Emprestado', 'Sim', 4.5, 'Um ótimo livro para aprender a lidar com pessoas.', 'Lido'),
    ((SELECT id_livro FROM dim_livros WHERE titulo = 'O poder do hábito'), '2021-08-01', '2021-08-31', 'Digital', 'Emprestado', 'Não', 3.5, '', 'Lido'),
    ((SELECT id_livro FROM dim_livros WHERE titulo = 'O jardim secreto'), '2021-09-01', '2021-09-30', 'Digital', 'Emprestado', 'Não', 4.0, 'Um clássico da literatura infantil, uma história encantadora sobre amizade e descoberta.', 'Lido'),
    ((SELECT id_livro FROM dim_livros WHERE titulo = 'Cidades de Papel'), '2021-10-01', '2021-10-31', 'Físico', 'Emprestado', 'Sim', 3.0, '', 'Lido'),
    ((SELECT id_livro FROM dim_livros WHERE titulo = 'Decifre e Influencie Pessoas'), '2021-11-01', '2021-11-16', 'Digital', 'Compra', 'Não', 4.0, '', 'Lido'),
    ((SELECT id_livro FROM dim_livros WHERE titulo = 'Resolva A Porra Dos Seus Problemas'), '2021-11-17', '2021-11-30', 'Digital', 'Cortesia', 'Não', 3.5, '', 'Lido'),
    ((SELECT id_livro FROM dim_livros WHERE titulo = 'Se não fosse por você, eu não estaria aqui'), '2021-12-01', '2021-12-20', 'Digital', 'Cortesia', 'Não', 3.5, '', 'Lido'),

    -- 2023
    ((SELECT id_livro FROM dim_livros WHERE titulo = 'Sangue de Tinta'), '2023-08-09', '2023-12-31', 'Físico', 'Emprestado', 'Sim', 4.0, 'É um livro denso, demorei um pouco para me envolver com a história.', 'Lido'),

    -- 2024
    ((SELECT id_livro FROM dim_livros WHERE titulo = 'O andar do bêbado: Como o acaso determina nossas vidas'), '2024-01-02', '2024-01-30', 'Digital', 'Compra', 'Sim', 4.0, '', 'Lido'),
    ((SELECT id_livro FROM dim_livros WHERE titulo = 'Se os gatos desaparecessem do mundo'), '2024-02-02', '2024-02-15', 'Digital', 'Cortesia', 'Sim', 4.0, '', 'Lido'),
    ((SELECT id_livro FROM dim_livros WHERE titulo = 'Vou te receitar um gato'), '2024-03-02', '2024-03-21', 'Digital', 'Emprestado', 'Sim', 4.0, 'É um livro fofo com várias histórias.', 'Lido'),
    ((SELECT id_livro FROM dim_livros WHERE titulo = 'A inconveniente loja de conveniência'), '2024-03-27', '2024-04-28', 'Digital', 'Emprestado', 'Sim', 3.5, 'Demorei um pouco para me envolver com os personagens.', 'Lido'),
    ((SELECT id_livro FROM dim_livros WHERE titulo = 'O gato que amava livros'), '2024-05-03', '2024-05-14', 'Digital', 'Emprestado', 'Sim', 4.0, '', 'Lido'),
    ((SELECT id_livro FROM dim_livros WHERE titulo = '15 Incríveis Truques Mentais: Facilite sua vida mudando sua mente'), '2024-06-02', '2024-06-02', 'Digital', 'Compra', 'Não', 3.0, 'Leitura rápida e sem aprofundamento do assunto.', 'Lido'),
    ((SELECT id_livro FROM dim_livros WHERE titulo = 'Entregas expressas da Kiki'), '2024-06-14', '2024-07-02', 'Digital', 'Compra', 'Não', 3.5, '', 'Lido'),
    ((SELECT id_livro FROM dim_livros WHERE titulo = 'Queria morrer, mas no céu não tem tteokbokki'), '2024-07-05', '2024-07-30', 'Digital', 'Emprestado', 'Sim', 3.5, 'É um livro mais pesado. É melhor ler quando você estiver se sentindo bem emocionalmente.', 'Lido'),
    ((SELECT id_livro FROM dim_livros WHERE titulo = 'Gente ansiosa'), '2024-08-02', '2024-08-27', 'Digital', 'Emprestado', 'Não', 4.0, '', 'Lido'),
    ((SELECT id_livro FROM dim_livros WHERE titulo = 'O Gato Preto que Só Queria Ser Amado'), '2024-09-06', '2024-09-18', 'Digital', 'Emprestado', 'Não', 3.5, '', 'Lido'),
    ((SELECT id_livro FROM dim_livros WHERE titulo = 'Uma noite na livraria Morisaki'), '2024-11-02', '2024-11-14', 'Digital', 'Emprestado', 'Sim', 4.0, '', 'Lido'),
    ((SELECT id_livro FROM dim_livros WHERE titulo = 'Meus dias na livraria Morisaki'), '2024-11-21', '2024-11-30', 'Digital', 'Emprestado', 'Sim', 4.0, '', 'Lido'),
    ((SELECT id_livro FROM dim_livros WHERE titulo = 'Bem-vindos à livraria Hyunam-dong'), '2024-12-02', '2024-12-31', 'Digital', 'Emprestado', 'Sim', 5.0, 'Amei esse livro. É aquele livro que você lê e se identifica com os personagens.', 'Lido'),

    -- 2025
    ((SELECT id_livro FROM dim_livros WHERE titulo = 'Amanhã, amanhã, e ainda outro amanhã'), '2024-12-23', '2025-01-15', 'Digital', 'Kindle+',  'Não', 3.5, 'É um livro denso, demorei um pouco para me envolver com a história.', 'Lido'),
    ((SELECT id_livro FROM dim_livros WHERE titulo = 'Amêndoas'), '2025-02-01', '2025-02-22', 'Digital', 'Emprestado',  'Sim', 3.5, '', 'Lido'),
    ((SELECT id_livro FROM dim_livros WHERE titulo = 'Como tigres na neve'), '2025-02-23', '2025-03-02', 'Digital', 'Kindle+', 'Não', 3.0, '', 'Lido'),
    ((SELECT id_livro FROM dim_livros WHERE titulo = 'Clube de leitura dos corações solitários'), '2025-03-03', '2025-04-01', 'Digital', 'Kindle+', 'Não', 4.0, '', 'Lido'),
    ((SELECT id_livro FROM dim_livros WHERE titulo = 'O pequeno caderno das coisas não ditas'), '2025-04-02', '2025-04-28', 'Digital', 'Kindle+', 'Não', 4.0, '', 'Lido'),
    ((SELECT id_livro FROM dim_livros WHERE titulo = 'As pessoas na plataforma 5'), '2025-04-29', '2025-05-12', 'Digital', 'Kindle+', 'Não', 5.0, 'Amei esse livro! Cada personagem tem uma história tão rica e a trama é super envolvente.', 'Lido'),
    ((SELECT id_livro FROM dim_livros WHERE titulo = 'Tudo que a gente sempre quis'), '2025-05-13', '2025-05-26', 'Digital', 'Kindle+', 'Não', 3.0, '', 'Lido'),
    ((SELECT id_livro FROM dim_livros WHERE titulo = 'Um experimento de amor em Nova York'), '2025-05-27', '2025-05-30', 'Digital', 'Kindle+', 'Não', 5.0, 'Uma leitura viciante! Amei o desenvolvimento dos personagens e a trama envolvente.', 'Lido'),
    ((SELECT id_livro FROM dim_livros WHERE titulo = 'A noiva do Deus Mar'), '2025-06-01', '2025-06-30', 'Digital', 'Kindle+', 'Não', 4.0, '', 'Lido'),
    ((SELECT id_livro FROM dim_livros WHERE titulo = 'Mulherzinhas'), '2025-08-01', '2025-09-01', 'Digital', 'Kindle+', 'Não', 4.0, '', 'Lido'),
    ((SELECT id_livro FROM dim_livros WHERE titulo = 'Algo como ser feliz'), '2025-09-02', '2025-09-27', 'Digital', 'Kindle+', 'Não', 3.0, '', 'Lido'),
    ((SELECT id_livro FROM dim_livros WHERE titulo = 'Chocolate quente às quintas-feiras'), '2025-09-28', '2025-10-13', 'Digital', 'Emprestado', 'Sim', 4.0, 'É uma leitura divertida e leve, perfeita para relaxar e se distrair. Só queria saber mais sobre os personagens. Fiquei curiosa de como eles estão depois do final do livro.', 'Lido'),
    ((SELECT id_livro FROM dim_livros WHERE titulo = 'Matcha às segundas-feiras'), '2025-10-14', '2025-10-31', 'Digital', 'Emprestado', 'Sim', 4.0, 'A história se passa na mesma cafeteria do livro anterior, mas com personagens diferentes.', 'Lido'),
    ((SELECT id_livro FROM dim_livros WHERE titulo = 'Uma tempestade de verão'), '2025-11-01', '2025-11-16', 'Digital', 'Kindle+', 'Não', 3.0, '', 'Lido'),
    ((SELECT id_livro FROM dim_livros WHERE titulo = 'Parte do meu mundo'), '2025-11-17', '2025-11-30', 'Digital', 'Kindle+', 'Não', 3.0, '', 'Lido'),
    ((SELECT id_livro FROM dim_livros WHERE titulo = 'Sete verões'), '2025-12-01', '2025-12-20', 'Digital', 'Kindle+', 'Não', 3.0, 'Achei massante a história da protagonista e o final não me agradou.', 'Lido'),

    -- 2026
    ((SELECT id_livro FROM dim_livros WHERE titulo = 'Yellowface'), '2025-12-22', '2026-01-12', 'Digital', 'Kindle+', 'Sim', 4.5, 'É um livro intrigante, que te deixa pensativa e revoltada. A escrita da autora é muito envolvente.', 'Lido'),
    ((SELECT id_livro FROM dim_livros WHERE titulo = 'A loja dos dias de chuva'), '2026-01-13', '2026-01-25', 'Digital', 'Kindle+', 'Não', 4.0, 'É um livro leve e divertido, perfeito para passar o tempo.', 'Lido'),
    ((SELECT id_livro FROM dim_livros WHERE titulo = 'O burnout'), '2026-01-26', '2026-02-01', 'Digital', 'Kindle+', 'Não', 3.5, 'O começo do livro é interessante, me identifiquei em algumas partes, mas o final me decepcionou um pouco.', 'Lido'),
    ((SELECT id_livro FROM dim_livros WHERE titulo = 'Uma magia destilada em veneno'), '2026-02-02', '2026-02-14', 'Digital', 'Kindle+', 'Não', 4.0, 'A história é envolvente e o final fica em aberto, tendo que ler o próximo livro.', 'Lido'),
    ((SELECT id_livro FROM dim_livros WHERE titulo = 'Um veneno doce e sombrio'), '2026-02-16', '2026-02-27', 'Digital', 'Compra', 'Sim', 4.5, 'Estava ansiosa para saber como a história terminava. Têm alguns pontos que não me agradou muito, mas recomendo a leitura da coleção "Os livros do Chá"', 'Lido'),
    ((SELECT id_livro FROM dim_livros WHERE titulo = 'Meu Dom Quixote coreano'), '2026-02-28', '2026-03-13', 'Digital', 'Kindle+', 'Sim', 4.0, '', 'Lido');