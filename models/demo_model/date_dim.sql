{{config(materialized='incremental',unique_key='D_DATE')}}
SELECT * 
FROM snowflake_sample_data.tpcds_sf10tcl.date_dim
WHERE d_date <=current_date
  
 {% if is_incremental() %}
    and d_date >= (select max(d_date) from {{ this }})
  {% endif %}