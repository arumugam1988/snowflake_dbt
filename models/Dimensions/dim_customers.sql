{{config(materialized='table')}}
SELECT
    customer_id,
    first_name || ' ' || last_name AS full_name,
    email,
    city,
    created_at
FROM {{ ref('stg_customers') }}