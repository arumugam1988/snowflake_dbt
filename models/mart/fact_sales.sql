{{ config(
    materialized='incremental',
    unique_key='order_item_id',
    incremental_strategy='merge'
) }}

SELECT
    i.order_item_id,
    o.order_id,
    o.customer_id,
    o.order_dt AS order_date,
    i.product_id,
    i.product_name,
    i.quantity,
    i.total_amount,
    current_timestamp() AS dbt_created_at
FROM {{ ref('stg_orders') }} o
JOIN {{ ref('int_order_items_enriched') }} i
    ON o.order_id = i.order_id

{% if is_incremental() %}

WHERE o.order_dt >
(
    SELECT MAX(order_date) FROM {{ this }}
)

{% endif %}