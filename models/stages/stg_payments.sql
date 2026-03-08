{{config(materialized='view')}}
select 
PAYMENT_ID,
	ORDER_ID,
	PAYMENT_METHOD,
	PAYMENT_STATUS,
	PAYMENT_DATE PMT_DATE
from 
{{source('retail_source','PAYMENTS')}}