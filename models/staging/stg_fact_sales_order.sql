WITH fact_sales_order__source AS (
  SELECT *
  FROM `duckdata-320210.wide_world_importers.sales__orders`
)

, fact_sales_order__rename_column AS (
  SELECT 
    order_id AS sales_order_id
    , customer_id
    ,picked_by_person_id
  FROM fact_sales_order__source
)

, fact_sales_order__cast_type AS (
  SELECT 
    CAST(sales_order_id AS INTEGER) AS sales_order_id
    , CAST(customer_id AS INTEGER) AS customer_id
    ,cast(picked_by_person_id as int) as picked_by_person_id
  FROM fact_sales_order__rename_column
)


SELECT 
  sales_order_id
  , customer_id
  ,picked_by_person_id
FROM fact_sales_order__cast_type
