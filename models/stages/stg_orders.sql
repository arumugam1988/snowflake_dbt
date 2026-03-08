{{config(materialized='view')}}

select
    order_id,
    customer_id,
    order_date as order_dt,
    status as order_status
from {{ source('retail_source','ORDERS') }}