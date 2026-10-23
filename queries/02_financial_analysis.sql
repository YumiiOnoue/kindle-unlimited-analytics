-- =====================
-- Análise Financeira
-- =====================
USE book_analytics;

-- =========================================================
-- 1. INVESTIMENTO TOTAL EM LIVROS POR ANO (ASSINATURAS + COMPRAS AVULSAS)
-- =========================================================
-- Agrupa primeiro as granularidades separadas para evitar somas duplicadas via JOIN
WITH total_leituras_ano AS (
    SELECT 
        YEAR(data_fim) AS ano,
        COUNT(id_leitura) AS total_livros,
        SUM(valor_pago) AS investimento_compras
    FROM fato_leituras
    WHERE data_fim IS NOT NULL
    GROUP BY YEAR(data_fim)
),
total_assinaturas_ano AS (
    SELECT 
        YEAR(mes_referencia) AS ano,
        SUM(valor_mensal) AS investimento_assinatura
    FROM fato_assinatura
    GROUP BY YEAR(mes_referencia)
)
SELECT 
    l.ano,
    COALESCE(l.investimento_compras, 0.00) AS investimento_compras,
    COALESCE(a.investimento_assinatura, 0.00) AS investimento_assinaturas,
    (COALESCE(l.investimento_compras, 0.00) + COALESCE(a.investimento_assinatura, 0.00)) AS investimento_total,
    l.total_livros,
    ROUND(
        (COALESCE(l.investimento_compras, 0.00) + COALESCE(a.investimento_assinatura, 0.00)) / NULLIF(l.total_livros, 0), 
        2
    ) AS custo_medio_anual_por_livro
FROM total_leituras_ano l
LEFT JOIN total_assinaturas_ano a ON l.ano = a.ano
ORDER BY l.ano DESC;


-- =========================================================
-- 2. GASTOS MENSAIS TOTAIS (MENSALIDADE + COMPRAS AVULSAS)
-- =========================================================
-- Considera a competência de cobrança da assinatura como base
WITH compras_mes AS (
    SELECT 
        DATE_FORMAT(data_fim, '%Y-%m') AS mes,
        SUM(valor_pago) AS custo_compras_avulsas
    FROM fato_leituras
    WHERE valor_pago > 0
    GROUP BY DATE_FORMAT(data_fim, '%Y-%m')
),
assinatura_mes AS (
    SELECT 
        DATE_FORMAT(mes_referencia, '%Y-%m') AS mes,
        SUM(valor_mensal) AS custo_assinatura
    FROM fato_assinatura
    GROUP BY DATE_FORMAT(mes_referencia, '%Y-%m')
)
SELECT 
    a.mes,
    COALESCE(a.custo_assinatura, 0.00) AS custo_assinatura,
    COALESCE(c.custo_compras_avulsas, 0.00) AS custo_compras_avulsas,
    (COALESCE(a.custo_assinatura, 0.00) + COALESCE(c.custo_compras_avulsas, 0.00)) AS total_mes
FROM assinatura_mes a
LEFT JOIN compras_mes c ON a.mes = c.mes
ORDER BY a.mes DESC;


-- =========================================================
-- 3. CUSTO EFETIVO POR LIVRO NO KINDLE UNLIMITED (POR MÊS)
-- =========================================================
WITH leituras_ku AS (
    SELECT 
        DATE_FORMAT(data_fim, '%Y-%m') AS mes,
        COUNT(id_leitura) AS total_livros_ku
    FROM fato_leituras
    WHERE formato = 'kindle' AND valor_pago = 0.00
    GROUP BY DATE_FORMAT(data_fim, '%Y-%m')
),
assinatura_ku AS (
    SELECT 
        DATE_FORMAT(mes_referencia, '%Y-%m') AS mes,
        SUM(valor_mensal) AS custo_assinatura
    FROM fato_assinatura
    WHERE servico = 'Kindle Unlimited'
    GROUP BY DATE_FORMAT(mes_referencia, '%Y-%m')
)
SELECT 
    a.mes,
    COALESCE(l.total_livros_ku, 0) AS total_livros_ku,
    a.custo_assinatura,
    ROUND(a.custo_assinatura / NULLIF(l.total_livros_ku, 0), 2) AS custo_efetivo_por_livro
FROM assinatura_ku a
LEFT JOIN leituras_ku l ON a.mes = l.mes
ORDER BY a.mes DESC;


-- =========================================================
-- 4. CUSTO MÉDIO POR PÁGINA (INVESTIMENTO TOTAL / PÁGINAS LIDAS)
-- =========================================================
WITH paginas_ano AS (
    SELECT 
        YEAR(fl.data_fim) AS ano,
        SUM(fl.valor_pago) AS compras_avulsas_ano,
        SUM(dl.numero_paginas) AS total_paginas_lidas_ano
    FROM fato_leituras fl
    LEFT JOIN dim_livros dl ON fl.id_livro = dl.id_livro
    WHERE fl.data_fim IS NOT NULL
    GROUP BY YEAR(fl.data_fim)
),
assinatura_ano AS (
    SELECT 
        YEAR(mes_referencia) AS ano,
        SUM(valor_mensal) AS total_assinatura_ano
    FROM fato_assinatura
    GROUP BY YEAR(mes_referencia)
)
SELECT 
    p.ano,
    (COALESCE(a.total_assinatura_ano, 0.00) + COALESCE(p.compras_avulsas_ano, 0.00)) AS investimento_total_ano,
    COALESCE(p.total_paginas_lidas_ano, 0) AS total_paginas_lidas_geral,
    ROUND(
        (COALESCE(a.total_assinatura_ano, 0.00) + COALESCE(p.compras_avulsas_ano, 0.00)) 
        / NULLIF(p.total_paginas_lidas_ano, 0), 
        4
    ) AS custo_por_pagina_geral
FROM paginas_ano p
LEFT JOIN assinatura_ano a ON p.ano = a.ano
ORDER BY p.ano DESC;