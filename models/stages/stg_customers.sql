
{{ config(materialized='view') }}

SELECT
    customer_id,

    TRIM(LOWER(first_name))      AS first_name,
    TRIM(LOWER(last_name))       AS last_name,

    LOWER(TRIM(email))           AS email,

    REGEXP_REPLACE(phone, '[^0-9]', '') AS phone_number,

    INITCAP(TRIM(city))          AS city,

    CAST(created_at AS TIMESTAMP) AS created_at,

    CURRENT_TIMESTAMP()          AS updated_As

FROM {{ source('retail_source', 'CUSTOMERS') }}