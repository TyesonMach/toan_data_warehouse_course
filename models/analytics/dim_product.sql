{#
  using CTE to reduce the complication of the SQL for the dim table
#}

with dim_product__source as(
  SELECT 
    *
  FROM `duckdata-320210.wide_world_importers.warehouse__stock_items`
), 
dim_product__rename_column as (
  SELECT 
      stock_item_id AS product_id
      ,stock_item_name as product_name
      , brand AS  brand_name
  from dim_product__source
),
dim_product__cast_type as(
  SELECT 
      CAST(product_id AS INTEGER) AS product_id
      , CAST(product_name AS STRING) AS product_name
      , CAST(brand_name AS STRING) AS brand_name
  from dim_product__rename_column
)
select product_id,
  product_name,
  brand_name
from dim_product__cast_type