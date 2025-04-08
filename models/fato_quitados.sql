SELECT
    numero::VARCHAR(8000) AS numero,
    m::VARCHAR(8000) AS m,
    classe_risco::VARCHAR(8000) AS classe_risco,
    tipo::VARCHAR(8000) AS tipo,
    CAST(NULLIF(REGEXP_REPLACE(cpf_cnpj_sacado, '[^0-9]', '', 'g'), '') AS BIGINT) AS cpf_cnpj_sacado,
    sacado::VARCHAR(8000) AS sacado,
    CAST(NULLIF(REGEXP_REPLACE(cpf_cnpj_cedente, '[^0-9]', '', 'g'), '') AS BIGINT) AS cpf_cnpj_cedente,
    cedente::VARCHAR(8000) AS cedente,
    nosso_numero::VARCHAR(8000) AS nosso_numero,
    TO_DATE(original, 'DD/MM/YYYY') AS original, --conversao para data correta
    TO_DATE(vencimento, 'DD/MM/YYYY') AS vencimento, --conversao para data correta
    TO_DATE(quitacao, 'DD/MM/YYYY') AS quitacao, --conversao para data correta,
    status::VARCHAR(8000) AS status,
    TO_DATE(emissao, 'DD/MM/YYYY') AS emissao,
    CAST(
    REPLACE(REGEXP_REPLACE(valor_face_, '[^0-9,]', '', 'g'), ',', '.') 
    AS DECIMAL(10,2)
) AS valor_face_,
CAST(
    REPLACE(REGEXP_REPLACE(valor_juros, '[^0-9,]', '', 'g'), ',', '.') 
    AS DECIMAL(10,2)
) AS valor_juros,
CAST(
    REPLACE(REGEXP_REPLACE(valor_multa, '[^0-9,]', '', 'g'), ',', '.') 
    AS DECIMAL(10,2)
) AS valor_multa,
CAST(
    REPLACE(REGEXP_REPLACE(valor_tarifas, '[^0-9,]', '', 'g'), ',', '.') 
    AS DECIMAL(10,2)
) AS valor_tarifas,
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
    tipo_quitacao::VARCHAR(8000) AS tipo_quitacao,
    op_de_pagamento::VARCHAR(8000) AS op_de_pagamento,
    observacao::VARCHAR(8000) AS observacao,
    conta::VARCHAR(8000) AS conta,
    CAST(REPLACE(valor_tar_dev_cheque, ',', '.') AS DECIMAL(10, 2)) AS valor_tar_dev_cheque,
    CAST(REPLACE(valor_tar_recompra, ',', '.') AS DECIMAL(10, 2)) AS valor_tar_recompra,
    categoria::VARCHAR(8000) AS categoria,
    banco_cobrador::VARCHAR(8000) AS banco_cobrador,
    agencia_cobradora::VARCHAR(8000) AS agencia_cobradora,
    motivo_devolucao::VARCHAR(8000) AS motivo_devolucao
FROM {{ source('public', 'f_titulosquitados') }}


UNION ALL


SELECT
    numero::VARCHAR(8000) AS numero,
    m::VARCHAR(8000) AS m,
    classe_risco::VARCHAR(8000) AS classe_risco,
    tipo::VARCHAR(8000) AS tipo,
    CAST(NULLIF(REGEXP_REPLACE(cpf_cnpj_sacado, '[^0-9]', '', 'g'), '') AS BIGINT) AS cpf_cnpj_sacado,
    sacado::VARCHAR(8000) AS sacado,
    CAST(NULLIF(REGEXP_REPLACE(cpf_cnpj_cedente, '[^0-9]', '', 'g'), '') AS BIGINT) AS cpf_cnpj_cedente,
    cedente::VARCHAR(8000) AS cedente,
    nosso_numero::VARCHAR(8000) AS nosso_numero,
    TO_DATE(original, 'DD/MM/YYYY') AS original, --conversao para data correta
    TO_DATE(vencimento, 'DD/MM/YYYY') AS vencimento, --conversao para data correta
    TO_DATE(quitacao, 'DD/MM/YYYY') AS quitacao, --conversao para data correta,
    status::VARCHAR(8000) AS status,
    TO_DATE(emissao, 'DD/MM/YYYY') AS emissao,
    CAST(
    REPLACE(REGEXP_REPLACE(valor_face_, '[^0-9,]', '', 'g'), ',', '.') 
    AS DECIMAL(10,2)
) AS valor_face_,
CAST(
    REPLACE(REGEXP_REPLACE(valor_juros, '[^0-9,]', '', 'g'), ',', '.') 
    AS DECIMAL(10,2)
) AS valor_juros,
CAST(
    REPLACE(REGEXP_REPLACE(valor_multa, '[^0-9,]', '', 'g'), ',', '.') 
    AS DECIMAL(10,2)
) AS valor_multa,
CAST(
    REPLACE(REGEXP_REPLACE(valor_tarifas, '[^0-9,]', '', 'g'), ',', '.') 
    AS DECIMAL(10,2)
) AS valor_tarifas,
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
    tipo_quitacao::VARCHAR(8000) AS tipo_quitacao,
    op_de_pagamento::VARCHAR(8000) AS op_de_pagamento,
    observacao::VARCHAR(8000) AS observacao,
    conta::VARCHAR(8000) AS conta,
    CAST(REPLACE(valor_tar_dev_cheque, ',', '.') AS DECIMAL(10, 2)) AS valor_tar_dev_cheque,
    CAST(REPLACE(valor_tar_recompra, ',', '.') AS DECIMAL(10, 2)) AS valor_tar_recompra,
    categoria::VARCHAR(8000) AS categoria,
    banco_cobrador::VARCHAR(8000) AS banco_cobrador,
    agencia_cobradora::VARCHAR(8000) AS agencia_cobradora,
    motivo_devolucao::VARCHAR(8000) AS motivo_devolucao
FROM {{ source('public', 'f_titulosquitados_fidc') }}