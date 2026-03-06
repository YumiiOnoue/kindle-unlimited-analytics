-- =====================
-- Ranking e Segmentação
-- =====================

-- Ranking de autores por nota média

SELECT 
    a.nome AS autor,
    COUNT(lv.id_livro) AS livros_lidos,
    ROUND(AVG(av.nota), 2) AS nota_media
FROM avaliacoes av
JOIN leituras l ON av.id_leitura = l.id_leitura
JOIN livros lv ON l.id_livro = lv.id_livro
JOIN autores a ON lv.id_autor = a.id_autor
GROUP BY a.nome
HAVING livros_lidos >= 1 
ORDER BY nota_media DESC;