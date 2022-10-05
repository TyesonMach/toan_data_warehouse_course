with dim_pakage_type__source as(
  select package_type_id,
    package_type_name
  from `duckdata-320210.wide_world_importers.warehouse__package_types`
)
, dim_pakage_type__cast as(
  select cast(package_type_id as int) as package_type_id,
  cast(package_type_name as string) as package_type_name
  from dim_pakage_type__source
)
, dim_backordered as(
  select true as is_undersupply_back_ordered_bool,
  'Supply Backordered' as is_undersupply_back_ordered

  union all
  
  select false as is_undersupply_back_ordered_bool,
  'Not supply Backordered' as is_undersupply_back_ordered

  union all

  select null as is_undersupply_back_ordered_bool,
  'Undefined' as is_supply_back_ordered
)
, dim_fingerprint as (
    select FARM_FINGERPRINT(CONCAT(back.is_undersupply_back_ordered_bool, pack.package_type_id)) as sales_order_line_indicator_key,
    back.is_undersupply_back_ordered_bool,
    back.is_undersupply_back_ordered,
    pack.package_type_id,
    pack.package_type_name
    from dim_backordered as back cross join dim_pakage_type__cast as pack
)

select sales_order_line_indicator_key,
  is_undersupply_back_ordered_bool,
  is_undersupply_back_ordered,
  package_type_id,
  package_type_name
from dim_fingerprint