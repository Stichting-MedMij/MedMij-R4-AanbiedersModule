---
topic: ProviderTasksSequence
---

<plantuml>

@startuml
scale max 900 width
skinparam shadowing false
skinparam maxMessageSize 200
skinparam defaultFontName Segoe UI
skinparam sequence {
  ArrowColor #4A78B5
  LifeLineBorderColor #4A78B5
  ParticipantBorderColor #4A78B5
  ParticipantBackgroundColor #F4F9FF
  ParticipantFontColor #1B2A4A
  ActorBorderColor #4A78B5
  ActorBackgroundColor #FFE7CC
}
autonumber "<b>0."

actor Patient
participant PHR
participant "Module\nsystem" as MOD
participant "XIS\n(source system)" as XIS
actor "Healthcare\nprovider" as HP

== Setup (healthcare provider assigns a module) ==
HP -> XIS : Create pt-DigitalGroupPlan (module),\npt-Task(s), optional pt-ExecutionOrder,\nlink ext-DigitalActivity -> pt-DigitalActivity

== Retrieve task list (PULL) ==
Patient -> PHR : Open task list
PHR -> XIS : GET [base]/Task?_tag=...providertasks\n&_include=Task:based-on&_include=Task:focus\n&_include=Task:digitalActivity
XIS --> PHR : searchset Bundle\n(Task + ServiceRequests + ActivityDefinition\n[+ Endpoint])
opt Endpoint not included in Bundle
  PHR -> XIS : GET [base]/Endpoint/[id]
  XIS --> PHR : pt-Endpoint
end
PHR -> Patient : Show tasks grouped by Task.basedOn

== Launch activity ==
Patient -> PHR : Start digital activity
PHR -> MOD : SMART App Launch\n(using pt-DigitalActivity + Endpoint.address)
Patient -> MOD : Perform the activity

== Update task status ==
MOD -> XIS : PATCH [base]/Task/[id]\n(Task.status = completed)
XIS --> MOD : 200 OK

== Refresh task list ==
PHR -> XIS : GET [base]/Task?_lastUpdated=ge[lastSync]
XIS --> PHR : searchset Bundle (updated Tasks)
PHR -> Patient : Show updated status
@enduml

</plantuml>
