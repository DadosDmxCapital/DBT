SELECT 
  NULLIF(numero_pedido, '')::VARCHAR(8000) AS operador,

  CASE 
    WHEN data_pedido ~ '^\d+$' THEN data_pedido::INT
    ELSE NULL
  END AS numero_operacao,

  CASE 
    WHEN cliente ~ '^\d{2}/\d{2}/\d{4}$' THEN TO_DATE(cliente, 'DD/MM/YYYY')
    ELSE NULL
  END AS data_operacao,

  NULLIF(produto, '')::VARCHAR(8000) AS cedente,

  CASE 
    WHEN REGEXP_REPLACE(quantidade, '[^0-9]', '', 'g') ~ '^\d+$' THEN 
      CAST(REGEXP_REPLACE(quantidade, '[^0-9]', '', 'g') AS BIGINT)
    ELSE NULL
  END AS cpf_sacado,

  NULLIF(status, '')::VARCHAR(8000) AS status,

  CASE 
    WHEN data_entrega ~ '^\d{2}/\d{2}/\d{4}$' THEN TO_DATE(data_entrega, 'DD/MM/YYYY')
    ELSE NULL
  END AS data_entrega,

  CASE 
    WHEN observacoes ~ '^\d{2}/\d{2}/\d{4}$' THEN TO_DATE(observacoes, 'DD/MM/YYYY')
    ELSE NULL
  END AS data_embarque

FROM {{ source('public', 'f_controle_mercadorias') }}


