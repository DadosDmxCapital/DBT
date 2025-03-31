
  create view "operacoes"."public"."titulosaberto__dbt_tmp"
    
    
  as (
    SELECT 
    cedente,
    conf,
    conta,
    cpf_cnpj_cedente,
    cpf_cnpj_sacado,
    cr,
    TO_DATE(data_emissao, 'dd/MM/yyyy')::date AS data_emissao,
    documento,
    etapa,
    historico,
    CAST(id_titulo AS integer) AS id_titulo,
    id_titulo_original,
    m,
    motivo,
    nosso_numero,
    COALESCE(
         CAST(NULLIF(op,'') AS integer),0
    ) AS op,
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
    TO_DATE(vencimento, 'dd/MM/yyyy')::date AS vencimento,
    CAST(
        REGEXP_REPLACE(REGEXP_REPLACE(desagio, '\.', '', 'g'), ',', '.', 'g') AS decimal(18, 2)
    ) AS desagio
FROM 
    "operacoes"."public"."f_titulosemaberto"
  );