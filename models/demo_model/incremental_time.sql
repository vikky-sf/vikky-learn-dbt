{{config(materialized='incremental',unique_key='t_time')}}

 select *,
        to_time(concat(t_hour::varchar,':',T_minute,':',t_second))as my_time
 from   SNOWFLAKE_SAMPLE_DATA.TPCDS_SF10TCL.TIME_DIM
 where to_time(concat(t_hour::varchar,':',T_minute,':',t_second))<=current_time
  {% if is_incremental() %}
    and my_time >= (select max(my_time) from {{ this }})
  {% endif %}
