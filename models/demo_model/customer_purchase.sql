{{ config(materialized='table') }}
select 
 cust.c_custkey
,cust.c_name
,cust.c_nationkey as nation
,sum(ord.o_totalprice) as total_order_price
from SNOWFLAKE_SAMPLE_DATA.TPCH_SF1.CUSTOMER cust
left outer join  SNOWFLAKE_SAMPLE_DATA.TPCH_SF1.ORDERS ord
 on cust.c_custkey =ord.o_custkey
 group by 
     cust.c_custkey
    ,cust.c_name
    ,cust.c_nationkey
     Having  total_order_price>0