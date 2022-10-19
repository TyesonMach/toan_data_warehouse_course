with fact_inventory_transaction__source as(
  select *
  from `duckdata-320210.wide_world_importers.warehouse__stock_item_transactions`
)
, fact_inventory_transaction__rename_column as(
  select 	stock_item_transaction_id as inventory_transaction_id,
  stock_item_id as product_id,
  transaction_type_id,
  customer_id,
  invoice_id,
  supplier_id,
  purchase_order_id,
  transaction_occurred_when,
  quantity
  from fact_inventory_transaction__source
)
, fact_inventory_transaction__cast_type as(
  select 
    cast(inventory_transaction_id as integer) as inventory_transaction_id,
    cast(product_id as integer) as product_id,
    cast(transaction_type_id as integer) as transaction_type_id,
    cast(customer_id as integer) as customer_id,
    cast(invoice_id as integer) as invoice_id,
    cast(supplier_id as integer) as supplier_id,
    cast(purchase_order_id as integer) as purchase_order_id, 
    cast(transaction_occurred_when as timestamp) as transaction_occurred_when,
    cast(quantity as numeric) as quantity
  from fact_inventory_transaction__rename_column
)

select *
from fact_inventory_transaction__cast_type
