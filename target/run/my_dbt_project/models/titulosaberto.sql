
  create view "operacoes"."public"."titulosaberto__dbt_tmp"
    
    
  as (
    -- models/titulosaberto.sql

-- Modelo para criar a views de titulos em abertos , já com a transformação ideal do tipo de dados a ser utilizado no banco de dados , visando melhor performance dos dados

SELECT 
    cedente,
    conf,
    conta,
    cpf_cnpj_cedente,
    cpf_cnpj_sacado,
    cr,
    CAST(
        TO_DATE(data_emissao, 'DD/MM/YYYY') AS date --conversao para tipo de data
    ) AS data_emissao,
    documento,
    etapa,
    historico,
   CAST(id_titulo AS integer) AS id_titulo, --conversao para tipo inteiro
    id_titulo_original,
    m,
    motivo,
    nosso_numero,
    COALESCE(
         CAST(NULLIF(op,'') AS integer),0
    ) AS op,      --conversao para tipo inteiro
    original,
    sacado,
    situacao,
    tipo,
    CAST(
        REGEXP_REPLACE(REGEXP_REPLACE(valor, '\.', '', 'g'), ',', '.', 'g') AS decimal(18, 2) --removendo caracteres especiais e convertendo o valor monetário tipo brasileiro
    ) AS valor,
    CAST(
        REGEXP_REPLACE(REGEXP_REPLACE(valor_juros, '\.', '', 'g'), ',', '.', 'g') AS decimal(18, 2) --removendo caracteres especiais e convertendo o valor monetário tipo brasileiro
    ) AS valor_juros,
    CAST(
        REGEXP_REPLACE(REGEXP_REPLACE(valor_multa, '\.', '', 'g'), ',', '.', 'g') AS decimal(18, 2) -- removendo caracteres especiais e convertendo o valor monetário tipo brasileiro
    ) AS valor_multa,
    CAST(
        REGEXP_REPLACE(REGEXP_REPLACE(valor_tarifas, '\.', '', 'g'), ',', '.', 'g') AS decimal(18, 2)  -- removendo caracters especiais e convertendo o valor monetário tipo brasileiro
    ) AS valor_tarifas,
    CAST(
        REGEXP_REPLACE(REGEXP_REPLACE(valor_total, '\.', '', 'g'), ',', '.', 'g') AS decimal(18, 2) --removendo caracteres especiais e convertendo o valor monetário tipo brasileiro
    ) AS valor_total,
    CAST(
        TO_DATE(vencimento, 'DD/MM/YYYY') AS date --conversao para tipo de data
    ) AS vencimento,
    CAST(
        REGEXP_REPLACE(REGEXP_REPLACE(desagio, '\.', '', 'g'), ',', '.', 'g') AS decimal(18, 2) --removendo caracteres especiais e convertendo o valor monetário tipo brasileiro
    ) AS desagio
FROM 
    "operacoes"."public"."f_titulosemaberto"
  );