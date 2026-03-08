{{config(materialized='view')}}

select 
PRODUCT_ID,
	PRODUCT_NAME,
	CATEGORY ,
	PRICE,
	CREATED_AT
from {{source('retail_source','PRODUCTS')}}