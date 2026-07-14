---
topic: fql-get-mappings
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
    'FHIR element': id,
    Comments: comment
  order by identity
</fql>