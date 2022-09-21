with customer_delivery_method__source as(
  select
    delivery_method_id,
    delivery_method_name
  from  `duckdata-320210.wide_world_importers.application__delivery_methods` 
)
, customer_delivery_method__cast_type as(
  select
    cast(delivery_method_id as int) as delivery_method_id,
    cast(delivery_method_name as string) as delivery_method_name
  from customer_delivery_method__source
)

select * from customer_delivery_method__cast_type