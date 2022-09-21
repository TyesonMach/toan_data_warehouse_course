with customer_buying_group__source as(
  select
    buying_group_id,
    buying_group_name
  from  `duckdata-320210.wide_world_importers.sales__buying_groups`
)
, customer_buying_group__cast_type as(
  select
    cast(buying_group_id as int) as buying_group_id,
    cast(buying_group_name as string) as buying_group_name
  from customer_buying_group__source
)

select * from customer_buying_group__cast_type