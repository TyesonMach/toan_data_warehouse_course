{# 
Yêu cầu #0110a:
- Xem thông tin và dữ liệu của bảng "application__people"
- Lấy dữ liệu cho model này:

| Tên gốc   | Tên mới          |
|-----------|------------------|
| person_id | person_id        |
| full_name | person_full_name |

#}

with dim_person__source as(
    SELECT
    person_id,
    full_name
    FROM `duckdata-320210.wide_world_importers.application__people`
)
, dim_person__rename as(
  select
    person_id,
    full_name as person_full_name
  from dim_person__source
)
, dim_person__cast_type as(
  select
    cast(person_id as int) as person_id,
    cast(person_full_name as string) as person_full_name
  from dim_person__rename
)

select * from dim_person__cast_type