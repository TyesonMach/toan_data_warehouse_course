{#
  add cast function to dim table while retriving data from source
#}

SELECT 
    cast(stock_item_id as int) AS product_id
    , cast(stock_item_name as string) AS product_name
    , cast(brand as string) AS brand_name
FROM `duckdata-320210.wide_world_importers.warehouse__stock_items`