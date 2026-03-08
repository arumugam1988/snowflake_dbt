 {% snapshot snap_dim_customers %}

{{
    config(
        target_schema='snapshots',
        unique_key='customer_id',
        strategy='check',
        check_cols=['first_name','last_name','email','phone_number','city']
    )
}}

select * from {{ ref('dim_customers') }}

{% endsnapshot %}