SELECT 
    cedente::VARCHAR(8000) AS cedente,
    conf::VARCHAR(8000) AS conf,
    conta::VARCHAR(8000) AS conta,
    CAST(NULLIF(REGEXP_REPLACE(cpf_cnpj_cedente, '[^0-9]', '', 'g'), '') AS BIGINT) AS cpf_cnpj_cedente,
    CAST(NULLIF(REGEXP_REPLACE(cpf_cnpj_sacado, '[^0-9]', '', 'g'), '') AS BIGINT) AS cpf_cnpj_sacado,
    cr::VARCHAR(8000) AS cr,
    TO_DATE(data_emissao, 'DD/MM/YYYY') AS data_emissao, --conversao para data correta
    documento::VARCHAR(8000) AS documento,
    etapa::VARCHAR(8000) AS etapa,
    historico::VARCHAR(8000) AS historico,
    NULLIF(id_titulo, '')::INT AS id_titulo,   -- EVITA ERRO
    NULLIF(id_titulo_original, '')::VARCHAR(8000) AS id_titulo_original,
    m::VARCHAR(8000) AS m,
    motivo::VARCHAR(8000) AS motivo,
    nosso_numero::VARCHAR(8000) AS nosso_numero,
    NULLIF(op,'')::INT AS op,
    original::VARCHAR(8000) AS original,
    sacado::VARCHAR(8000) AS sacado,
    situacao::VARCHAR(8000) AS situacao,
    tipo::VARCHAR(8000) AS tipo,
    CAST(
    REPLACE(REGEXP_REPLACE(valor, '[^0-9,]', '', 'g'), ',', '.') 
    AS DECIMAL(10,2)
) AS valor,

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
    REPLACE(REGEXP_REPLACE(valor_total, '[^0-9,]', '', 'g'), ',', '.') 
    AS DECIMAL(10,2)
) AS valor_total,

CAST(
    REPLACE(REGEXP_REPLACE(desagio, '[^0-9,]', '', 'g'), ',', '.') 
    AS DECIMAL(10,2)
) AS desagio

FROM {{ source('public', 'f_titulosemaberto') }}

UNION ALL

SELECT 
    cedente::VARCHAR(8000) AS cedente,
    conf::VARCHAR(8000) AS conf,
    conta::VARCHAR(8000) AS conta,
    CAST(NULLIF(REGEXP_REPLACE(cpf_cnpj_cedente, '[^0-9]', '', 'g'), '') AS BIGINT) AS cpf_cnpj_cedente,
    CAST(NULLIF(REGEXP_REPLACE(cpf_cnpj_sacado, '[^0-9]', '', 'g'), '') AS BIGINT) AS cpf_cnpj_sacado,      
    cr::VARCHAR(8000) AS cr,
    TO_DATE(data_emissao, 'DD/MM/YYYY') AS data_emissao, --conversao para data correta
    documento::VARCHAR(8000) AS documento,
    etapa::VARCHAR(8000) AS etapa,
    historico::VARCHAR(8000) AS historico,
    NULLIF(id_titulo, '')::INT AS id_titulo,   -- EVITA ERRO
    NULLIF(id_titulo_original, '')::VARCHAR(8000) AS id_titulo_original,
    m::VARCHAR(8000) AS m,
    motivo::VARCHAR(8000) AS motivo,
    nosso_numero::VARCHAR(8000) AS nosso_numero,
    NULLIF(op,'')::INT AS op,
    original::VARCHAR(8000) AS original,
    sacado::VARCHAR(8000) AS sacado,
    situacao::VARCHAR(8000) AS situacao,
    tipo::VARCHAR(8000) AS tipo,
CAST(
    REPLACE(REGEXP_REPLACE(valor, '[^0-9,]', '', 'g'), ',', '.') 
    AS DECIMAL(10,2)
) AS valor,

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
    REPLACE(REGEXP_REPLACE(valor_total, '[^0-9,]', '', 'g'), ',', '.') 
    AS DECIMAL(10,2)
) AS valor_total,

CAST(
    REPLACE(REGEXP_REPLACE(desagio, '[^0-9,]', '', 'g'), ',', '.') 
    AS DECIMAL(10,2)
) AS desagio

FROM {{ source('public', 'f_titulosemaberto_fidc') }}





