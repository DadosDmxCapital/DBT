SELECT 
  NULLIF(numero_pedido, '')::VARCHAR(8000) AS operador,
  NULLIF(data_pedido, '')::INT AS numero_operacao,

  CASE 
    WHEN cliente ~ '^\d{2}/\d{2}/\d{4}$' THEN TO_DATE(cliente, 'DD/MM/YYYY')
    ELSE NULL
  END AS data_operacao,

  NULLIF(produto, '')::VARCHAR(8000) AS cedente,
  CAST(NULLIF(REGEXP_REPLACE(quantidade, '[^0-9]', '', 'g'), '') AS BIGINT) AS cpf_sacado,
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

