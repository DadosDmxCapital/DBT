SELECT 
    CAST(nome AS VARCHAR(8000)) AS nome,
    CAST(cpf_cnpj AS BIGINT) AS cpf_cnpj,
    CAST(endereco AS VARCHAR(8000)) AS endereco,
    CAST(cep AS VARCHAR(8000)) AS cep,
    CAST(cidade AS VARCHAR(8000)) AS cidade,
    CAST(uf AS VARCHAR(8000)) AS uf,
    CAST(email AS VARCHAR(8000)) AS email,
    CAST(telefone AS VARCHAR(8000)) AS telefone,
    CAST(gerente AS VARCHAR(8000)) AS gerente,
    CAST(operador AS VARCHAR(8000)) AS operador,
    CAST(captador AS VARCHAR(8000)) AS captador,
    CAST(controlador AS VARCHAR(8000)) AS controlador,
    CAST(fator_percentual AS VARCHAR(8000)) AS fator_percentual,
    CAST(advalorem_percentual AS VARCHAR(8000)) AS advalorem_percentual,
    CAST(data_cadastro AS VARCHAR(8000)) AS data_cadastro,
    CAST(fonte_captacao AS VARCHAR(8000)) AS fonte_captacao,
    CAST(setor AS VARCHAR(8000)) AS setor,
    CAST(grupo_economico AS VARCHAR(8000)) AS grupo_economico,
    CAST(bloqueado AS VARCHAR(8000)) AS bloqueado,
    CAST(primeira_operacao AS VARCHAR(8000)) AS primeira_operacao,
    CAST(limite_global AS DECIMAL(10,2)) AS limite_global,
    CAST(limite_boleto_especial AS DECIMAL(10,2)) AS limite_boleto_especial,
    CAST(limite_comissaria AS DECIMAL(10,2)) AS limite_comissaria,
    CAST(limite_tranche AS DECIMAL(10,2)) AS limite_tranche,
    CAST(limite_boleto_especial_tranche AS VARCHAR(8000)) AS limite_boleto_especial_tranche,
    CAST(limite_boleto_garantido AS VARCHAR(8000)) AS limite_boleto_garantido,
    CAST(limite_operacao_clean AS VARCHAR(8000)) AS limite_operacao_clean,
    CAST(risco_atual AS DECIMAL(10,2)) AS risco_atual,
    CAST(saldo AS DECIMAL(10,2)) AS saldo,
    CAST(vencimento_contrato AS VARCHAR(8000)) AS vencimento_contrato,
    CAST(id_cedente AS INT) AS id_cedente,
    CAST(timestamp_extracao AS VARCHAR(8000)) AS timestamp_extracao
FROM 
    {{ source('public', 'd_cedentes') }}
