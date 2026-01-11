/* models/marts/customers_with_orders.sql */

WITH orders AS (
    SELECT * FROM {{ ref('stg-orders') }}
),

customers AS (  -- 1. I renamed this from 'users' to 'customers' so it matches below
    SELECT * FROM {{ ref('stg-customers') }}
)

SELECT
    customers.first_name,
    customers.last_name,  -- 2. Added the missing comma here
    COUNT(orders.id) as total_orders
FROM customers
LEFT JOIN orders 
    ON customers.id = orders.user_id
GROUP BY 1, 2