{{ config(materialized='view') }}

SELECT
    oi.order_item_id,
    oi.order_id,
    oi.product_id,
    p.product_name,
    oi.quantity,
    oi.total_amount
FROM {{ ref('stg_order_items') }} oi
LEFT JOIN {{ ref('stg_products') }} p
    ON oi.product_id = p.product_id