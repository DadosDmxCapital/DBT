
  create view "operacoes"."public"."fato_quitadosfraude__dbt_tmp"
    
    
  as (
    SELECT id_titulo,
       vencimento,
       CAST(NULLIF(REGEXP_REPLACE(REGEXP_REPLACE(valor, '[^0-9,]', '', 'g'), ',', '.', 'g'), '') AS DECIMAL(10,2)) AS VALOR,
       TO_DATE(data_quitacao, 'DD/MM/YYYY') AS data_quitacao,
       sacado, 
       cpf_cnpj_sacado,
       cedente,
       cpf_cnpj_cedente,
       setor,
       banco_cobrador,
       agencia_cobradora,
       praca_pagamento,
       localidade_sacado,
       criticas,
       timestamp_extracao,
       'Sec' AS Empresa
FROM "operacoes"."public"."f_titulosquitadosfraude"

UNION ALL

SELECT id_titulo,
       vencimento,
       CAST(NULLIF(REGEXP_REPLACE(REGEXP_REPLACE(valor, '[^0-9,]', '', 'g'), ',', '.', 'g'), '') AS DECIMAL(10,2)) AS VALOR,
       TO_DATE(data_quitacao, 'DD/MM/YYYY') AS data_quitacao,
       sacado,
       cpf_cnpj_sacado,
       cedente,
       cpf_cnpj_cedente,
       setor,
       banco_cobrador,
       agencia_cobradora,
       praca_pagamento,
       localidade_sacado,
       criticas,
       timestamp_extracao,
       'Fidc' AS Empresa
FROM "operacoes"."public"."f_titulosquitadosfraude_fidc"
  );