{#
Yêu cầu #0106b:
- Xem thông tin và dữ liệu của bảng "sales__customers"
- Sửa câu query SQL để lấy 2 cột: "customer_id", "customer_name"

#}


with dim_product__source as(
  SELECT 
    customer_id, customer_name
  FROM `duckdata-320210.wide_world_importers.sales__customers`
)
, dim_product__cast_type as(
  SELECT 
    cast(customer_id as int) as customer_id,
     cast(customer_name as string) as customer_name
  FROM `duckdata-320210.wide_world_importers.sales__customers`
)

select * 
from dim_product__cast_type