{{config(materialized='table',alias='customer',schema='dwh',database='testing_db')}}

with cust as (
select C_CUSTKEY as cust_id
,C_NAME          as cust_name
,C_ADDRESS       as cust_address
,C_PHONE         as cust_phone
,C_MKTSEGMENT    as cust_category
from SNOWFLAKE_SAMPLE_DATA.TPCH_SF1.CUSTOMER limit 100
)
select * from cust 