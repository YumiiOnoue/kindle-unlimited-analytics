-- =====================
-- Análise Financeira
-- =====================

-- Investimento total em livros por ano
SELECT 
    YEAR(l.data_fim) AS ano,
    SUM(l.valor_pago) AS investimento_compras,
    -- Soma de todas as mensalidades do ano / total de livros do ano
    ROUND(SUM(DISTINCT a.valor_mensal * 1) / COUNT(l.id_leitura), 2) AS custo_medio_anual_por_livro
FROM leituras l
JOIN assinatura a ON YEAR(l.data_fim) = YEAR(a.data_pagamento)
GROUP BY ano;

-- Gastos mensais
SELECT 
    mes,
    custo_assinatura,
    custo_compras_avulsas,
    (custo_assinatura + custo_compras_avulsas) AS total_mes
FROM (
    SELECT 
        DATE_FORMAT(l.data_inicio, '%Y-%m') AS mes,
        -- Pegamos o valor da assinatura do mês (se houver)
        COALESCE(MAX(a.valor_mensal), 0) AS custo_assinatura,
        -- Somamos livros comprados fora da assinatura no mesmo mês
        SUM(l.valor_pago) AS custo_compras_avulsas
    FROM leituras l
    LEFT JOIN assinatura a ON DATE_FORMAT(l.data_inicio, '%Y-%m') = DATE_FORMAT(a.data_pagamento, '%Y-%m')
    GROUP BY mes
) AS resumo_mensal
ORDER BY mes;

-- Investimento por livro no kindle

SELECT 
    DATE_FORMAT(l.data_fim, '%Y-%m') AS mes,
    COUNT(l.id_leitura) AS total_livros_ku,
    a.valor_mensal AS custo_assinatura,
    ROUND(a.valor_mensal / COUNT(l.id_leitura), 2) AS custo_efetivo_por_livro
FROM leituras l
JOIN assinatura a ON DATE_FORMAT(l.data_fim, '%Y-%m') = DATE_FORMAT(a.data_pagamento, '%Y-%m')
GROUP BY mes, a.valor_mensal
ORDER BY mes;


-- Custo médio por página (Geral: Assinatura + Compras Diretas)
SELECT 
    YEAR(l.data_fim) AS ano,
    -- Calculamos o investimento total somando a subquery de assinaturas com a soma de valor_pago
    (SELECT COALESCE(SUM(valor_mensal), 0) 
     FROM assinatura 
     WHERE YEAR(data_pagamento) = YEAR(l.data_fim)) + SUM(l.valor_pago) AS investimento_total_ano,
    
    SUM(lv.numero_paginas) AS total_paginas_lidas_geral,
    
    -- Cálculo do custo por página
    ROUND(
        ((SELECT COALESCE(SUM(valor_mensal), 0) FROM assinatura WHERE YEAR(data_pagamento) = YEAR(l.data_fim)) + SUM(l.valor_pago)) 
        / SUM(lv.numero_paginas), 4
    ) AS custo_por_pagina_geral
FROM leituras l
JOIN livros lv ON l.id_livro = lv.id_livro
WHERE l.data_fim IS NOT NULL
GROUP BY YEAR(l.data_fim);