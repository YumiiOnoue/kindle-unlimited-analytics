USE book_analytics;

-- =========================================================
-- 1. FATO ASSINATURA (MENSALIDADES DO KINDLE UNLIMITED)
-- =========================================================
INSERT INTO fato_assinatura (servico, valor_mensal, data_pagamento) VALUES
    ('Kindle Unlimited', 19.90, '2024-12-04'),
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
    ('Kindle Unlimited', 19.90, '2025-12-04'),
    ('Kindle Unlimited', 19.90, '2026-01-04'),
    ('Kindle Unlimited', 24.90, '2026-02-04'),
    ('Kindle Unlimited', 24.90, '2026-03-04');

-- =========================================================
-- 2. DIMENSÃO LIVROS (METADADOS DESNORMALIZADOS)
-- =========================================================
INSERT INTO dim_livros (isbn, titulo, autor, editora, categorias, ano_publicacao, numero_paginas) VALUES
    -- Leituras Históricas (2021)
    ('978-8550801483', 'Pai Rico, Pai Pobre', 'Robert T. Kiyosaki', 'Alta Books', 'Educação Financeira', 2017, 322),
    ('978-8535914849', '1984', 'George Orwell', 'Companhia das Letras', 'Ficção, Distopia', 2009, 416),
    ('978-8582467190', 'Eu sei por que o pássaro canta na gaiola', 'Maya Angelou', 'Astral Cultural', 'Autobiografia, Biografia', 2018, 336),
    ('978-8580577266', 'Para Todos os Garotos que Já Amei', 'Jenny Han', 'Intrínseca', 'Romance, Jovem Adulto', 2015, 320),
    ('978-8580578690', 'P.S.: Ainda Amo Você', 'Jenny Han', 'Intrínseca', 'Romance, Jovem Adulto', 2016, 304),
    ('978-8551001981', 'Agora e Para Sempre, Lara Jean', 'Jenny Han', 'Intrínseca', 'Romance, Jovem Adulto', 2017, 304),
    ('978-8543108698', 'Como fazer amigos e influenciar pessoas', 'Dale Carnegie', 'Sextante', 'Autoajuda, Desenvolvimento Pessoal', 2003, 318),
    ('978-8539004119', 'O poder do hábito', 'Charles Duhigg', 'Objetiva', 'Autoajuda, Não Ficção', 2012, 407),
    ('978-8563560605', 'O jardim secreto', 'Frances Hodgson Burnett', 'Companhia das Letras', 'Literatura Infantil, Clássicos', 2013, 344),
    ('978-8580573749', 'Cidades de Papel', 'John Green', 'Intrínseca', 'Romance, Jovem Adulto', 2013, 368),
    ('978-8545202516', 'Decifre e Influencie Pessoas', 'Paulo Vieira', 'Gente', 'Autoajuda', 2018, 224),
    ('978-8582467459', 'Resolva A Porra Dos Seus Problemas', 'Laura Jane Williams', 'Astral Cultural', 'Autoajuda', 2018, 224),
    ('978-8554517861', 'Se não fosse por você, eu não estaria aqui', 'Paulo Vieira', 'Companhia Editora Nacional', 'Biografia', 2020, 102),

    -- Leituras 2023
    ('978-8535915761', 'Sangue de Tinta', 'Cornelia Maria Funke', 'Companhia Editora Nacional', 'Fantasia, Aventura', 2009, 560),

    -- Leituras 2024
    ('978-8537801550', 'O andar do bêbado: Como o acaso determina nossas vidas', 'Leonard Mlodinow', 'Zahar', 'Ciências Sociais, Não Ficção', 2009, 264),
    ('978-6558382867', 'Se os gatos desaparecessem do mundo', 'Genki Kawamura', 'Bertrand Brasil', 'Fantasia, Ficção', 2023, 176),
    ('978-8551009796', 'Vou te receitar um gato', 'Syou Ishida', 'Intrínseca', 'Ficção de Cura, Literatura Asiática', 2023, 224),
    ('978-6558382447', 'A inconveniente loja de conveniência', 'Kim Ho-Yeon', 'Bertrand Brasil', 'Ficção de Cura, Literatura Asiática', 2023, 270),
    ('978-6555357783', 'O gato que amava livros', 'Sosuke Natsukawa', 'Planeta', 'Ficção de Cura, Literatura Asiática', 2022, 240),
    ('ASIN:B07S5XB91G', '15 Incríveis Truques Mentais: Facilite sua vida mudando sua mente', 'Danilo H. Gomes', 'Independente', 'Autoajuda', 2019, 49),
    ('9786586068221', 'Entregas expressas da Kiki', 'Daniel Kondo', 'Estação Liberdade', 'Romance, Fantasia', 2021, 236),
    ('978-6556093765', 'Queria morrer, mas no céu não tem tteokbokki', 'Baek Sehee', 'Universo das Livros', 'Autoajuda, Memórias', 2023, 192),
    ('978-6555321111', 'Gente ansiosa', 'Fredrik Backman', 'Rocco', 'Romance, Drama', 2021, 368),
    ('ASIN:B08ZYJ77JX', 'O Gato Preto que Só Queria Ser Amado', 'Rosa Silva', 'Independente', 'Literatura Infantil', 2021, 89),
    ('978-6558383185', 'Uma noite na livraria Morisaki', 'Satoshi Yagisawa', 'Bertrand Brasil', 'Ficção de Cura, Literatura Asiática', 2024, 175),
    ('978-6558382461', 'Meus dias na livraria Morisaki', 'Satoshi Yagisawa', 'Bertrand Brasil', 'Ficção de Cura, Literatura Asiática', 2023, 167),
    ('978-6555606355', 'Bem-vindos à livraria Hyunam-dong', 'Hwang Bo-Reum', 'Intrínseca', 'Ficção de Cura, Literatura Asiática', 2023, 272),

    -- Leituras 2025
    ('978-6555951479', 'Amanhã, amanhã, e ainda outro amanhã', 'Gabrielle Zevin', 'Rocco', 'Ficção, Drama', 2022, 528),
    ('978-6555951783', 'Amêndoas', 'Won-pyung Sohn', 'Rocco', 'Ficção, Jovem Adulto', 2023, 240),
    ('978-6555395846', 'Como tigres na neve', 'Juhea Kim', 'Verus', 'Ficção, Histórico', 2022, 454),
    ('978-6553933194', 'Clube de leitura dos corações solitários', 'Lucy Gilmore', 'Arqueiro', 'Ficção, Romance', 2024, 353),
    ('978-6559240708', 'O pequeno caderno das coisas não ditas', 'Clare Pooley', 'Buzz', 'Romance, Drama', 2022, 414),
    ('978-6559243174', 'As pessoas na plataforma 5', 'Clare Pooley', 'Buzz', 'Romance, Drama', 2024, 373),
    ('978-8580419450', 'Tudo que a gente sempre quis', 'Emily Giffin', 'Record', 'Romance, Drama', 2019, 366),
    ('978-6555654752', 'Um experimento de amor em Nova York', 'Elena Armas', 'Record', 'Comédia Romântica, Romance', 2023, 490),
    ('978-6555394474', 'A noiva do Deus Mar', 'Axie Oh', 'Verus', 'Fantasia, Romance', 2022, 251),
    ('978-6559242139', 'O guardião das coisas perdidas', 'Ruth Hogan', 'Buzz', 'Romance, Drama', 2023, 322),
    ('ASIN:B07TFB3DL8', 'Vida de gato', 'Lucilia Reale', 'Lucília Reale', 'Casa e Estilo de Vida', 2019, 26),
    ('978-8544002124', 'Mulherzinhas', 'Louisa May Alcott', 'Martin Claret', 'Ficção, Clássicos', 2019, 680),
    ('978-6559241255', 'Algo como ser feliz', 'Eva Woods', 'Buzz', 'Ficção, Drama', 2022, 481),
    ('978-6555656725', 'Chocolate quente às quintas-feiras', 'Michiko Aoyama', 'Record', 'Ficção, Literatura Asiática', 2024, 138),
    ('978-6555658774', 'Matcha às segundas-feiras', 'Michiko Aoyama', 'Record', 'Ficção, Literatura Asiática', 2025, 155),
    ('978-6555951912', 'Uma tempestade de verão', 'K. L. Walther', 'Rocco', 'Romance, Jovem Adulto', 2023, 345),
    ('978-6555654899', 'Parte do meu mundo', 'Abby Jimenez', 'Record', 'Romance, Comédia', 2023, 419),
    ('978-6559243426', 'Sete verões', 'Paige Toon', 'Buzz', 'Romance, Drama', 2024, 429),

    -- Leituras 2026
    ('978-8551010082', 'Yellowface', 'R.F. Kuang', 'Shinchosha', 'Ficção, Suspense', 2023, 346),
    ('978-6585659253', 'A loja dos dias de chuva', 'You Yeong Gwang', 'Livros da Alice', 'Fantasia, Ficção', 2025, 253),
    ('978-6555877731', 'O burnout', 'Sophie Kinsella', 'Record', 'Comédia, Romance', 2024, 396),
    ('978-6559812172', 'Uma magia destilada em veneno', 'Judy I. Lin', 'Galera', 'Fantasia, Ficção', 2022, 403),
    ('978-6559813018', 'Um veneno doce e sombrio', 'Judy I. Lin', 'Galera', 'Fantasia, Ficção', 2023, 370),
    ('978-6558384021', 'Meu Dom Quixote coreano', 'Kim Ho-Yeon', 'Bertrand Brasil', 'Fantasia, Ficção de Cura', 2025, 356),
    ('978-6558383109', 'A lanterna das memórias perdidas', 'Sanaka Hiiragi', 'Bertrand Brasil', 'Fantasia, Ficção de Cura', 2024, 183);

-- =========================================================
-- 3. FATO LEITURAS (HISTÓRICO + AVALIAÇÕES)
-- =========================================================
-- Usa subqueries por título para vincular o id_livro correto automaticamente
INSERT INTO fato_leituras (id_livro, data_inicio, data_fim, formato, preco_livro_avulso, valor_pago, nota, opiniao_texto)
VALUES
    -- 2021
    ((SELECT id_livro FROM dim_livros WHERE titulo = 'Pai Rico, Pai Pobre'), '2021-01-10', '2021-01-20', 'kindle', 0.00, 14.15, 4.0, ''),
    ((SELECT id_livro FROM dim_livros WHERE titulo = '1984'), '2021-02-01', '2021-02-28', 'kindle', 0.00, 0.00, 4.5, 'Um clássico da literatura distópica, muito relevante para os dias atuais.'),
    ((SELECT id_livro FROM dim_livros WHERE titulo = 'Eu sei por que o pássaro canta na gaiola'), '2021-03-01', '2021-03-31', 'kindle', 0.00, 0.00, 3.5, ''),
    ((SELECT id_livro FROM dim_livros WHERE titulo = 'Para Todos os Garotos que Já Amei'), '2021-04-01', '2021-04-30', 'físico', 0.00, 28.90, 4.5, 'Li esse livro por causa do filme.'),
    ((SELECT id_livro FROM dim_livros WHERE titulo = 'P.S.: Ainda Amo Você'), '2021-05-01', '2021-05-31', 'físico', 0.00, 28.90, 4.0, ''),
    ((SELECT id_livro FROM dim_livros WHERE titulo = 'Agora e Para Sempre, Lara Jean'), '2021-06-01', '2021-06-30', 'físico', 0.00, 28.90, 4.5, ''),
    ((SELECT id_livro FROM dim_livros WHERE titulo = 'Como fazer amigos e influenciar pessoas'), '2021-07-01', '2021-07-31', 'kindle', 0.00, 0.00, 4.5, 'Um ótimo livro para aprender a lidar com pessoas.'),
    ((SELECT id_livro FROM dim_livros WHERE titulo = 'O poder do hábito'), '2021-08-01', '2021-08-31', 'kindle', 0.00, 0.00, 3.5, ''),
    ((SELECT id_livro FROM dim_livros WHERE titulo = 'O jardim secreto'), '2021-09-01', '2021-09-30', 'kindle', 0.00, 0.00, 4.0, 'Um clássico da literatura infantil, uma história encantadora sobre amizade e descoberta.'),
    ((SELECT id_livro FROM dim_livros WHERE titulo = 'Cidades de Papel'), '2021-10-01', '2021-10-31', 'físico', 0.00, 22.64, 3.0, ''),
    ((SELECT id_livro FROM dim_livros WHERE titulo = 'Decifre e Influencie Pessoas'), '2021-11-01', '2021-11-16', 'kindle', 0.00, 0.00, 4.0, ''),
    ((SELECT id_livro FROM dim_livros WHERE titulo = 'Resolva A Porra Dos Seus Problemas'), '2021-11-17', '2021-11-30', 'kindle', 0.00, 0.00, 3.5, ''),
    ((SELECT id_livro FROM dim_livros WHERE titulo = 'Se não fosse por você, eu não estaria aqui'), '2021-12-01', '2021-12-20', 'kindle', 0.00, 0.00, 3.5, ''),

    -- 2023
    ((SELECT id_livro FROM dim_livros WHERE titulo = 'Sangue de Tinta'), '2023-08-09', '2023-12-31', 'físico', 0.00, 0.00, 4.0, 'É um livro denso, demorei um pouco para me envolver com a história.'),

    -- 2024
    ((SELECT id_livro FROM dim_livros WHERE titulo = 'O andar do bêbado: Como o acaso determina nossas vidas'), '2024-01-02', '2024-01-30', 'kindle', 0.00, 0.00, 4.0, ''),
    ((SELECT id_livro FROM dim_livros WHERE titulo = 'Se os gatos desaparecessem do mundo'), '2024-02-02', '2024-02-15', 'kindle', 0.00, 0.00, 4.0, ''),
    ((SELECT id_livro FROM dim_livros WHERE titulo = 'Vou te receitar um gato'), '2024-03-02', '2024-03-21', 'kindle', 0.00, 0.00, 4.0, 'É um livro fofo com várias histórias.'),
    ((SELECT id_livro FROM dim_livros WHERE titulo = 'A inconveniente loja de conveniência'), '2024-03-27', '2024-04-28', 'kindle', 0.00, 0.00, 3.5, 'Demorei um pouco para me envolver com os personagens.'),
    ((SELECT id_livro FROM dim_livros WHERE titulo = 'O gato que amava livros'), '2024-05-03', '2024-05-14', 'kindle', 0.00, 0.00, 4.0, ''),
    ((SELECT id_livro FROM dim_livros WHERE titulo = '15 Incríveis Truques Mentais: Facilite sua vida mudando sua mente'), '2024-06-02', '2024-06-02', 'kindle', 0.00, 0.00, 3.0, 'Leitura rápida e sem aprofundamento do assunto.'),
    ((SELECT id_livro FROM dim_livros WHERE titulo = 'Entregas expressas da Kiki'), '2024-06-14', '2024-07-02', 'kindle', 0.00, 0.00, 3.5, ''),
    ((SELECT id_livro FROM dim_livros WHERE titulo = 'Queria morrer, mas no céu não tem tteokbokki'), '2024-07-05', '2024-07-30', 'kindle', 0.00, 0.00, 3.5, 'É um livro mais pesado. É melhor ler quando você estiver se sentindo bem emocionalmente.'),
    ((SELECT id_livro FROM dim_livros WHERE titulo = 'Gente ansiosa'), '2024-08-02', '2024-08-27', 'kindle', 0.00, 0.00, 4.0, ''),
    ((SELECT id_livro FROM dim_livros WHERE titulo = 'O Gato Preto que Só Queria Ser Amado'), '2024-09-06', '2024-09-18', 'kindle', 0.00, 0.00, 3.5, ''),
    ((SELECT id_livro FROM dim_livros WHERE titulo = 'Uma noite na livraria Morisaki'), '2024-11-02', '2024-11-14', 'kindle', 0.00, 0.00, 4.0, ''),
    ((SELECT id_livro FROM dim_livros WHERE titulo = 'Meus dias na livraria Morisaki'), '2024-11-21', '2024-11-30', 'kindle', 0.00, 0.00, 4.0, ''),
    ((SELECT id_livro FROM dim_livros WHERE titulo = 'Bem-vindos à livraria Hyunam-dong'), '2024-12-02', '2024-12-31', 'kindle', 0.00, 0.00, 5.0, 'Amei esse livro. É aquele livro que você lê e se identifica com os personagens.'),

    -- 2025
    ((SELECT id_livro FROM dim_livros WHERE titulo = 'Amanhã, amanhã, e ainda outro amanhã'), '2024-12-23', '2025-01-15', 'kindle', 0.00, 0.00, 3.5, 'É um livro denso, demorei um pouco para me envolver com a história.'),
    ((SELECT id_livro FROM dim_livros WHERE titulo = 'Amêndoas'), '2025-02-01', '2025-02-22', 'kindle', 0.00, 0.00, 3.5, ''),
    ((SELECT id_livro FROM dim_livros WHERE titulo = 'Como tigres na neve'), '2025-02-23', '2025-03-02', 'kindle', 0.00, 0.00, 3.0, ''),
    ((SELECT id_livro FROM dim_livros WHERE titulo = 'Clube de leitura dos corações solitários'), '2025-03-03', '2025-04-01', 'kindle', 0.00, 0.00, 4.0, ''),
    ((SELECT id_livro FROM dim_livros WHERE titulo = 'O pequeno caderno das coisas não ditas'), '2025-04-02', '2025-04-28', 'kindle', 0.00, 0.00, 4.0, ''),
    ((SELECT id_livro FROM dim_livros WHERE titulo = 'As pessoas na plataforma 5'), '2025-04-29', '2025-05-12', 'kindle', 0.00, 0.00, 5.0, 'Amei esse livro! Cada personagem tem uma história tão rica e a trama é super envolvente.'),
    ((SELECT id_livro FROM dim_livros WHERE titulo = 'Tudo que a gente sempre quis'), '2025-05-13', '2025-05-26', 'kindle', 0.00, 0.00, 3.0, ''),
    ((SELECT id_livro FROM dim_livros WHERE titulo = 'Um experimento de amor em Nova York'), '2025-05-27', '2025-05-30', 'kindle', 0.00, 0.00, 5.0, 'Uma leitura viciante! Amei o desenvolvimento dos personagens e a trama envolvente.'),
    ((SELECT id_livro FROM dim_livros WHERE titulo = 'A noiva do Deus Mar'), '2025-06-01', '2025-06-30', 'kindle', 0.00, 0.00, 4.0, ''),
    ((SELECT id_livro FROM dim_livros WHERE titulo = 'O guardião das coisas perdidas'), '2025-07-13', '2025-07-27', 'kindle', 0.00, 0.00, 3.0, 'Achei que a história seria contada do ponto de vista do guardião, mas foi narrada do ponto de vista da protagonista.'),
    ((SELECT id_livro FROM dim_livros WHERE titulo = 'Vida de gato'), '2025-07-28', '2025-07-30', 'kindle', 0.00, 0.00, 3.0, 'É uma leitura rápida, mas não me cativou tanto quanto eu esperava.'),
    ((SELECT id_livro FROM dim_livros WHERE titulo = 'Mulherzinhas'), '2025-08-01', '2025-09-01', 'kindle', 0.00, 0.00, 4.0, ''),
    ((SELECT id_livro FROM dim_livros WHERE titulo = 'Algo como ser feliz'), '2025-09-02', '2025-09-27', 'kindle', 0.00, 0.00, 3.0, ''),
    ((SELECT id_livro FROM dim_livros WHERE titulo = 'Chocolate quente às quintas-feiras'), '2025-09-28', '2025-10-13', 'kindle', 0.00, 0.00, 4.0, 'É uma leitura divertida e leve, perfeita para relaxar e se distrair. Só queria saber mais sobre os personagens. Fiquei curiosa de como eles estão depois do final do livro.'),
    ((SELECT id_livro FROM dim_livros WHERE titulo = 'Matcha às segundas-feiras'), '2025-10-14', '2025-10-31', 'kindle', 0.00, 0.00, 4.0, 'A história se passa na mesma cafeteria do livro anterior, mas com personagens diferentes.'),
    ((SELECT id_livro FROM dim_livros WHERE titulo = 'Uma tempestade de verão'), '2025-11-01', '2025-11-16', 'kindle', 0.00, 0.00, 3.0, ''),
    ((SELECT id_livro FROM dim_livros WHERE titulo = 'Parte do meu mundo'), '2025-11-17', '2025-11-30', 'kindle', 0.00, 0.00, 3.0, ''),
    ((SELECT id_livro FROM dim_livros WHERE titulo = 'Sete verões'), '2025-12-01', '2025-12-20', 'kindle', 0.00, 0.00, 3.0, 'Achei massante a história da protagonista e o final não me agradou.'),

    -- 2026
    ((SELECT id_livro FROM dim_livros WHERE titulo = 'Yellowface'), '2025-12-22', '2026-01-12', 'kindle', 0.00, 0.00, 4.5, 'É um livro intrigante, que te deixa pensativa e revoltada. A escrita da autora é muito envolvente.'),
    ((SELECT id_livro FROM dim_livros WHERE titulo = 'A loja dos dias de chuva'), '2026-01-13', '2026-01-25', 'kindle', 0.00, 0.00, 4.0, 'É um livro leve e divertido, perfeito para passar o tempo.'),
    ((SELECT id_livro FROM dim_livros WHERE titulo = 'O burnout'), '2026-01-26', '2026-02-01', 'kindle', 0.00, 0.00, 3.5, 'O começo do livro é interessante, me identifiquei em algumas partes, mas o final me decepcionou um pouco.'),
    ((SELECT id_livro FROM dim_livros WHERE titulo = 'Uma magia destilada em veneno'), '2026-02-02', '2026-02-14', 'kindle', 0.00, 0.00, 4.0, 'A história é envolvente e o final fica em aberto, tendo que ler o próximo livro.'),
    ((SELECT id_livro FROM dim_livros WHERE titulo = 'Um veneno doce e sombrio'), '2026-02-16', '2026-02-27', 'kindle', 0.00, 12.21, 4.5, 'Estava ansiosa para saber como a história terminava. Têm alguns pontos que não me agradou muito, mas recomendo a leitura da coleção "Os livros do Chá"'),
    ((SELECT id_livro FROM dim_livros WHERE titulo = 'Meu Dom Quixote coreano'), '2026-02-28', '2026-03-13', 'kindle', 0.00, 0.00, 4.0, '');