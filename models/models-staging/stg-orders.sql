/* models/staging/stg_orders.sql */

SELECT
  *
  , CONCAT(user_id,'-',id) AS unique_id
FROM
    {{ source('mydbt_sources_biquery', 'orders') }} -- Compile-time reference