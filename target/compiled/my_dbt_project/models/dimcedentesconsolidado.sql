

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
    CASE
        WHEN dc.primeira_operacao IS NULL OR TRIM(dc.primeira_operacao) = '' THEN
            CASE
                WHEN df.primeira_operacao_fidc IS NULL THEN NULL
                ELSE df.primeira_operacao_fidc
            END
        ELSE
            TO_DATE(dc.primeira_operacao, 'DD/MM/YYYY')
    END AS primeira_operacao,
    CAST(REPLACE(REPLACE(REGEXP_REPLACE(dc.limite_global, '[^0-9,.]', '', 'g'), '.', ''), ',', '.') AS DECIMAL(15, 2)) AS limite_global,
    CAST(REPLACE(REPLACE(REGEXP_REPLACE(dc.limite_boleto_especial, '[^0-9,.]', '', 'g'), '.', ''), ',', '.') AS DECIMAL(15, 2)) AS limite_boleto_especial,
    CAST(REPLACE(REPLACE(REGEXP_REPLACE(dc.limite_comissaria, '[^0-9,.]', '', 'g'), '.', ''), ',', '.') AS DECIMAL(15, 2)) AS limite_comissaria,
    CAST(REPLACE(REPLACE(REGEXP_REPLACE(dc.limite_tranche, '[^0-9,.]', '', 'g'), '.', ''), ',', '.') AS DECIMAL(15, 2)) AS limite_tranche,
    CAST(REPLACE(REPLACE(REGEXP_REPLACE(dc.limite_boleto_especial_tranche, '[^0-9,.]', '', 'g'), '.', ''), ',', '.') AS DECIMAL(15, 2)) AS limite_boleto_especial_tranche,
    CAST(REPLACE(REPLACE(REGEXP_REPLACE(dc.limite_boleto_garantido, '[^0-9,.]', '', 'g'), '.', ''), ',', '.') AS DECIMAL(15, 2)) AS limite_boleto_garantido,
    CAST(REPLACE(REPLACE(REGEXP_REPLACE(dc.limite_operacao_clean, '[^0-9,.]', '', 'g'), '.', ''), ',', '.') AS DECIMAL(15, 2)) AS limite_operacao_clean,
    dc.risco_atual::VARCHAR(8000) AS risco_atual,
    CAST(REPLACE(REPLACE(REGEXP_REPLACE(dc.saldo, '[^0-9,.]', '', 'g'), '.', ''), ',', '.') AS DECIMAL(15, 2)) AS saldo,
    dc.id_cedente::INT AS id_cedente
FROM "operacoes"."public"."d_cedentes" dc
LEFT JOIN (
    SELECT
        CAST(NULLIF(REGEXP_REPLACE(cpf_cnpj, '[^0-9]', '', 'g'), '') AS BIGINT) AS cpf_cnpj,
        CASE
            WHEN primeira_operacao IS NULL OR TRIM(primeira_operacao) = '' THEN NULL
            ELSE TO_DATE(primeira_operacao,'DD-MM-YYYY')
        END AS primeira_operacao_fidc
    FROM "operacoes"."public"."d_cedentes_fidc"
) df ON CAST(NULLIF(REGEXP_REPLACE(dc.cpf_cnpj, '[^0-9]', '', 'g'), '') AS BIGINT) = df.cpf_cnpj