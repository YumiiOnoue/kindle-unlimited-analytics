-- =====================
-- Ranking e Segmentação
-- =====================

-- Ranking de autores por nota média

SELECT 
    dl.autor,
    COUNT(fl.id_leitura) AS livros_lidos,
    ROUND(AVG(fl.nota), 2) AS nota_media
FROM fato_leituras fl
INNER JOIN dim_livros dl ON fl.id_livro = dl.id_livro
GROUP BY dl.autor
HAVING livros_lidos >= 1
ORDER BY nota_media DESC, livros_lidos DESC;