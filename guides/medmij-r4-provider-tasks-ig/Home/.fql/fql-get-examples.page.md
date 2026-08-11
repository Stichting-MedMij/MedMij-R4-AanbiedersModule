---
topic: fql-get-examples
---

<fql>
  from
    Resource
  where 
    meta.profile = %canonical
  select
    Name: id.split('-').skip(2).join(' '),
    Link: link(%context)
</fql>