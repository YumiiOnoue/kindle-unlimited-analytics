-- =========================================================
-- ANÁLISE FINANCEIRA
-- =========================================================
USE book_analytics;

-- 1. CUSTO ANUAL: mensalidades e compras efetivamente pagas
WITH compras_ano AS (
    SELECT
        YEAR(data_inicio) AS ano,
        SUM(valor_pago) AS total_compras_pagamento
    FROM fato_leituras
    WHERE origem_acesso = 'Compra'
    GROUP BY YEAR(data_inicio)
),
assinaturas_ano AS (
    SELECT
        YEAR(mes_referencia) AS ano,
        SUM(valor_mensal) AS total_assinaturas
    FROM fato_assinatura
    WHERE servico = 'Kindle Unlimited'
    GROUP BY YEAR(mes_referencia)
),
anos AS (
    SELECT ano FROM compras_ano
    UNION
    SELECT ano FROM assinaturas_ano
)
SELECT
    a.ano,
    ROUND(COALESCE(c.total_compras_pagamento, 0), 2) AS gastos_compras,
    ROUND(COALESCE(s.total_assinaturas, 0), 2) AS gastos_assinatura_ku,
    ROUND(COALESCE(c.total_compras_pagamento, 0) + COALESCE(s.total_assinaturas, 0), 2) AS gasto_total_registrado
FROM anos AS a
LEFT JOIN compras_ano AS c ON c.ano = a.ano
LEFT JOIN assinaturas_ano AS s ON s.ano = a.ano
ORDER BY a.ano;

-- 2. CUSTOS MENSAIS REGISTRADOS
WITH compras_mes AS (
    SELECT
        DATE_FORMAT(data_inicio, '%Y-%m') AS mes_referencia,
        SUM(valor_pago) AS gastos_compras,
        COUNT(*) AS registros_compra
    FROM fato_leituras
    WHERE origem_acesso = 'Compra'
    GROUP BY DATE_FORMAT(data_inicio, '%Y-%m')
),
assinaturas_mes AS (
    SELECT
        DATE_FORMAT(mes_referencia, '%Y-%m') AS mes_referencia,
        SUM(valor_mensal) AS custo_assinatura
    FROM fato_assinatura
    WHERE servico = 'Kindle Unlimited'
    GROUP BY DATE_FORMAT(mes_referencia, '%Y-%m')
),
meses AS (
    SELECT mes_referencia FROM compras_mes
    UNION
    SELECT mes_referencia FROM assinaturas_mes
)
SELECT
    m.mes_referencia,
    ROUND(COALESCE(a.custo_assinatura, 0), 2) AS custo_assinatura_ku,
    ROUND(COALESCE(c.gastos_compras, 0), 2) AS gastos_compras,
    ROUND(COALESCE(a.custo_assinatura, 0) + COALESCE(c.gastos_compras, 0), 2) AS gasto_total_registrado,
    COALESCE(c.registros_compra, 0) AS registros_compra
FROM meses AS m
LEFT JOIN assinaturas_mes AS a ON a.mes_referencia = m.mes_referencia
LEFT JOIN compras_mes AS c ON c.mes_referencia = m.mes_referencia
ORDER BY m.mes_referencia;

-- 3. CUSTO DA ASSINATURA POR LIVRO CONCLUÍDO VIA KU, POR MÊS
WITH leituras_ku_mes AS (
    SELECT
        DATE_FORMAT(data_fim, '%Y-%m') AS mes_referencia,
        COUNT(*) AS livros_concluidos_ku
    FROM fato_leituras
    WHERE origem_acesso = 'Kindle Unlimited'
      AND status_leitura = 'Lido'
      AND data_fim IS NOT NULL
    GROUP BY DATE_FORMAT(data_fim, '%Y-%m')
),
assinaturas_mes AS (
    SELECT
        DATE_FORMAT(mes_referencia, '%Y-%m') AS mes_referencia,
        SUM(valor_mensal) AS custo_assinatura
    FROM fato_assinatura
    WHERE servico = 'Kindle Unlimited'
    GROUP BY DATE_FORMAT(mes_referencia, '%Y-%m')
)
SELECT
    a.mes_referencia,
    ROUND(a.custo_assinatura, 2) AS custo_assinatura,
    COALESCE(l.livros_concluidos_ku, 0) AS livros_concluidos_ku,
    ROUND(a.custo_assinatura / NULLIF(l.livros_concluidos_ku, 0), 2) AS custo_rateado_por_livro_concluido
FROM assinaturas_mes AS a
LEFT JOIN leituras_ku_mes AS l ON l.mes_referencia = a.mes_referencia
ORDER BY a.mes_referencia;

-- 4. VALOR DE REFERÊNCIA DOS LIVROS CONCLUÍDOS VIA KU, POR MÊS
SELECT
    DATE_FORMAT(data_fim, '%Y-%m') AS mes_referencia,
    COUNT(*) AS livros_concluidos_ku,
    SUM(NULLIF(preco_digital_na_leitura, 0)) AS soma_precos_digitais_conhecidos,
    SUM(NULLIF(preco_fisico_na_leitura, 0)) AS soma_precos_fisicos_conhecidos,
    ROUND(AVG(NULLIF(preco_digital_na_leitura, 0)), 2) AS preco_digital_medio_conhecido,
    ROUND(AVG(nota), 2) AS nota_media
FROM fato_leituras
WHERE origem_acesso = 'Kindle Unlimited'
  AND status_leitura = 'Lido'
  AND data_fim IS NOT NULL
GROUP BY DATE_FORMAT(data_fim, '%Y-%m')
ORDER BY mes_referencia;

-- 5. COMPARAÇÃO MENSAL: VALOR DIGITAL DE REFERÊNCIA X MENSALIDADE KU
WITH valor_livros_mes AS (
    SELECT
        DATE_FORMAT(data_fim, '%Y-%m') AS mes_referencia,
        COUNT(*) AS livros_concluidos_ku,
        SUM(NULLIF(preco_digital_na_leitura, 0)) AS valor_digital_referencia,
        COUNT(NULLIF(preco_digital_na_leitura, 0)) AS qtd_precos_digitais_conhecidos
    FROM fato_leituras
    WHERE origem_acesso = 'Kindle Unlimited'
      AND status_leitura = 'Lido'
      AND data_fim IS NOT NULL
    GROUP BY DATE_FORMAT(data_fim, '%Y-%m')
),
assinaturas_mes AS (
    SELECT
        DATE_FORMAT(mes_referencia, '%Y-%m') AS mes_referencia,
        SUM(valor_mensal) AS custo_assinatura
    FROM fato_assinatura
    WHERE servico = 'Kindle Unlimited'
    GROUP BY DATE_FORMAT(mes_referencia, '%Y-%m')
)
SELECT
    a.mes_referencia,
    ROUND(a.custo_assinatura, 2) AS custo_assinatura,
    COALESCE(l.livros_concluidos_ku, 0) AS livros_concluidos_ku,
    COALESCE(l.qtd_precos_digitais_conhecidos, 0) AS qtd_precos_digitais_conhecidos,
    ROUND(COALESCE(l.valor_digital_referencia, 0), 2) AS valor_digital_referencia_conhecido,
    ROUND(COALESCE(l.valor_digital_referencia, 0) - a.custo_assinatura, 2) AS diferenca_referencia_menos_mensalidade,
    ROUND(l.valor_digital_referencia / NULLIF(a.custo_assinatura, 0), 2) AS razao_referencia_por_mensalidade
FROM assinaturas_mes AS a
LEFT JOIN valor_livros_mes AS l ON l.mes_referencia = a.mes_referencia
ORDER BY a.mes_referencia;

-- 6. LEITURAS COM PAGAMENTO REGISTRADO E VALOR PAGO
SELECT
    origem_acesso,
    formato,
    COUNT(*) AS total_registros,
    SUM(valor_pago > 0) AS leituras_com_pagamento,
    ROUND(SUM(valor_pago), 2) AS total_pago_registrado,
    ROUND(AVG(CASE WHEN valor_pago > 0 THEN valor_pago END), 2) AS pagamento_medio_quando_positivo
FROM fato_leituras
GROUP BY origem_acesso, formato
ORDER BY total_pago_registrado DESC;