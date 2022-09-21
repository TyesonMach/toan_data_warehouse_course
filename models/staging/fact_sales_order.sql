with fact_sales_order__source as(
    SELECT 
      order_ID,
      customer_id
    FROM `duckdata-320210.wide_world_importers.sales__orders`
)
, fact_sales_order__rename as(
    SELECT 
      order_ID as sales_order_id,
      customer_id
    from fact_sales_order__source
)
, fact_sales_order__cast_type as(
    SELECT 
    CAST(sales_order_id AS INTEGER) AS sales_order_id
    , CAST(customer_id AS INTEGER) AS customer_id
  FROM fact_sales_order__rename
)

select * 
from fact_sales_order__cast_type