SELECT
    'Sec' AS Empresa, -- Adicionando a coluna Empresa com o valor 'Sec'
    numero::VARCHAR(8000) AS numero,
    m::VARCHAR(8000) AS m,
    tipo::VARCHAR(8000) AS tipo,
    CAST(NULLIF(REGEXP_REPLACE(cpf_cnpj_sacado, '[^0-9]', '', 'g'), '') AS BIGINT) AS cpf_cnpj_sacado,
    sacado::VARCHAR(8000) AS sacado,
    CAST(NULLIF(REGEXP_REPLACE(cpf_cnpj_cedente, '[^0-9]', '', 'g'), '') AS BIGINT) AS cpf_cnpj_cedente,
    cedente::VARCHAR(8000) AS cedente,
    TO_DATE(vencimento, 'DD/MM/YYYY') AS vencimento,
    TO_DATE(emissao, 'DD/MM/YYYY') AS emissao,
    conta::VARCHAR(8000) AS conta,
    CAST(
        REPLACE(REGEXP_REPLACE(valor_face, '[^0-9,]', '', 'g'), ',', '.')
        AS DECIMAL(10,2)
    ) AS valor_face,
    TO_DATE(vencimento_anterior, 'DD/MM/YYYY') AS vencimento_anterior,
    CAST(
        REPLACE(REGEXP_REPLACE(valor_face_anterior, '[^0-9,]', '', 'g'), ',', '.')
        AS DECIMAL(10,2)
    ) AS valor_face_anterior,
    CAST(
        REPLACE(REGEXP_REPLACE(tarifas, '[^0-9,]', '', 'g'), ',', '.')
        AS DECIMAL(10,2)
    ) AS tarifas,
    CAST(
        REPLACE(REGEXP_REPLACE(juros, '[^0-9,]', '', 'g'), ',', '.')
        AS DECIMAL(10,2)
    ) AS juros,
    CAST(
        REPLACE(REGEXP_REPLACE(multa, '[^0-9,]', '', 'g'), ',', '.')
        AS DECIMAL(10,2)
    ) AS multa,
    CAST(
        REPLACE(REGEXP_REPLACE(iof, '[^0-9,]', '', 'g'), ',', '.')
        AS DECIMAL(10,2)
    ) AS iof,
    timestamp_extracao
FROM "operacoes"."public"."f_titulosprorrogados"

UNION ALL

SELECT
    'fidc' AS Empresa, -- Adicionando a coluna Empresa com o valor 'fidc'
    numero::VARCHAR(8000) AS numero,
    m::VARCHAR(8000) AS m,
    tipo::VARCHAR(8000) AS tipo,
    CAST(NULLIF(REGEXP_REPLACE(cpf_cnpj_sacado, '[^0-9]', '', 'g'), '') AS BIGINT) AS cpf_cnpj_sacado,
    sacado::VARCHAR(8000) AS sacado,
    CAST(NULLIF(REGEXP_REPLACE(cpf_cnpj_cedente, '[^0-9]', '', 'g'), '') AS BIGINT) AS cpf_cnpj_cedente,
    cedente::VARCHAR(8000) AS cedente,
    TO_DATE(vencimento, 'DD/MM/YYYY') AS vencimento,
    TO_DATE(emissao, 'DD/MM/YYYY') AS emissao,
    conta::VARCHAR(8000) AS conta,
    CAST(
        REPLACE(REGEXP_REPLACE(valor_face, '[^0-9,]', '', 'g'), ',', '.')
        AS DECIMAL(10,2)
    ) AS valor_face,
    TO_DATE(vencimento_anterior, 'DD/MM/YYYY') AS vencimento_anterior,
    CAST(
        REPLACE(REGEXP_REPLACE(valor_face_anterior, '[^0-9,]', '', 'g'), ',', '.')
        AS DECIMAL(10,2)
    ) AS valor_face_anterior,
    CAST(
        REPLACE(REGEXP_REPLACE(tarifas, '[^0-9,]', '', 'g'), ',', '.')
        AS DECIMAL(10,2)
    ) AS tarifas,
    CAST(
        REPLACE(REGEXP_REPLACE(juros, '[^0-9,]', '', 'g'), ',', '.')
        AS DECIMAL(10,2)
    ) AS juros,
    CAST(
        REPLACE(REGEXP_REPLACE(multa, '[^0-9,]', '', 'g'), ',', '.')
        AS DECIMAL(10,2)
    ) AS multa,
    CAST(
        REPLACE(REGEXP_REPLACE(iof, '[^0-9,]', '', 'g'), ',', '.')
        AS DECIMAL(10,2)
    ) AS iof,
    timestamp_extracao
FROM "operacoes"."public"."f_titulosprorrogados_fidc"