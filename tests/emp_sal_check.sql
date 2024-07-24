with salary_out_of_range as (
  select *
  from {{ ref('emp') }}
  where sal < 0 or sal > 10000
)
select * from salary_out_of_range
