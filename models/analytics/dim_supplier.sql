{#
Yêu cầu #0107a:
- Xem thông tin và dữ liệu của bảng "purchasing__suppliers".
- Lấy dữ liệu cho bảng "dim_supplier". Tương tự như "stg_fact_sales_order", mình cũng cần xử lý trước khi JOIN vào "dim_product". Tuy nhiên, bảng "dim_supplier" có khả năng sẽ được sử dụng nên mình sẽ để ở "analytics".

| Tên gốc       | Tên mới       |
|---------------|---------------|
| supplier_id   | supplier_id   |
| supplier_name | supplier_name |

#}
with dim_supplier__source as(
    select
    supplier_id,
    supplier_name
  from `duckdata-320210.wide_world_importers.purchasing__suppliers`
)
, dim_supplier__cast_type as(
  select
    cast(supplier_id as int) as supplier_id,
    cast(supplier_name as string) as supplier_name
  from dim_supplier__source
)

select *
from dim_supplier__cast_type
