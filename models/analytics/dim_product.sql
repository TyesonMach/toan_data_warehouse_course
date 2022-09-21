{#
  create a product dim table from table "Warehouse__stock_items"
#}

SELECT 
  stock_item_id as product_id,
  stock_item_name as product_name,
  brand as brand_name
FROM `duckdata-320210.wide_world_importers.warehouse__stock_items`