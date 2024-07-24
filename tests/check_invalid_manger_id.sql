with invalid_managers as (
  select *
  from {{ ref('emp') }}
  where mgr is not null 
  and mgr not in (select empno from {{ ref('emp') }})
)
select * from invalid_managers