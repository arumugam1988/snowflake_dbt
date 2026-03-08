{{config(materialized='view')}}

select 
ORDER_ITEM_ID,
	ORDER_ID,
	PRODUCT_ID,
	QUANTITY,
	TOTAL_AMOUNT
from 
{{source('retail_source','ORDER_ITEMS')}}