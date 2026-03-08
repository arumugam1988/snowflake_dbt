{% snapshot snap_dim_customers %}

{{
    config(
        target_schema='snapshots',
        unique_key='customer_id',
        strategy='check',
        check_cols=['full_name','email','city']
    )
}}

SELECT
customer_id,
full_name,
email,
city,
created_at
FROM {{ ref('dim_customers') }}

{% endsnapshot %}