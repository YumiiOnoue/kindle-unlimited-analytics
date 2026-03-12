-- =====================
-- Window Functions
-- =====================

-- Criação de uma view para análise literária no Power BI
CREATE OR REPLACE VIEW vw_analise_literaria_pbi AS
WITH assinatura_mes AS (
    -- Calcula o custo rateado por livro para cada mês de assinatura
    SELECT 
        DATE_FORMAT(ass.data_pagamento, '%Y-%m') AS mes_referencia,
        -- Divide o valor mensal pelo total de livros lidos no KU naquele mês
        ass.valor_mensal / NULLIF(COUNT(l_sub.id_leitura), 0) AS custo_rateado
    FROM assinatura ass
    LEFT JOIN leituras l_sub ON DATE_FORMAT(ass.data_pagamento, '%Y-%m') = DATE_FORMAT(l_sub.data_fim, '%Y-%m')
    GROUP BY ass.data_pagamento, ass.valor_mensal
)
SELECT 
    l.id_leitura,
    lv.titulo AS livro_titulo,
    aut.nome AS autor_nome,
    aut.nacionalidade AS autor_nacionalidade,
    ed.nome AS editora_nome,
    cat.nome_categoria AS categoria,
    l.formato,
    -- No código da sua VIEW, substitua as colunas de data por isso:
    DATE(l.data_inicio) AS data_inicio,
    l.data_fim,
    l.valor_pago AS valor_direto,
    -- Lógica de custo real: se for KU (valor 0 e kindle), usa o rateio da CTE
    CASE 
        WHEN l.formato = 'kindle' AND l.valor_pago = 0 THEN ROUND(am.custo_rateado, 2)
        ELSE l.valor_pago 
    END AS custo_real_estimado,
    -- Métricas de tempo e produtividade
    DATEDIFF(l.data_fim, l.data_inicio) AS dias_leitura,
    lv.numero_paginas,
    CASE 
        WHEN DATEDIFF(l.data_fim, l.data_inicio) > 0 
        THEN ROUND(lv.numero_paginas / DATEDIFF(l.data_fim, l.data_inicio), 2)
        ELSE lv.numero_paginas 
    END AS paginas_por_dia,
    av.nota
FROM leituras l
LEFT JOIN livros lv ON l.id_livro = lv.id_livro
LEFT JOIN autores aut ON lv.id_autor = aut.id_autor
LEFT JOIN editoras ed ON lv.id_editora = ed.id_editora
LEFT JOIN categorias cat ON lv.id_categoria = cat.id_categoria
LEFT JOIN assinatura_mes am ON DATE_FORMAT(l.data_fim, '%Y-%m') = am.mes_referencia
LEFT JOIN avaliacoes av ON l.id_leitura = av.id_leitura;