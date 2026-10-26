-- =========================================================
-- ANÁLISES AVANÇADAS E VIEW PARA POWER BI
-- =========================================================
USE book_analytics;

-- 1. VIEW PARA POWER BI
CREATE OR REPLACE VIEW vw_analise_literaria_pbi AS
SELECT
    fl.id_leitura,
    fl.id_livro,
    dl.titulo AS livro_titulo,
    dl.autor AS autor_nome,
    dl.editora AS editora_nome,
    cat.categorias,
    dl.ano_publicacao,
    dl.numero_paginas,
    fl.formato,
    fl.origem_acesso,
    fl.status_leitura,
    fl.intencao_compra,
    fl.data_inicio,
    fl.data_fim,
    DATE_FORMAT(fl.data_inicio, '%Y-%m') AS mes_inicio,
    DATE_FORMAT(fl.data_fim, '%Y-%m') AS mes_conclusao,
    fl.valor_pago,
    fl.preco_digital_na_leitura,
    fl.preco_fisico_na_leitura,
    fl.nota,
    fl.opiniao_texto,
    CASE
        WHEN fl.status_leitura = 'Lido' AND fl.data_fim IS NOT NULL
        THEN DATEDIFF(fl.data_fim, fl.data_inicio) + 1
        ELSE NULL
    END AS dias_leitura,
    CASE
        WHEN fl.status_leitura = 'Lido' AND fl.data_fim IS NOT NULL
        THEN ROUND(dl.numero_paginas / NULLIF(DATEDIFF(fl.data_fim, fl.data_inicio) + 1, 0), 2)
        ELSE NULL
    END AS paginas_por_dia,
    CASE
        WHEN fl.origem_acesso = 'Kindle Unlimited'
             AND fl.status_leitura = 'Lido'
             AND fl.data_fim IS NOT NULL
        THEN ROUND(ass.custo_assinatura / NULLIF(ku.livros_concluidos_ku, 0), 2)
        ELSE NULL
    END AS custo_rateado_estimado
FROM fato_leituras AS fl
INNER JOIN dim_livros AS dl
    ON dl.id_livro = fl.id_livro
LEFT JOIN (
    SELECT
        lc.id_livro,
        GROUP_CONCAT(DISTINCT c.categoria ORDER BY c.categoria SEPARATOR ', ') AS categorias
    FROM livro_categoria AS lc
    INNER JOIN dim_categoria AS c ON c.id_categoria = lc.id_categoria
    GROUP BY lc.id_livro
) AS cat ON cat.id_livro = fl.id_livro
LEFT JOIN (
    SELECT
        DATE_FORMAT(mes_referencia, '%Y-%m') AS mes_referencia,
        SUM(valor_mensal) AS custo_assinatura
    FROM fato_assinatura
    WHERE servico = 'Kindle Unlimited'
    GROUP BY DATE_FORMAT(mes_referencia, '%Y-%m')
) AS ass ON ass.mes_referencia = DATE_FORMAT(fl.data_fim, '%Y-%m')
LEFT JOIN (
    SELECT
        DATE_FORMAT(data_fim, '%Y-%m') AS mes_referencia,
        COUNT(*) AS livros_concluidos_ku
    FROM fato_leituras
    WHERE origem_acesso = 'Kindle Unlimited'
      AND status_leitura = 'Lido'
      AND data_fim IS NOT NULL
    GROUP BY DATE_FORMAT(data_fim, '%Y-%m')
) AS ku ON ku.mes_referencia = DATE_FORMAT(fl.data_fim, '%Y-%m');

-- 2. EVOLUÇÃO MENSAL COM VARIAÇÃO MÊS A MÊS E MÉDIA MÓVEL
WITH leituras_mensais AS (
    SELECT
        CAST(DATE_FORMAT(data_fim, '%Y-%m-01') AS DATE) AS mes,
        COUNT(*) AS livros_concluidos,
        ROUND(AVG(nota), 2) AS nota_media
    FROM fato_leituras
    WHERE status_leitura = 'Lido'
      AND data_fim IS NOT NULL
    GROUP BY CAST(DATE_FORMAT(data_fim, '%Y-%m-01') AS DATE)
),
metricas AS (
    SELECT
        mes,
        livros_concluidos,
        nota_media,
        LAG(livros_concluidos) OVER (ORDER BY mes) AS livros_mes_anterior,
        AVG(livros_concluidos) OVER (
            ORDER BY mes ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
        ) AS media_movel_3_periodos
    FROM leituras_mensais
)
SELECT
    DATE_FORMAT(mes, '%Y-%m') AS mes_referencia,
    livros_concluidos,
    livros_mes_anterior,
    livros_concluidos - livros_mes_anterior AS variacao_absoluta,
    ROUND(100.0 * (livros_concluidos - livros_mes_anterior) / NULLIF(livros_mes_anterior, 0), 2) AS variacao_percentual,
    ROUND(media_movel_3_periodos, 2) AS media_movel_3_periodos,
    nota_media
FROM metricas
ORDER BY mes;

-- 3. RANKING DE LIVROS POR NOTA DENTRO DE CADA CATEGORIA
WITH livros_por_categoria AS (
    SELECT
        c.categoria,
        dl.id_livro,
        dl.titulo,
        dl.autor,
        COUNT(fl.id_leitura) AS total_registros,
        ROUND(AVG(fl.nota), 2) AS nota_media
    FROM dim_categoria AS c
    INNER JOIN livro_categoria AS lc ON lc.id_categoria = c.id_categoria
    INNER JOIN dim_livros AS dl ON dl.id_livro = lc.id_livro
    INNER JOIN fato_leituras AS fl ON fl.id_livro = dl.id_livro
    GROUP BY c.categoria, dl.id_livro, dl.titulo, dl.autor
),
ranking AS (
    SELECT
        *,
        DENSE_RANK() OVER (
            PARTITION BY categoria
            ORDER BY nota_media DESC, total_registros DESC
        ) AS ranking_na_categoria
    FROM livros_por_categoria
)
SELECT
    categoria,
    ranking_na_categoria,
    titulo,
    autor,
    total_registros,
    nota_media
FROM ranking
WHERE ranking_na_categoria <= 5
ORDER BY categoria, ranking_na_categoria, titulo;

-- 4. ACUMULADO DE PÁGINAS LIDAS POR MÊS
WITH paginas_mensais AS (
    SELECT
        CAST(DATE_FORMAT(fl.data_fim, '%Y-%m-01') AS DATE) AS mes,
        SUM(COALESCE(dl.numero_paginas, 0)) AS paginas_lidas
    FROM fato_leituras AS fl
    INNER JOIN dim_livros AS dl ON dl.id_livro = fl.id_livro
    WHERE fl.status_leitura = 'Lido'
      AND fl.data_fim IS NOT NULL
    GROUP BY CAST(DATE_FORMAT(fl.data_fim, '%Y-%m-01') AS DATE)
)
SELECT
    DATE_FORMAT(mes, '%Y-%m') AS mes_referencia,
    paginas_lidas,
    SUM(paginas_lidas) OVER (ORDER BY mes ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS paginas_acumuladas
FROM paginas_mensais
ORDER BY mes;

-- 5. INDICADORES DE LEITURA POR ORIGEM: SHARE E RANKING DE AVALIAÇÃO
WITH resumo_origem AS (
    SELECT
        origem_acesso,
        COUNT(*) AS total_registros,
        SUM(status_leitura = 'Lido') AS livros_concluidos,
        ROUND(AVG(nota), 2) AS nota_media
    FROM fato_leituras
    GROUP BY origem_acesso
)
SELECT
    origem_acesso,
    total_registros,
    livros_concluidos,
    ROUND(100.0 * total_registros / NULLIF(SUM(total_registros) OVER (), 0), 2) AS percentual_dos_registros,
    nota_media,
    DENSE_RANK() OVER (ORDER BY nota_media DESC) AS ranking_nota_media
FROM resumo_origem
ORDER BY total_registros DESC;