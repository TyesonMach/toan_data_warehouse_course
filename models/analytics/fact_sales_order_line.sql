{#
    add cast function to fact table while retriving data from source
#}

SELECT 
  cast(order_line_id as int) AS sales_order_line_id
  , cast(stock_item_id as int) AS product_id
  , cast(quantity as numeric) as quantity
  , cast(unit_price as numeric) as unit_price
  , cast(quantity * unit_price as numeric) AS gross_amount
FROM `duckdata-320210.wide_world_importers.sales__order_lines`

