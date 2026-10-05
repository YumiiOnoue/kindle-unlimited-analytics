-- =====================
-- Window Functions
-- =====================

-- =========================================================
-- VIEW: ANÁLISE LITERÁRIA CONSOLIDADA PARA O POWER BI
-- =========================================================

CREATE OR REPLACE VIEW vw_analise_literaria_pbi AS
WITH assinatura_mes AS (
    -- Calcula o custo rateado por livro para cada mês de assinatura
    SELECT 
        DATE_FORMAT(ass.data_pagamento, '%Y-%m') AS mes_referencia,
        -- Divide o valor da mensalidade pelo total de livros lidos via Kindle Unlimited naquele mês
        ass.valor_mensal / NULLIF(COUNT(fl_sub.id_leitura), 0) AS custo_rateado
    FROM fato_assinatura ass
    LEFT JOIN fato_leituras fl_sub 
        ON DATE_FORMAT(ass.data_pagamento, '%Y-%m') = DATE_FORMAT(fl_sub.data_fim, '%Y-%m')
        AND fl_sub.formato = 'kindle' 
        AND fl_sub.valor_pago = 0.00
    WHERE ass.servico = 'Kindle Unlimited'
    GROUP BY ass.data_pagamento, ass.valor_mensal
)
SELECT 
    fl.id_leitura,
    fl.id_livro,
    dl.titulo AS livro_titulo,
    dl.autor AS autor_nome,
    dl.editora AS editora_nome,
    dl.categorias AS categoria,
    dl.ano_publicacao,
    fl.formato,
    DATE(fl.data_inicio) AS data_inicio,
    DATE(fl.data_fim) AS data_fim,
    fl.valor_pago AS valor_direto,
    fl.preco_livro_avulso,
    -- Lógica de custo real: se for KU (valor 0 e kindle), usa o rateio da CTE
    CASE 
        WHEN fl.formato = 'kindle' AND fl.valor_pago = 0.00 THEN ROUND(COALESCE(am.custo_rateado, 0.00), 2)
        ELSE fl.valor_pago 
    END AS custo_real_estimado,
    -- Métricas de tempo e produtividade (+1 para leituras iniciadas e finalizadas no mesmo dia)
    (DATEDIFF(fl.data_fim, fl.data_inicio) + 1) AS dias_leitura,
    dl.numero_paginas,
    ROUND(dl.numero_paginas / NULLIF((DATEDIFF(fl.data_fim, fl.data_inicio) + 1), 0), 2) AS paginas_por_dia,
    fl.nota,
    fl.opiniao_texto
FROM fato_leituras fl
INNER JOIN dim_livros dl ON fl.id_livro = dl.id_livro
LEFT JOIN assinatura_mes am ON DATE_FORMAT(fl.data_fim, '%Y-%m') = am.mes_referencia;