
  create view "operacoes"."public"."titulosaberto__dbt_tmp"
    
    
  as (
    -- models/titulosaberto.sql

SELECT 
    cedente,
    conf,
    conta,
    CAST(
        REGEXP_REPLACE(cpf_cnpj_cedente, '[\.\-\/]', '', 'g') AS bigint
    ) AS cpf_cnpj_cedente,
    CAST(
        REGEXP_REPLACE(cpf_cnpj_sacado, '[\.\-\/]', '', 'g') AS bigint
    ) AS cpf_cnpj_sacado,
    cr,
    CAST(
        TO_DATE(data_emissao, 'DD/MM/YYYY') AS date
    ) AS data_emissao,
    documento,
    etapa,
    historico,
    id_titulo,
    id_titulo_original,
    m,
    motivo,
    nosso_numero,
    op,
    original,
    sacado,
    situacao,
    tipo,
    CAST(
        REGEXP_REPLACE(REGEXP_REPLACE(valor, '\.', '', 'g'), ',', '.', 'g') AS decimal(18, 2)
    ) AS valor,
    CAST(
        REGEXP_REPLACE(REGEXP_REPLACE(valor_juros, '\.', '', 'g'), ',', '.', 'g') AS decimal(18, 2)
    ) AS valor_juros,
    CAST(
        REGEXP_REPLACE(REGEXP_REPLACE(valor_multa, '\.', '', 'g'), ',', '.', 'g') AS decimal(18, 2)
    ) AS valor_multa,
    CAST(
        REGEXP_REPLACE(REGEXP_REPLACE(valor_tarifas, '\.', '', 'g'), ',', '.', 'g') AS decimal(18, 2)
    ) AS valor_tarifas,
    CAST(
        REGEXP_REPLACE(REGEXP_REPLACE(valor_total, '\.', '', 'g'), ',', '.', 'g') AS decimal(18, 2)
    ) AS valor_total,
    CAST(
        TO_DATE(vencimento, 'DD/MM/YYYY') AS date
    ) AS vencimento,
    CAST(
        REGEXP_REPLACE(REGEXP_REPLACE(desagio, '\.', '', 'g'), ',', '.', 'g') AS decimal(18, 2)
    ) AS desagio
FROM 
    "operacoes"."public"."f_titulosemaberto"
  );