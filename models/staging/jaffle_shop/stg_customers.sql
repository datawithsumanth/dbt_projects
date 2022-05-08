/*
date:08-05-2022
description: Staging table for customers
*/

with customers as (

    select
        id as customer_id,
        first_name,
        last_name
    from raw.jaffle_shop.customers

)

select * from customers