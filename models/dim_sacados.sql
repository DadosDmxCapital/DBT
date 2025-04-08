SELECT 
    id,
    nome,
    CAST(NULLIF(REGEXP_REPLACE(cpf_cnpj, '[^0-9]', '', 'g'), '') AS BIGINT) AS cpf_cnpj,
    endereco,
    cep,
    cidade,
    uf,
    e_mail,
    telefone,
    sms,
    data_cadastro,
    timestamp_extracao
FROM {{ source('public', 'd_sacados') }}

UNION  -- Remove registros duplicados automaticamente

SELECT 
    id,
    nome,
    CAST(NULLIF(REGEXP_REPLACE(cpf_cnpj, '[^0-9]', '', 'g'), '') AS BIGINT) AS cpf_cnpj,endereco,
    cep,
    cidade,
    uf,
    e_mail,
    telefone,
    sms,
    data_cadastro,
    timestamp_extracao
FROM {{ source('public', 'd_sacados_fidc') }}
