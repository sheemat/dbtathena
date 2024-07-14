
-- Use the `ref` function to select from other models
{{ config(
    materialized='incremental',
    table_type='hive',
    incremental_strategy='append',
    format='parquet',
    partitioned_by=['exec_date']
) }}


select *, current_date + interval '0' day as exec_date
from {{ ref('my_second_dbt_model') }}
where id = 1
