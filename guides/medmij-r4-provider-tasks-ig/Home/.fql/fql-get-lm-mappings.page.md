---
topic: fql-get-lm-mappings
---

<fql>
  from
    StructureDefinition
  where
    url = %canonical
  for
    differential.element 
  select
    id, join mapping {identity, map, comment}
  select
    'Mapping name': identity,
    'Concept id': map,
    'Logical element': id.replace('pt-lm-', '')
  order by identity
</fql>