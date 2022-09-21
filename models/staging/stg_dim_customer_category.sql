with customer_categories__source as(
  select
    customer_category_id,
    customer_category_name
  from  `duckdata-320210.wide_world_importers.sales__customer_categories`
)
, customer_categoried__cast_type as(
  select
    cast(customer_category_id as int) as customer_category_id,
    cast(customer_category_name as string) as customer_category_name
  from customer_categories__source
)

select * from customer_categoried__cast_type