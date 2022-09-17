{#
Yêu cầu #0105b:
- Giảm sự rối rắm cho model này

#}


with fact_sales_order_line__source as(
  SELECT 
    *
  FROM `duckdata-320210.wide_world_importers.sales__order_lines`
), fact_sales__rename_column as(
   SELECT 
    order_line_id  AS sales_order_line_id
    , stock_item_id AS product_id
    , quantity AS quantity 
    , unit_price AS unit_price
    from fact_sales_order_line__source
), fact_sales__cast_type as(
  SELECT 
    CAST(sales_order_line_id AS INTEGER) AS sales_order_line_id
    , CAST(product_id AS INTEGER) AS product_id
    , CAST(quantity AS NUMERIC) AS quantity 
    , CAST(unit_price AS NUMERIC) AS unit_price
    from fact_sales__rename_column
), fact_sales__calculate as(
  select
    sales_order_line_id,
    product_id,
    quantity,
    unit_price,
    quantity * unit_price as gross_amount
  from fact_sales__cast_type
)
select 
  sales_order_line_id,
  product_id,
  quantity,
  unit_price,
  gross_amount
from fact_sales__calculate

