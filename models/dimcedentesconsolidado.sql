{{ config(materialized='view') }}

WITH cedentes_com_tipagem AS (
    SELECT
        nome::VARCHAR(8000) AS nome,
        CAST(NULLIF(REGEXP_REPLACE(cpf_cnpj, '[^0-9]', '', 'g'), '') AS BIGINT) AS cpf_cnpj,
        endereco::VARCHAR(8000) AS endereco,
        cep::VARCHAR(8000) AS cep,
        cidade::VARCHAR(8000) AS cidade,
        uf::VARCHAR(2) AS uf,
        email::VARCHAR(8000) AS email,
        telefone::VARCHAR(20) AS telefone,
        gerente::VARCHAR(8000) AS gerente,
        operador::VARCHAR(8000) AS operador,
        captador::VARCHAR(8000) AS captador,
        controlador::VARCHAR(8000) AS controlador,
        CAST(REPLACE(fator_percentual, ',', '.') AS DECIMAL(10, 5)) AS fator_percentual,
        CAST(REPLACE(advalorem_percentual, ',', '.') AS DECIMAL(10, 5)) AS advalorem_percentual,
        TO_DATE(data_cadastro, 'DD-MM-YYYY') AS data_cadastro,
        fonte_captacao::VARCHAR(8000) AS fonte_captacao,
        setor::VARCHAR(8000) AS setor,
        grupo_economico::VARCHAR(8000) AS grupo_economico,
        TO_DATE(primeira_operacao, 'DD/MM/YYYY') AS primeira_operacao_d_cedentes,
        CAST(REPLACE(REPLACE(REGEXP_REPLACE(limite_global, '[^0-9,.]', '', 'g'), '.', ''), ',', '.') AS DECIMAL(15, 2)) AS limite_global,
        CAST(REPLACE(REPLACE(REGEXP_REPLACE(limite_boleto_especial, '[^0-9,.]', '', 'g'), '.', ''), ',', '.') AS DECIMAL(15, 2)) AS limite_boleto_especial,
        CAST(REPLACE(REPLACE(REGEXP_REPLACE(limite_comissaria, '[^0-9,.]', '', 'g'), '.', ''), ',', '.') AS DECIMAL(15, 2)) AS limite_comissaria,
        CAST(REPLACE(REPLACE(REGEXP_REPLACE(limite_tranche, '[^0-9,.]', '', 'g'), '.', ''), ',', '.') AS DECIMAL(15, 2)) AS limite_tranche,
        CAST(REPLACE(REPLACE(REGEXP_REPLACE(limite_boleto_especial_tranche, '[^0-9,.]', '', 'g'), '.', ''), ',', '.') AS DECIMAL(15, 2)) AS limite_boleto_especial_tranche,
        CAST(REPLACE(REPLACE(REGEXP_REPLACE(limite_boleto_garantido, '[^0-9,.]', '', 'g'), '.', ''), ',', '.') AS DECIMAL(15, 2)) AS limite_boleto_garantido,
        CAST(REPLACE(REPLACE(REGEXP_REPLACE(limite_operacao_clean, '[^0-9,.]', '', 'g'), '.', ''), ',', '.') AS DECIMAL(15, 2)) AS limite_operacao_clean,
        risco_atual::VARCHAR(8000) AS risco_atual,
        CAST(REPLACE(REPLACE(REGEXP_REPLACE(saldo, '[^0-9,.]', '', 'g'), '.', ''), ',', '.') AS DECIMAL(15, 2)) AS saldo,
        TO_DATE(vencimento_contrato, 'DD-MM-YYYY') AS vencimento_contrato,
        id_cedente::INT AS id_cedente
    FROM {{ source('public', 'd_cedentes') }}
),

cedentes_fidc_com_tipagem AS (
    SELECT
        nome::VARCHAR(8000) AS nome,
        CAST(NULLIF(REGEXP_REPLACE(cpf_cnpj, '[^0-9]', '', 'g'), '') AS BIGINT) AS cpf_cnpj,
        TO_DATE(primeira_operacao,'DD-MM-YYYY') AS primeira_operacao_fidc
    FROM {{ source('public', 'd_cedentes_fidc') }}
)

SELECT
    cc.nome,
    cc.cpf_cnpj,
    cc.endereco,
    cc.cep,
    cc.cidade,
    cc.uf,
    cc.email,
    cc.telefone,
    cc.gerente,
    cc.operador,
    cc.captador,
    cc.controlador,
    cc.fator_percentual,
    cc.advalorem_percentual,
    cc.data_cadastro,
    cc.fonte_captacao,
    cc.setor,
    cc.grupo_economico,
    COALESCE(cc.primeira_operacao_d_cedentes, cf.primeira_operacao_fidc) AS primeira_operacao,
    cc.limite_global,
    cc.limite_boleto_especial,
    cc.limite_comissaria,
    cc.limite_tranche,
    cc.limite_boleto_especial_tranche,
    cc.limite_boleto_garantido,
    cc.limite_operacao_clean,
    cc.risco_atual,
    cc.saldo,
    cc.vencimento_contrato,
    cc.id_cedente
FROM cedentes_com_tipagem cc
LEFT JOIN cedentes_fidc_com_tipagem cf ON cc.cpf_cnpj = cf.cpf_cnpj