
  create view "operacoes"."public"."dim_cedentes_fidic__dbt_tmp"
    
    
  as (
    SELECT 
    nome,
    CAST(REGEXP_REPLACE(cpf_cnpj, '[^0-9]', '', 'g') AS BIGINT) AS cpf_cnpj,
    endereco,
    cep,
    cidade,
    uf,
    email,
    telefone,
    gerente,
    operador,
    captador,
    controlador,
    fator_percentual,
    advalorem_percentual,
    TO_DATE(data_cadastro, 'dd/MM/yyyy')::date AS data_cadastro,
    fonte_captacao,
    setor,
    grupo_economico,
    bloqueado,
    TO_DATE(primeira_operacao, 'dd/MM/yyyy')::date AS primeira_operacao,
    CAST(REGEXP_REPLACE(REGEXP_REPLACE(limite_global, '\.', '', 'g'), ',', '.', 'g') AS DECIMAL(18,2)) AS limite_global,
    CAST(REGEXP_REPLACE(REGEXP_REPLACE(limite_boleto_especial, '\.', '', 'g'), ',', '.', 'g') AS DECIMAL(18,2)) AS limite_boleto_especial,
    CAST(REGEXP_REPLACE(REGEXP_REPLACE(limite_comissaria, '\.', '', 'g'), ',', '.', 'g') AS DECIMAL(18,2)) AS limite_comissaria,
    CAST(REGEXP_REPLACE(REGEXP_REPLACE(limite_tranche, '\.', '', 'g'), ',', '.', 'g') AS DECIMAL(18,2)) AS limite_tranche,
    risco_atual,
    saldo,
    vencimento_contrato,
    id_cedente,
    timestamp_extracao
FROM 
    "operacoes"."public"."d_cedentes_fidc"
  );