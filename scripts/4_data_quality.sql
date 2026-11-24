-- =========================================================
-- VERIFICAÇÃO DA QUALIDADE DOS DADOS
-- =========================================================
-- Objetivo:
-- Executar consultas de validação para avaliar a consistência, integridade e qualidade dos dados
-- armazenados no banco book_analytics.
--
-- As verificações contemplam:
-- - Volume e distribuição dos registros;
-- - Campos obrigatórios e valores ausentes;
-- - Duplicidade de livros, leituras e categorias;
-- - Integridade dos relacionamentos entre tabelas;
-- - Consistência das datas e dos status de leitura;
-- - Validação de preços e valores financeiros;
-- - Consistência das origens de acesso e formatos;
-- - Integridade dos registros de assinatura;
-- - Identificação de lacunas nos meses de referência.
--
-- IMPORTANTE:
-- Este script contém consultas de verificação (SELECT) e não altera os dados ou a estrutura do banco.
--
-- Execução recomendada:
--   1. Executar 1_create_table.sql
--   2. Executar 2_inserts.sql
--   3. Executar 3_updates.sql

-- =======================================================================================

-- =====================
-- BANCO DE DADOS
-- =====================
USE book_analytics;

-- =======================================================================================
-- 1. VISÃO GERAL DAS TABELAS: Verifica o volume de registros carregados
-- =======================================================================================
SELECT
    'dim_livros' AS tabela,
    COUNT(*) AS total_registros
FROM dim_livros

UNION ALL

SELECT
    'dim_categoria',
    COUNT(*)
FROM dim_categoria

UNION ALL

SELECT
    'livro_categoria',
    COUNT(*)
FROM livro_categoria

UNION ALL

SELECT
    'fato_leituras',
    COUNT(*)
FROM fato_leituras

UNION ALL

SELECT
    'fato_assinatura',
    COUNT(*)
FROM fato_assinatura;


-- =======================================================================================
-- 2. LIVROS: Verifica campos obrigatórios vazios
-- =======================================================================================
SELECT
    id_livro,
    id_externo,
    titulo,
    autor
FROM dim_livros
WHERE
    id_externo IS NULL
    OR TRIM(id_externo) = ''
    OR titulo IS NULL
    OR TRIM(titulo) = ''
    OR autor IS NULL
    OR TRIM(autor) = '';


-- =======================================================================================
-- 3. LIVROS: Encontra id_externo duplicado
-- =======================================================================================
SELECT
    id_externo,
    COUNT(*) AS quantidade
FROM dim_livros
GROUP BY id_externo
HAVING COUNT(*) > 1;


-- =======================================================================================
-- 4. LIVROS: Identifica títulos duplicados
-- =======================================================================================
SELECT
    titulo,
    COUNT(*) AS quantidade,
    GROUP_CONCAT(id_livro ORDER BY id_livro) AS ids_livros
FROM dim_livros
GROUP BY titulo
HAVING COUNT(*) > 1;


-- =======================================================================================
-- 5. LIVROS: identifica valores suspeitos
-- =======================================================================================
SELECT
    id_livro,
    titulo,
    ano_publicacao,
    numero_paginas
FROM dim_livros
WHERE
    (ano_publicacao IS NOT NULL
        AND (ano_publicacao < 0 OR ano_publicacao > YEAR(CURDATE())))
    OR numero_paginas < 0;


-- =======================================================================================
-- 6. CATEGORIAS: Verifica nomes duplicados ou vazios
-- =======================================================================================
SELECT
    categoria,
    COUNT(*) AS quantidade
FROM dim_categoria
GROUP BY categoria
HAVING COUNT(*) > 1;

SELECT
    id_categoria,
    categoria
FROM dim_categoria
WHERE categoria IS NULL
   OR TRIM(categoria) = '';


-- =======================================================================================
-- 7. RELACIONAMENTOS: verifica livros sem categoria
-- =======================================================================================
SELECT
    l.id_livro,
    l.titulo
FROM dim_livros AS l
LEFT JOIN livro_categoria AS lc
    ON l.id_livro = lc.id_livro
WHERE lc.id_livro IS NULL
ORDER BY l.titulo;


-- =======================================================================================
-- 8. RELACIONAMENTOS: verifica categorias sem livros
-- =======================================================================================
SELECT
    c.id_categoria,
    c.categoria
FROM dim_categoria AS c
LEFT JOIN livro_categoria AS lc
    ON c.id_categoria = lc.id_categoria
WHERE lc.id_categoria IS NULL
ORDER BY c.categoria;


-- =======================================================================================
-- 9. RELACIONAMENTOS: Verifica se o mesmo livro foi associado à mesma categoria mais de uma vez
-- =======================================================================================
SELECT
    id_livro,
    id_categoria,
    COUNT(*) AS quantidade
FROM livro_categoria
GROUP BY id_livro, id_categoria
HAVING COUNT(*) > 1;


-- =======================================================================================
-- 10. LEITURAS: Identifica datas finais anteriores às iniciais, datas futuras e registros com status incompatível com datas
-- =======================================================================================
SELECT
    id_leitura,
    id_livro,
    data_inicio,
    data_fim,
    status_leitura
FROM fato_leituras
WHERE
    (data_fim IS NOT NULL AND data_fim < data_inicio)
    OR data_inicio > CURDATE()
    OR data_fim > CURDATE()
    OR (
        status_leitura = 'Lendo'
        AND data_fim IS NOT NULL
    )
    OR (
        status_leitura = 'Lido'
        AND data_fim IS NULL
    );


-- =======================================================================================
-- 11. LEITURAS: Verifica valores negativos em custos e preços
-- =======================================================================================
SELECT
    id_livro,
    preco_digital,
    preco_fisico
FROM dim_livros
WHERE preco_digital < 0
    OR preco_fisico < 0;


-- =======================================================================================
-- 12. LEITURAS: Verifica preços não informados
-- =======================================================================================
SELECT
    COUNT(*) AS total_livros,
    SUM(preco_digital IS NULL)
        AS sem_preco_digital,
    SUM(preco_fisico IS NULL)
        AS sem_preco_fisico
FROM dim_livros;


-- =======================================================================================
-- 13. LEITURAS: Localiza registros com os mesmos atributos relevantes, desconsiderando o identificador id_leitura
-- =======================================================================================
SELECT
    id_livro,
    data_inicio,
    data_fim,
    formato,
    origem_acesso,
    COUNT(*) AS quantidade
FROM fato_leituras
GROUP BY
    id_livro,
    data_inicio,
    data_fim,
    formato,
    origem_acesso
HAVING COUNT(*) > 1;


-- =======================================================================================
-- 14. LEITURAS: Verifica se os status registrados fazem sentido para o histórico
-- =======================================================================================
SELECT
    status_leitura,
    COUNT(*) AS quantidade
FROM fato_leituras
GROUP BY status_leitura
ORDER BY quantidade DESC;


-- =======================================================================================
-- 15. LEITURAS: Confere a distribuição entre assinatura, compra e empréstimo, cruzando com o formato
-- =======================================================================================
SELECT
    origem_acesso,
    formato,
    COUNT(*) AS quantidade
FROM fato_leituras
GROUP BY origem_acesso, formato
ORDER BY origem_acesso, formato;


-- =======================================================================================
-- 16. ASSINATURAS: Localiza mensalidades negativas ou nulas.
-- =======================================================================================
SELECT
    id_assinatura,
    servico,
    valor_mensal,
    mes_referencia
FROM fato_assinatura
WHERE
    valor_mensal IS NULL
    OR valor_mensal < 0
    OR servico IS NULL
    OR TRIM(servico) = ''
    OR mes_referencia IS NULL;


-- =======================================================================================
-- 17. ASSINATURAS: verifica as duplicidades mensais de registros por serviço e mês
-- =======================================================================================
SELECT
    servico,
    YEAR(mes_referencia) AS ano,
    MONTH(mes_referencia) AS mes,
    COUNT(*) AS quantidade,
    SUM(valor_mensal) AS valor_total_registrado
FROM fato_assinatura
GROUP BY
    servico,
    YEAR(mes_referencia),
    MONTH(mes_referencia)
HAVING COUNT(*) > 1
ORDER BY ano, mes, servico;


-- =======================================================================================
-- 18. ASSINATURAS: Verifica lacunas entre o primeiro e o último mês registrados para cada serviço
-- =======================================================================================
WITH RECURSIVE
periodos AS (
    SELECT
        servico,
        CAST(
            DATE_FORMAT(MIN(mes_referencia), '%Y-%m-01')
            AS DATE
        ) AS primeiro_mes,
        CAST(
            DATE_FORMAT(MAX(mes_referencia), '%Y-%m-01')
            AS DATE
        ) AS ultimo_mes
    FROM fato_assinatura
    GROUP BY servico
),
calendario AS (
    SELECT
        servico,
        primeiro_mes AS mes
    FROM periodos

    UNION ALL

    SELECT
        c.servico,
        DATE_ADD(c.mes, INTERVAL 1 MONTH)
    FROM calendario AS c
    JOIN periodos AS p
        ON c.servico = p.servico
    WHERE c.mes < p.ultimo_mes
)
SELECT
    c.servico,
    c.mes AS mes_ausente
FROM calendario AS c
LEFT JOIN fato_assinatura AS a
    ON a.servico = c.servico
   AND YEAR(a.mes_referencia) = YEAR(c.mes)
   AND MONTH(a.mes_referencia) = MONTH(c.mes)
WHERE a.id_assinatura IS NULL
ORDER BY c.servico, c.mes;


-- =======================================================================================
-- 19. RESUMO DAS ASSINATURAS: Confere a evolução dos valores registrados
-- =======================================================================================
SELECT
    servico,
    DATE_FORMAT(mes_referencia, '%Y-%m') AS mes,
    COUNT(*) AS quantidade_registros,
    MIN(valor_mensal) AS menor_valor,
    MAX(valor_mensal) AS maior_valor
FROM fato_assinatura
GROUP BY
    servico,
    DATE_FORMAT(mes_referencia, '%Y-%m')
ORDER BY servico, mes;