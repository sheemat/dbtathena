
-- Use the `ref` function to select from other models
{{ config(
    materialized='table',
    table_type='iceberg',
    format='parquet',
    partitioned_by=['exec_date'],
    table_properties={
     'optimize_rewrite_delete_file_threshold': '2'
     }
) }}


select *, current_date as exec_date
from {{ ref('my_second_dbt_model') }}
where id = 1
