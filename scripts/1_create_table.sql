-- =====================
-- BANCO DE DADOS
-- =====================
USE book_analytics;

-- ==============================================
-- 1. TABELA DIMENSIONAL: dim_livros
-- ==============================================
CREATE TABLE IF NOT EXISTS dim_livros (
    id_livro INT PRIMARY KEY AUTO_INCREMENT,
    isbn VARCHAR(20) UNIQUE NOT NULL,
    titulo VARCHAR(255) NOT NULL,
    autor VARCHAR(150) NOT NULL,
    editora VARCHAR(100) DEFAULT 'Independente',
    ano_publicacao INT,
    numero_paginas INT DEFAULT 0
);

-- =========================================================
-- 2. TABELA DIMENSIONAL: dim_categoria
-- =========================================================
CREATE TABLE IF NOT EXISTS dim_categoria (
    id_categoria INT PRIMARY KEY AUTO_INCREMENT,
    categoria VARCHAR(100) NOT NULL UNIQUE
);

-- =========================================================
-- 3. TABELA ASSOCIATIVA: livro_categoria
-- =========================================================
CREATE TABLE IF NOT EXISTS livro_categoria (
    id_livro INT NOT NULL,
    id_categoria INT NOT NULL,

    PRIMARY KEY (id_livro, id_categoria),

    CONSTRAINT fk_livro_categoria_livro FOREIGN KEY (id_livro) REFERENCES dim_livros(id_livro),
    CONSTRAINT fk_livro_categoria_categoria FOREIGN KEY (id_categoria) REFERENCES dim_categoria(id_categoria)
);

-- =========================================================
-- 4. TABELA FATO: fato_assinatura
-- =========================================================
CREATE TABLE IF NOT EXISTS fato_assinatura (
    id_assinatura INT PRIMARY KEY AUTO_INCREMENT,
    servico VARCHAR(50) NOT NULL DEFAULT 'Kindle Unlimited',
    valor_mensal DECIMAL(10, 2) NOT NULL,
    mes_referencia DATE NOT NULL,
    CONSTRAINT uq_servico_data UNIQUE (servico, mes_referencia)
);

-- =========================================================
-- 5. TABELA FATO: fato_leituras
-- =========================================================
-- Registra o evento de leitura, formato, custos e avaliação final
CREATE TABLE IF NOT EXISTS fato_leituras (
    id_leitura INT PRIMARY KEY AUTO_INCREMENT,
    id_livro INT NOT NULL,
    data_inicio DATE NOT NULL,
    data_fim DATE NULL,
    formato ENUM('Digital', 'Físico') NOT NULL DEFAULT 'Digital',
    origem_acesso ENUM('Kindle Unlimited', 'Compra', 'Emprestimo', 'Presente', 'Cortesia') NOT NULL DEFAULT 'Kindle Unlimited',
    valor_pago DECIMAL(10, 2) NOT NULL DEFAULT 0.00,
    preco_digital_na_leitura DECIMAL(10, 2),
    preco_fisico_na_leitura DECIMAL(10, 2),
    motivacao_leitura ENUM('Sim', 'Não') NOT NULL DEFAULT 'Sim',
    nota DECIMAL(2, 1) NOT NULL,
    opiniao_texto TEXT,
    status_leitura ENUM('Lido', 'Lendo', 'Abandonado') NOT NULL DEFAULT 'Lido',
   
    -- Restrições de integridade
    CONSTRAINT fk_fato_livros FOREIGN KEY (id_livro) REFERENCES dim_livros(id_livro),
    CONSTRAINT chk_nota CHECK (nota >= 1.0 AND nota <= 5.0),
    CONSTRAINT chk_datas CHECK (data_fim >= data_inicio OR data_fim IS NULL),
    CONSTRAINT chk_valor_pago CHECK (valor_pago >= 0.00),
    CONSTRAINT chk_preco_digital CHECK (preco_digital_na_leitura >= 0.00 OR preco_digital_na_leitura IS NULL),
    CONSTRAINT chk_preco_fisico CHECK (preco_fisico_na_leitura >= 0.00 OR preco_fisico_na_leitura IS NULL),
    CONSTRAINT chk_status_data_fim CHECK ((status_leitura = 'Lendo' AND data_fim IS NULL) OR (status_leitura IN ('Lido', 'Abandonado') AND data_fim IS NOT NULL))
);

-- =========================================================
-- 6. ÍNDICES
-- =========================================================
-- Índices para otimizar os JOINs e agregações nas análises
CREATE INDEX idx_leituras_data_fim ON fato_leituras(data_fim);
CREATE INDEX idx_assinatura_data ON fato_assinatura(mes_referencia);
