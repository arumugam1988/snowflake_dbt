{{ config(
    materialized='incremental',
    unique_key='order_item_id',
    incremental_strategy='merge'
) }}

select
    oi.order_item_id,
    oi.order_id,
    o.order_dt,
    o.order_status,
    o.customer_id,
    oi.product_id,
    oi.quantity,
    oi.total_amount,
    pay.payment_method,
    pay.payment_status,
    pay.pmt_date,
    current_timestamp() as dbt_created_at

from {{ ref('stg_order_items') }} oi

left join {{ ref('stg_orders') }} o
    on oi.order_id = o.order_id

left join {{ ref('stg_payments') }} pay
    on oi.order_id = pay.order_id

{% if is_incremental() %}

where o.order_dt > (
    select max(order_dt) from {{ this }}
)

{% endif %}