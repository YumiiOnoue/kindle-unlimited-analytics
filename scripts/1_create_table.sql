-- =====================
-- TABELAS DIMENSIONAIS
-- =====================

USE book_analytics;

CREATE TABLE IF NOT EXISTS dim_livros (
    id_livro INT PRIMARY KEY AUTO_INCREMENT,
    isbn VARCHAR(20) UNIQUE NOT NULL,
    titulo VARCHAR(255) NOT NULL,
    autor VARCHAR(150) NOT NULL,
    editora VARCHAR(100) DEFAULT 'Independente',
    categorias VARCHAR(255) DEFAULT 'Geral', -- Ex: "Ficção, Romance, Mistério" para divisão no Power Query
    ano_publicacao INT,
    numero_paginas INT DEFAULT 0,
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- =========================================================
-- 3. TABELA FATO: fato_assinatura
-- =========================================================
-- Registra o custo fixo mensal do Kindle Unlimited (uma linha por mês)
CREATE TABLE IF NOT EXISTS fato_assinatura (
    id_assinatura INT PRIMARY KEY AUTO_INCREMENT,
    servico VARCHAR(50) NOT NULL DEFAULT 'Kindle Unlimited',
    valor_mensal DECIMAL(10, 2) NOT NULL,
    data_pagamento DATE NOT NULL,
    CONSTRAINT uq_servico_data UNIQUE (servico, data_pagamento)
);

-- =========================================================
-- 4. TABELA FATO: fato_leituras
-- =========================================================
-- Registra o evento de leitura, formato, custos e avaliação final
CREATE TABLE IF NOT EXISTS fato_leituras (
    id_leitura INT PRIMARY KEY AUTO_INCREMENT,
    id_livro INT NOT NULL,
    data_inicio DATE NOT NULL,
    data_fim DATE NOT NULL,
    formato ENUM('kindle', 'físico') NOT NULL DEFAULT 'kindle',
    preco_livro_avulso DECIMAL(10, 2) DEFAULT 0.00, -- Quanto custaria na loja se comprado avulso
    valor_pago DECIMAL(10, 2) DEFAULT 0.00,         -- Valor efetivamente desembolsado na compra (se avulso)
    nota DECIMAL(2, 1) NOT NULL,
    opiniao_texto TEXT,
    
    -- Restrições de integridade
    CONSTRAINT fk_fato_livros FOREIGN KEY (id_livro) REFERENCES dim_livros(id_livro),
    CONSTRAINT chk_nota CHECK (nota >= 1.0 AND nota <= 5.0),
    CONSTRAINT chk_datas CHECK (data_fim >= data_inicio)
);

-- Índices para otimizar os JOINs e agregações nas análises
CREATE INDEX idx_leituras_data_fim ON fato_leituras(data_fim);
CREATE INDEX idx_assinatura_data ON fato_assinatura(data_pagamento);
