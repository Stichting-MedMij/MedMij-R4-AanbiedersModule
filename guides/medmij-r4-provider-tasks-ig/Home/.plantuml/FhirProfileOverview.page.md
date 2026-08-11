---
topic: FhirProfileOverview
---

<plantuml>

@startuml
hide circle
hide empty members
skinparam shadowing false
skinparam roundcorner 12
skinparam defaultFontName Segoe UI
skinparam entity {
  BackgroundColor #F4F9FF
  BorderColor #4A78B5
  BorderThickness 1.5
  FontColor #1B2A4A
}
skinparam ArrowColor #4A78B5
skinparam ArrowFontColor #4A78B5

entity "pt-DigitalActivity" as DigitalActivity <<ActivityDefinition>> {
}

entity "pt-DigitalGroupPlan" as DigitalGroupPlan <<ServiceRequest>> {
}

entity "pt-Endpoint" as Endpoint <<Endpoint>> {
}

entity "pt-ExecutionOrder" as ExecutionOrder <<ServiceRequest>> {
}

entity "pt-Task" as Task <<Task>> #FFE7CC {
}

DigitalActivity --> "1..*" Endpoint : endpoint «extension»
Task --> "0..1" ExecutionOrder : focus
Task --> "1..1" DigitalActivity : digitalActivity «extension»
Task --> "1..1" DigitalGroupPlan : basedOn
@enduml

</plantuml>
