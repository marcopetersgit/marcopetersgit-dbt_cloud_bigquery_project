/* models/staging/stg_orders.sql */

SELECT
  *
  , CONCAT(first_name,' ',last_name) AS full_name
FROM
    {{ source('mydbt_sources_biquery', 'customers') }} -- Compile-time reference