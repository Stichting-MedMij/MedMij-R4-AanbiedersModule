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
  order by identity
  select
    'Mapping name': identity,
    'Concept id': map,
    'FHIR element': id,
    Comments: comment
</fql>