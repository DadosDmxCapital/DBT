SELECT 
    id,
    operacao_id,
    tipotitulo,
    cmc7,
    numero,
    documentosacado,
    numeronota,
    vencimento,
    valorface,
    nomesacado,
    classerisco,
    timestamp_extracao,
    'Sec' AS Empresa
FROM {{ source('public', 'f_operacoes_detalhes') }}

UNION ALL

SELECT 
     id,
    operacao_id,
    tipotitulo,
    cmc7,
    numero,
    documentosacado,
    numeronota,
    vencimento,
    valorface,
    nomesacado,
    classerisco,
    timestamp_extracao,
    'Sec' AS Empresa
FROM {{source('public', 'f_operacoes_fidc_detalhes') }}

