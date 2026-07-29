---
topic: LogicalModelOverview
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

entity "Digital Activity" as DigitalActivity {
  Identifier
  Title
  Status
  Publisher
  Description
  Schedule
  Usage
}

entity "Digital Group Plan" as DigitalGroupPlan {
  Name
  Status
  Requester
}

entity "Endpoint" as Endpoint {
  ClientID
  Status
  ConnectionType
  ManagingOrganization
}

entity "Execution Order" as ExecutionOrder {
  Identifier
  PatientInstruction
  Schedule
  Requester
}

entity "Task" as Task #FFE7CC {
  Identifier
  Status
  Priority
  Description
  ExecutionPeriod
  AuthoredOn
  LastModified
  Requester
  Owner
}

DigitalActivity --> Endpoint : Endpoint
Task --> DigitalActivity : DigitalActivity
Task --> DigitalGroupPlan : GroupPlan
Task --> ExecutionOrder : ExecutionOrder
@enduml

</plantuml>

*Diagram 1: Overview of the logical models and their relations.*
