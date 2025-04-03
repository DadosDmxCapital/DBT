
  create view "operacoes"."public"."fato_detalhes_operacoes__dbt_tmp"
    
    
  as (
    SELECT id, operacao_id, tipotitulo, cmc7, numero, documentosacado, numeronota, vencimento, valorface, nomesacado, classerisco, timestamp_extracao
FROM "operacoes"."public"."f_operacoes_detalhes"

UNION ALL

SELECT id, operacao_id, tipotitulo, cmc7, numero, documentosacado, numeronota, vencimento, valorface, nomesacado, classerisco, timestamp_extracao
FROM "operacoes"."public"."f_operacoes_fidc_detalhes"
  );