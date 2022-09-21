{#
  add a product_id atribute for fact table
#}

SELECT 
  order_line_id AS sales_order_line_id
  , quantity
  , unit_price
  , quantity * unit_price AS gross_amount,
  stock_item_id as product_id
FROM `duckdata-320210.wide_world_importers.sales__order_lines`

