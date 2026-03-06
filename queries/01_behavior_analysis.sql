-- =====================
-- Análise Comportamental 
-- =====================

-- Quantos livros são lidos por mês?
SELECT 
    DATE_FORMAT(data_fim, '%Y-%m') AS mes,
    COUNT(*) AS total_livros
FROM leituras
WHERE data_fim IS NOT NULL
GROUP BY mes
ORDER BY mes;

-- Tempo médio de leitura por ano
SELECT 
    YEAR(data_fim) AS ano,
    ROUND(AVG(DATEDIFF(data_fim, data_inicio)), 1) AS tempo_medio_leitura_dias
FROM leituras
WHERE data_fim IS NOT NULL
GROUP BY ano
ORDER BY ano DESC;

-- Tempo de leitura detalhado por categoria
SELECT 
    c.nome_categoria,
    COUNT(l.id_leitura) AS total_livros,
    ROUND(AVG(DATEDIFF(l.data_fim, l.data_inicio)), 1) AS media_dias
FROM leituras l
JOIN livros lv ON l.id_livro = lv.id_livro
JOIN categorias c ON lv.id_categoria = c.id_categoria
WHERE l.data_fim IS NOT NULL
GROUP BY c.nome_categoria
ORDER BY media_dias DESC;

-- Quantidade de livros lidos por ano, total de páginas lidas e média de páginas por livro  
SELECT 
    YEAR(l.data_fim) AS ano,
    COUNT(l.id_leitura) AS total_livros,
    SUM(lv.numero_paginas) AS total_paginas_lidas,
    ROUND(AVG(lv.numero_paginas), 0) AS media_paginas_por_livro
FROM leituras l
JOIN livros lv ON l.id_livro = lv.id_livro
WHERE l.data_fim IS NOT NULL
GROUP BY ano
ORDER BY ano DESC;

-- Média de páginas lidas por dia, detalhada por categoria
SELECT 
    c.nome_categoria,
    ROUND(AVG(lv.numero_paginas / DATEDIFF(l.data_fim, l.data_inicio)), 1) AS pags_por_dia_media
FROM leituras l
JOIN livros lv ON l.id_livro = lv.id_livro
JOIN categorias c ON lv.id_categoria = c.id_categoria
WHERE l.data_fim IS NOT NULL
GROUP BY 1
ORDER BY 2 DESC;