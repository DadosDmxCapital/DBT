

SELECT
    'Sec' AS Empresa, -- Adicionando a coluna Empresa com o valor 'Sec'
    numero::VARCHAR(8000) AS numero,
    m::VARCHAR(8000) AS m,
    classe_risco::VARCHAR(8000) AS classe_risco,
    tipo::VARCHAR(8000) AS tipo,
    CAST(NULLIF(REGEXP_REPLACE(cpf_cnpj_sacado, '[^0-9]', '', 'g'), '') AS BIGINT) AS cpf_cnpj_sacado,
    sacado::VARCHAR(8000) AS sacado,
    CAST(NULLIF(REGEXP_REPLACE(cpf_cnpj_cedente, '[^0-9]', '', 'g'), '') AS BIGINT) AS cpf_cnpj_cedente,
    cedente::VARCHAR(8000) AS cedente,
    nosso_numero::VARCHAR(8000) AS nosso_numero,
    TO_DATE(vencimento, 'DD/MM/YYYY') AS vencimento,
    TO_DATE(recompra, 'DD/MM/YYYY') AS recompra,
    TO_DATE(emissao, 'DD/MM/YYYY') AS emissao,
    CAST(
        REPLACE(REGEXP_REPLACE(valor_face, '[^0-9,]', '', 'g'), ',', '.')
        AS DECIMAL(10,2)
    ) AS valor_face,
    CAST(
        REPLACE(REGEXP_REPLACE(valor_juros, '[^0-9,]', '', 'g'), ',', '.')
        AS DECIMAL(10,2)
    ) AS valor_juros,
    CAST(
        REPLACE(REGEXP_REPLACE(valor_multa, '[^0-9,]', '', 'g'), ',', '.')
        AS DECIMAL(10,2)
    ) AS valor_multa,
    CAST(
        REPLACE(REGEXP_REPLACE(valor_desconto, '[^0-9,]', '', 'g'), ',', '.')
        AS DECIMAL(10,2)
    ) AS valor_desconto,
    CAST(
        REPLACE(REGEXP_REPLACE(valor_total, '[^0-9,]', '', 'g'), ',', '.')
        AS DECIMAL(10,2)
    ) AS valor_total,
    CAST(
        REPLACE(REGEXP_REPLACE(valor_liquidado, '[^0-9,]', '', 'g'), ',', '.')
        AS DECIMAL(10,2)
    ) AS valor_liquidado,
    NULLIF(op, '')::INT AS op,
    situacao::VARCHAR(8000) AS situacao,
    op_de_pagamento::VARCHAR(8000) AS op_de_pagamento,
    observacao::VARCHAR(8000) AS observacao,
    conta::VARCHAR(8000) AS conta,
    categoria::VARCHAR(8000) AS categoria,
    motivo::VARCHAR(8000) AS motivo,
    timestamp_extracao
FROM "operacoes"."public"."f_titulosrecomprados"

UNION ALL

SELECT
    'fidc' AS Empresa, -- Adicionando a coluna Empresa com o valor 'fidc'
    numero::VARCHAR(8000) AS numero,
    m::VARCHAR(8000) AS m,
    classe_risco::VARCHAR(8000) AS classe_risco,
    tipo::VARCHAR(8000) AS tipo,
    CAST(NULLIF(REGEXP_REPLACE(cpf_cnpj_sacado, '[^0-9]', '', 'g'), '') AS BIGINT) AS cpf_cnpj_sacado,
    sacado::VARCHAR(8000) AS sacado,
    CAST(NULLIF(REGEXP_REPLACE(cpf_cnpj_cedente, '[^0-9]', '', 'g'), '') AS BIGINT) AS cpf_cnpj_cedente,
    cedente::VARCHAR(8000) AS cedente,
    nosso_numero::VARCHAR(8000) AS nosso_numero,
    TO_DATE(vencimento, 'DD/MM/YYYY') AS vencimento,
    TO_DATE(recompra, 'DD/MM/YYYY') AS recompra,
    TO_DATE(emissao, 'DD/MM/YYYY') AS emissao,
    CAST(
        REPLACE(REGEXP_REPLACE(valor_face, '[^0-9,]', '', 'g'), ',', '.')
        AS DECIMAL(10,2)
    ) AS valor_face,
    CAST(
        REPLACE(REGEXP_REPLACE(valor_juros, '[^0-9,]', '', 'g'), ',', '.')
        AS DECIMAL(10,2)
    ) AS valor_juros,
    CAST(
        REPLACE(REGEXP_REPLACE(valor_multa, '[^0-9,]', '', 'g'), ',', '.')
        AS DECIMAL(10,2)
    ) AS valor_multa,
    CAST(
        REPLACE(REGEXP_REPLACE(valor_desconto, '[^0-9,]', '', 'g'), ',', '.')
        AS DECIMAL(10,2)
    ) AS valor_desconto,
    CAST(
        REPLACE(REGEXP_REPLACE(valor_total, '[^0-9,]', '', 'g'), ',', '.')
        AS DECIMAL(10,2)
    ) AS valor_total,
    CAST(
        REPLACE(REGEXP_REPLACE(valor_liquidado, '[^0-9,]', '', 'g'), ',', '.')
        AS DECIMAL(10,2)
    ) AS valor_liquidado,
    NULLIF(op, '')::INT AS op,
    situacao::VARCHAR(8000) AS situacao,
    op_de_pagamento::VARCHAR(8000) AS op_de_pagamento,
    observacao::VARCHAR(8000) AS observacao,
    conta::VARCHAR(8000) AS conta,
    categoria::VARCHAR(8000) AS categoria,
    motivo::VARCHAR(8000) AS motivo,
    timestamp_extracao
FROM "operacoes"."public"."f_titulosrecomprados_fidc"