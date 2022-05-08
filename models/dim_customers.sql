/*
date:08-05-2022
description: Creates dim_customer table joining customer info with his/her order info
*/

{{ config (materialized="table")}}

with customers as (

    select * from {{ ref('stg_customers') }}

),

orders as (

    select
        id as order_id,
        user_id as customer_id,
        order_date,
        status
    from raw.jaffle_shop.orders    

),

customer_orders as (

    select * from {{ ref('stg_orders') }}
),

final_cte as (

    select
        c.customer_id,
        c.first_name,
        c.last_name,
        co.first_order_date,
        co.most_recent_order_date,
        coalesce(co.number_of_orders,0) as number_of_orders
        --colalesce takes the first non null value
    from customers c
    left join customer_orders co
    using (customer_id)

)

select * from final_cte