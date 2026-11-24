-- =========================================================
-- RANKING E SEGMENTAÇÃO
-- =========================================================
USE book_analytics;

-- =========================================================
-- 1. RANKING DE AUTORES
-- =========================================================
SELECT
    dl.autor,
    COUNT(fl.id_leitura) AS total_registros_leitura,
    SUM(fl.status_leitura = 'Lido') AS livros_concluidos,
    ROUND(AVG(fl.nota), 2) AS nota_media
FROM fato_leituras AS fl
INNER JOIN dim_livros AS dl ON dl.id_livro = fl.id_livro
GROUP BY dl.autor
HAVING COUNT(fl.id_leitura) >= 1
ORDER BY nota_media DESC, livros_concluidos DESC, dl.autor;

-- =========================================================
-- 2. RANKING DE AUTORES COM MÍNIMO DE DUAS LEITURAS
-- =========================================================
SELECT
    dl.autor,
    COUNT(*) AS total_registros_leitura,
    SUM(fl.status_leitura = 'Lido') AS livros_concluidos,
    ROUND(AVG(fl.nota), 2) AS nota_media
FROM fato_leituras AS fl
INNER JOIN dim_livros AS dl ON dl.id_livro = fl.id_livro
GROUP BY dl.autor
HAVING COUNT(*) >= 2
ORDER BY nota_media DESC, total_registros_leitura DESC, dl.autor;

-- =========================================================
-- 3. ANÁLISE POR CATEGORIA
-- =========================================================
SELECT
    c.id_categoria,
    c.categoria,
    COUNT(DISTINCT fl.id_leitura) AS total_registros_leitura,
    COUNT(DISTINCT CASE WHEN fl.status_leitura = 'Lido' THEN fl.id_leitura END) AS livros_concluidos,
    ROUND(AVG(fl.nota), 2) AS nota_media,
    ROUND(AVG(
        CASE WHEN fl.status_leitura = 'Lido' AND fl.data_fim IS NOT NULL
             THEN DATEDIFF(fl.data_fim, fl.data_inicio) + 1 END
    ), 1) AS media_dias_leitura
FROM dim_categoria AS c
INNER JOIN livro_categoria AS lc ON lc.id_categoria = c.id_categoria
INNER JOIN fato_leituras AS fl ON fl.id_livro = lc.id_livro
GROUP BY c.id_categoria, c.categoria
ORDER BY livros_concluidos DESC, nota_media DESC;

-- =========================================================
-- 4. ORIGEM DE ACESSO X FORMATO
-- =========================================================
SELECT
    origem_acesso,
    formato,
    COUNT(*) AS total_registros,
    SUM(status_leitura = 'Lido') AS livros_concluidos,
    SUM(status_leitura = 'Lendo') AS leituras_em_andamento,
    SUM(status_leitura = 'Abandonado') AS leituras_abandonadas,
    ROUND(AVG(nota), 2) AS nota_media
FROM fato_leituras
GROUP BY origem_acesso, formato
ORDER BY total_registros DESC;

-- =========================================================
-- 5. MOTIVAÇÃO DE LEITURA
-- =========================================================
SELECT
    f.motivacao_leitura,
    COUNT(*) AS total_registros,
    SUM(f.origem_acesso = 'Kindle+') AS registros_via_ku,
    SUM(f.origem_acesso = 'Compra') AS registros_com_origem_compra,
    ROUND(AVG(NULLIF(d.preco_digital, 0)), 2) AS preco_digital_medio,
    ROUND(AVG(NULLIF(d.preco_fisico, 0)), 2) AS preco_fisico_medio,
    ROUND(AVG(f.nota), 2) AS nota_media,
    ROUND(SUM(CASE
        WHEN f.origem_acesso = 'Kindle+' AND f.motivacao_leitura = 'Sim'
        THEN COALESCE(NULLIF(d.preco_digital, 0), 0)
        ELSE 0
    END), 2) AS soma_referencia_digital_conhecida_para_intencao_sim
FROM fato_leituras f
JOIN dim_livros d ON f.id_livro = d.id_livro
GROUP BY f.motivacao_leitura
ORDER BY total_registros DESC;

-- =========================================================
-- 6. FAIXAS DE PREÇO DIGITAL DE REFERÊNCIA
-- =========================================================
SELECT
    CASE
        WHEN d.preco_digital IS NULL OR d.preco_digital = 0 THEN 'Sem preço conhecido'
        WHEN d.preco_digital < 15 THEN 'Até R$ 14,99'
        WHEN d.preco_digital < 30 THEN 'R$ 15 a R$ 29,99'
        WHEN d.preco_digital < 50 THEN 'R$ 30 a R$ 49,99'
        ELSE 'R$ 50 ou mais'
    END AS faixa_preco_digital,
    COUNT(*) AS total_registros,
    SUM(f.origem_acesso = 'Kindle+') AS registros_via_ku,
    SUM(f.motivacao_leitura = 'Sim') AS motivacao_leitura_sim,
    ROUND(AVG(f.nota), 2) AS nota_media
FROM fato_leituras f
JOIN dim_livros d ON f.id_livro = d.id_livro
GROUP BY faixa_preco_digital
ORDER BY
    CASE faixa_preco_digital
        WHEN 'Até R$ 14,99' THEN 1
        WHEN 'R$ 15 a R$ 29,99' THEN 2
        WHEN 'R$ 30 a R$ 49,99' THEN 3
        WHEN 'R$ 50 ou mais' THEN 4
        ELSE 5
    END;

-- =========================================================
-- 7. EDITORAS: VOLUME E AVALIAÇÃO
-- =========================================================
SELECT
    dl.editora,
    COUNT(fl.id_leitura) AS total_registros,
    SUM(fl.status_leitura = 'Lido') AS livros_concluidos,
    ROUND(AVG(fl.nota), 2) AS nota_media
FROM fato_leituras AS fl
INNER JOIN dim_livros AS dl ON dl.id_livro = fl.id_livro
GROUP BY dl.editora
ORDER BY livros_concluidos DESC, nota_media DESC;
