{{config(materialized='table')}}
select 
    PRODUCT_ID,
	PRODUCT_NAME,
	CATEGORY ,
	PRICE
    from {{ref('stg_products')}}
