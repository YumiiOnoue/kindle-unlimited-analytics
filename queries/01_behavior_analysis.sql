-- =========================================================
-- ANÁLISE COMPORTAMENTAL DE LEITURA
-- =========================================================
USE book_analytics;

-- 1. VISÃO GERAL: volume, status e avaliação
SELECT
    COUNT(*) AS total_registros_leitura,
    COUNT(DISTINCT id_livro) AS livros_distintos,
    SUM(status_leitura = 'Lido') AS leituras_concluidas,
    SUM(status_leitura = 'Lendo') AS leituras_em_andamento,
    SUM(status_leitura = 'Abandonado') AS leituras_abandonadas,
    ROUND(AVG(nota), 2) AS nota_media_geral,
    ROUND(100.0 * SUM(status_leitura = 'Lido') / NULLIF(COUNT(*), 0), 2) AS percentual_concluido
FROM fato_leituras;

-- 2. CONCLUSÕES POR MÊS
SELECT
    DATE_FORMAT(data_fim, '%Y-%m') AS mes_referencia,
    COUNT(*) AS livros_concluidos,
    ROUND(AVG(nota), 2) AS nota_media,
    ROUND(AVG(DATEDIFF(data_fim, data_inicio) + 1), 1) AS media_dias_leitura,
    SUM(formato = 'Digital') AS leituras_digitais,
    SUM(formato = 'Físico') AS leituras_fisicas,
    SUM(origem_acesso = 'Kindle+') AS leituras_via_ku
FROM fato_leituras
WHERE status_leitura = 'Lido'
  AND data_fim IS NOT NULL
GROUP BY DATE_FORMAT(data_fim, '%Y-%m')
ORDER BY mes_referencia;

-- 3. VOLUME, PÁGINAS E TEMPO MÉDIO POR ANO DE CONCLUSÃO
SELECT
    YEAR(fl.data_fim) AS ano,
    COUNT(*) AS livros_concluidos,
    SUM(COALESCE(dl.numero_paginas, 0)) AS total_paginas_lidas,
    ROUND(AVG(NULLIF(dl.numero_paginas, 0)), 1) AS media_paginas_por_livro,
    ROUND(AVG(DATEDIFF(fl.data_fim, fl.data_inicio) + 1), 1) AS media_dias_por_livro,
    ROUND(AVG(fl.nota), 2) AS nota_media
FROM fato_leituras AS fl
INNER JOIN dim_livros AS dl ON dl.id_livro = fl.id_livro
WHERE fl.status_leitura = 'Lido'
  AND fl.data_fim IS NOT NULL
GROUP BY YEAR(fl.data_fim)
ORDER BY ano;

-- 4. DISTRIBUIÇÃO POR STATUS
SELECT
    status_leitura,
    COUNT(*) AS total_leituras,
    ROUND(100.0 * COUNT(*) / NULLIF((SELECT COUNT(*) FROM fato_leituras), 0), 2) AS percentual_registros,
    ROUND(AVG(nota), 2) AS nota_media
FROM fato_leituras
GROUP BY status_leitura
ORDER BY total_leituras DESC;

-- 5. TEMPO DE LEITURA POR ORIGEM DE ACESSO E FORMATO
SELECT
    origem_acesso,
    formato,
    COUNT(*) AS livros_concluidos,
    ROUND(AVG(DATEDIFF(data_fim, data_inicio) + 1), 1) AS media_dias_leitura,
    ROUND(AVG(nota), 2) AS nota_media,
    ROUND(AVG(numero_paginas), 1) AS media_paginas
FROM fato_leituras AS fl
INNER JOIN dim_livros AS dl ON dl.id_livro = fl.id_livro
WHERE fl.status_leitura = 'Lido'
  AND fl.data_fim IS NOT NULL
GROUP BY origem_acesso, formato
ORDER BY livros_concluidos DESC;

-- 6. LIVROS COM MAIOR TEMPO DE LEITURA
SELECT
    dl.titulo,
    dl.autor,
    fl.data_inicio,
    fl.data_fim,
    DATEDIFF(fl.data_fim, fl.data_inicio) + 1 AS dias_leitura,
    dl.numero_paginas,
    ROUND(dl.numero_paginas / NULLIF(DATEDIFF(fl.data_fim, fl.data_inicio) + 1, 0), 2) AS paginas_por_dia,
    fl.nota
FROM fato_leituras AS fl
INNER JOIN dim_livros AS dl ON dl.id_livro = fl.id_livro
WHERE fl.status_leitura = 'Lido'
  AND fl.data_fim IS NOT NULL
ORDER BY dias_leitura DESC
LIMIT 10;
