-- =====================
-- Análise Comportamental 
-- =====================

USE book_analytics;

-- =========================================================
-- 1. QUANTOS LIVROS SÃO LIDOS POR MÊS?
-- =========================================================
SELECT 
    DATE_FORMAT(data_fim, '%Y-%m') AS mes,
    COUNT(*) AS total_livros
FROM fato_leituras
WHERE data_fim IS NOT NULL
GROUP BY DATE_FORMAT(data_fim, '%Y-%m')
ORDER BY mes;

-- =========================================================
-- 2. TEMPO MÉDIO DE LEITURA (EM DIAS) POR ANO
-- =========================================================
SELECT 
    YEAR(data_fim) AS ano,
    COUNT(id_leitura) AS total_livros,
    ROUND(AVG(DATEDIFF(data_fim, data_inicio) + 1), 1) AS tempo_medio_leitura_dias
FROM fato_leituras
WHERE data_fim IS NOT NULL
GROUP BY YEAR(data_fim)
ORDER BY ano DESC;


-- =========================================================
-- 3. QUANTIDADE DE LIVROS LIDOS, TOTAL E MÉDIA DE PÁGINAS POR ANO
-- =========================================================
SELECT 
    YEAR(fl.data_fim) AS ano,
    COUNT(fl.id_leitura) AS total_livros,
    SUM(dl.numero_paginas) AS total_paginas_lidas,
    ROUND(AVG(dl.numero_paginas), 0) AS media_paginas_por_livro
FROM fato_leituras fl
INNER JOIN dim_livros dl ON fl.id_livro = dl.id_livro
WHERE fl.data_fim IS NOT NULL
GROUP BY YEAR(fl.data_fim)
ORDER BY ano DESC;
