/*
date:08-05-2022
description: Creates dim_customer table joining customer info with his/her order info
*/


with customers as (

    select * from {{ ref('stg_customers') }}

),

orders as (

    select * from {{ ref('fct_orders') }}
    

),

customer_orders as (

    select
        customer_id,
        min(order_date) as first_order_date,
        max(order_date) as most_recent_order_date,
        count(order_id) as number_of_orders,
        sum(amount) as lifetime_value
    from orders
    group by customer_id
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