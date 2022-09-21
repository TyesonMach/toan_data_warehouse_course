{#
  create a table with 4 atribute
#}

SELECT 
  order_line_id AS sales_order_line_id
  , quantity
  , unit_price
  , quantity * unit_price as gross_amount
FROM `duckdata-320210.wide_world_importers.sales__order_lines`

