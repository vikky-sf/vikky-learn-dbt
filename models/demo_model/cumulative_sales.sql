{{config(materialized='table')}}
with t_cumulative_sales as 
(
select o_orderdate,
sum(o_totalprice) over(order by o_orderdate) as cumulative_sales
from SNOWFLAKE_SAMPLE_DATA.TPCH_SF1.ORDERS
)
select o_orderdate,cumulative_sales from t_cumulative_sales
order by o_orderdate


