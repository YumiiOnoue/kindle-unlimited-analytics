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


-- =========================================================
-- 4. TEMPO DE LEITURA DETALHADO POR CATEGORIA (DESMEMBRANDO MULTITAGS)
-- =========================================================
WITH RECURSIVE categorias_desmembradas AS (
    -- Separa categorias delimitadas por vírgula em linhas individuais
    SELECT 
        fl.id_leitura,
        (DATEDIFF(fl.data_fim, fl.data_inicio) + 1) AS dias_leitura,
        TRIM(REGEXP_SUBSTR(dl.categorias, '[^,]+', 1, 1)) AS categoria,
        1 AS nivel
    FROM fato_leituras fl
    INNER JOIN dim_livros dl ON fl.id_livro = dl.id_livro
    WHERE fl.data_fim IS NOT NULL
    
    UNION ALL
    
    SELECT 
        fl.id_leitura,
        (DATEDIFF(fl.data_fim, fl.data_inicio) + 1) AS dias_leitura,
        TRIM(REGEXP_SUBSTR(dl.categorias, '[^,]+', 1, nivel + 1)) AS categoria,
        nivel + 1
    FROM fato_leituras fl
    INNER JOIN dim_livros dl ON fl.id_livro = dl.id_livro
    INNER JOIN categorias_desmembradas cd ON fl.id_leitura = cd.id_leitura
    WHERE REGEXP_SUBSTR(dl.categorias, '[^,]+', 1, nivel + 1) IS NOT NULL
)
SELECT 
    categoria,
    COUNT(id_leitura) AS total_leituras,
    ROUND(AVG(dias_leitura), 1) AS media_dias_por_livro
FROM categorias_desmembradas
WHERE categoria <> ''
GROUP BY categoria
ORDER BY media_dias_por_livro DESC;


-- =========================================================
-- 5. MÉDIA DE PÁGINAS LIDAS POR DIA POR CATEGORIA
-- =========================================================
WITH RECURSIVE categorias_desmembradas AS (
    SELECT 
        fl.id_leitura,
        dl.numero_paginas,
        (DATEDIFF(fl.data_fim, fl.data_inicio) + 1) AS dias_leitura,
        TRIM(REGEXP_SUBSTR(dl.categorias, '[^,]+', 1, 1)) AS categoria,
        1 AS nivel
    FROM fato_leituras fl
    INNER JOIN dim_livros dl ON fl.id_livro = dl.id_livro
    WHERE fl.data_fim IS NOT NULL
    
    UNION ALL
    
    SELECT 
        fl.id_leitura,
        dl.numero_paginas,
        (DATEDIFF(fl.data_fim, fl.data_inicio) + 1) AS dias_leitura,
        TRIM(REGEXP_SUBSTR(dl.categorias, '[^,]+', 1, nivel + 1)) AS categoria,
        nivel + 1
    FROM fato_leituras fl
    INNER JOIN dim_livros dl ON fl.id_livro = dl.id_livro
    INNER JOIN categorias_desmembradas cd ON fl.id_leitura = cd.id_leitura
    WHERE REGEXP_SUBSTR(dl.categorias, '[^,]+', 1, nivel + 1) IS NOT NULL
)
SELECT 
    categoria,
    ROUND(AVG(numero_paginas / NULLIF(dias_leitura, 0)), 1) AS media_paginas_por_dia
FROM categorias_desmembradas
WHERE categoria <> ''
GROUP BY categoria
ORDER BY media_paginas_por_dia DESC;