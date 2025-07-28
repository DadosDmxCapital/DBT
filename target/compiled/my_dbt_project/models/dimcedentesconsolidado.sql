

SELECT
    dc.nome::VARCHAR(8000) AS nome,
    CAST(NULLIF(REGEXP_REPLACE(dc.cpf_cnpj, '[^0-9]', '', 'g'), '') AS BIGINT) AS cpf_cnpj,
    dc.endereco::VARCHAR(8000) AS endereco,
    dc.cep::VARCHAR(8000) AS cep,
    dc.cidade::VARCHAR(8000) AS cidade,
    dc.uf::VARCHAR(2) AS uf,
    dc.email::VARCHAR(8000) AS email,
    dc.telefone::VARCHAR(20) AS telefone,
    dc.gerente::VARCHAR(8000) AS gerente,
    dc.operador::VARCHAR(8000) AS operador,
    dc.captador::VARCHAR(8000) AS captador,
    dc.controlador::VARCHAR(8000) AS controlador,
    CAST(REPLACE(dc.fator_percentual, ',', '.') AS DECIMAL(10, 5)) AS fator_percentual,
    CAST(REPLACE(dc.advalorem_percentual, ',', '.') AS DECIMAL(10, 5)) AS advalorem_percentual,
    TO_DATE(dc.data_cadastro, 'DD-MM-YYYY') AS data_cadastro,
    dc.fonte_captacao::VARCHAR(8000) AS fonte_captacao,
    dc.setor::VARCHAR(8000) AS setor,
    dc.grupo_economico::VARCHAR(8000) AS grupo_economico,
    
    -- Lógica para primeira_operacao
    CASE
        WHEN dc.primeira_operacao IS NULL OR TRIM(dc.primeira_operacao) = '' THEN
            df.primeira_operacao_fidc
        ELSE
            TO_DATE(dc.primeira_operacao, 'DD/MM/YYYY')
    END AS primeira_operacao,
    
    -- Lógica padronizada para limite_global
    CASE 
        WHEN COALESCE(dc.limite_global_clean, 0) = COALESCE(df.limite_global_fidc, 0) THEN
            COALESCE(dc.limite_global_clean, 0)
        ELSE
            COALESCE(dc.limite_global_clean, 0) + COALESCE(df.limite_global_fidc, 0)
    END AS limite_global,
    
    -- Lógica padronizada para limite_boleto_especial
    CASE 
        WHEN COALESCE(dc.limite_boleto_especial_clean, 0) = COALESCE(df.limite_boleto_especial_fidc, 0) THEN
            COALESCE(dc.limite_boleto_especial_clean, 0)
        ELSE
            COALESCE(dc.limite_boleto_especial_clean, 0) + COALESCE(df.limite_boleto_especial_fidc, 0)
    END AS limite_boleto_especial,
    
    -- Lógica padronizada para limite_comissaria
    CASE 
        WHEN COALESCE(dc.limite_comissaria_clean, 0) = COALESCE(df.limite_comissaria_fidc, 0) THEN
            COALESCE(dc.limite_comissaria_clean, 0)
        ELSE
            COALESCE(dc.limite_comissaria_clean, 0) + COALESCE(df.limite_comissaria_fidc, 0)
    END AS limite_comissaria,
    
    -- Lógica padronizada para limite_tranche
    CASE 
        WHEN COALESCE(dc.limite_tranche_clean, 0) = COALESCE(df.limite_tranche_fidc, 0) THEN
            COALESCE(dc.limite_tranche_clean, 0)
        ELSE
            COALESCE(dc.limite_tranche_clean, 0) + COALESCE(df.limite_tranche_fidc, 0)
    END AS limite_tranche,
    
    -- Campos que não precisam de comparação (sem equivalente na tabela FIDC)
    dc.limite_boleto_especial_tranche_clean AS limite_boleto_especial_tranche,
    dc.limite_boleto_garantido_clean AS limite_boleto_garantido,
    dc.limite_operacao_clean_clean AS limite_operacao_clean,
    
    dc.risco_atual::VARCHAR(8000) AS risco_atual,
    dc.saldo_clean AS saldo,
    dc.id_cedente::INT AS id_cedente

FROM (
    -- Subquery para limpar os dados da tabela principal uma única vez
    SELECT *,
        CAST(REPLACE(REPLACE(REGEXP_REPLACE(limite_global, '[^0-9,.]', '', 'g'), '.', ''), ',', '.') AS DECIMAL(15, 2)) AS limite_global_clean,
        CAST(REPLACE(REPLACE(REGEXP_REPLACE(limite_boleto_especial, '[^0-9,.]', '', 'g'), '.', ''), ',', '.') AS DECIMAL(15, 2)) AS limite_boleto_especial_clean,
        CAST(REPLACE(REPLACE(REGEXP_REPLACE(limite_comissaria, '[^0-9,.]', '', 'g'), '.', ''), ',', '.') AS DECIMAL(15, 2)) AS limite_comissaria_clean,
        CAST(REPLACE(REPLACE(REGEXP_REPLACE(limite_tranche, '[^0-9,.]', '', 'g'), '.', ''), ',', '.') AS DECIMAL(15, 2)) AS limite_tranche_clean,
        CAST(REPLACE(REPLACE(REGEXP_REPLACE(limite_boleto_especial_tranche, '[^0-9,.]', '', 'g'), '.', ''), ',', '.') AS DECIMAL(15, 2)) AS limite_boleto_especial_tranche_clean,
        CAST(REPLACE(REPLACE(REGEXP_REPLACE(limite_boleto_garantido, '[^0-9,.]', '', 'g'), '.', ''), ',', '.') AS DECIMAL(15, 2)) AS limite_boleto_garantido_clean,
        CAST(REPLACE(REPLACE(REGEXP_REPLACE(limite_operacao_clean, '[^0-9,.]', '', 'g'), '.', ''), ',', '.') AS DECIMAL(15, 2)) AS limite_operacao_clean_clean,
        CAST(REPLACE(REPLACE(REGEXP_REPLACE(saldo, '[^0-9,.]', '', 'g'), '.', ''), ',', '.') AS DECIMAL(15, 2)) AS saldo_clean
    FROM "operacoes"."public"."d_cedentes"
) dc

LEFT JOIN (
    -- Subquery para limpar os dados da tabela FIDC uma única vez
    SELECT
        CAST(NULLIF(REGEXP_REPLACE(cpf_cnpj, '[^0-9]', '', 'g'), '') AS BIGINT) AS cpf_cnpj,
        CASE
            WHEN primeira_operacao IS NULL OR TRIM(primeira_operacao) = '' THEN NULL
            ELSE TO_DATE(primeira_operacao, 'DD-MM-YYYY')
        END AS primeira_operacao_fidc,
        CAST(REPLACE(REPLACE(REGEXP_REPLACE(limite_global, '[^0-9,.]', '', 'g'), '.', ''), ',', '.') AS DECIMAL(15, 2)) AS limite_global_fidc,
        CAST(REPLACE(REPLACE(REGEXP_REPLACE(limite_boleto_especial, '[^0-9,.]', '', 'g'), '.', ''), ',', '.') AS DECIMAL(15, 2)) AS limite_boleto_especial_fidc,
        CAST(REPLACE(REPLACE(REGEXP_REPLACE(limite_comissaria, '[^0-9,.]', '', 'g'), '.', ''), ',', '.') AS DECIMAL(15, 2)) AS limite_comissaria_fidc,
        CAST(REPLACE(REPLACE(REGEXP_REPLACE(limite_tranche, '[^0-9,.]', '', 'g'), '.', ''), ',', '.') AS DECIMAL(15, 2)) AS limite_tranche_fidc
    FROM "operacoes"."public"."d_cedentes_fidc"
) df ON CAST(NULLIF(REGEXP_REPLACE(dc.cpf_cnpj, '[^0-9]', '', 'g'), '') AS BIGINT) = df.cpf_cnpj