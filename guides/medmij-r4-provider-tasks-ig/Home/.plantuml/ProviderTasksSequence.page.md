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

== Setup ==
note over XIS
  pt-DigitalActivity (+ pt-Endpoint) is generic and
  patient-independent: defined once and reused
end note
HP -> XIS : Assign a digital care module to the patient:\ncreate pt-DigitalGroupPlan, pt-Task(s) tagged\n//urn:oid:2.16.528.1.1023.5.6//, optional pt-ExecutionOrder

== Retrieve task list (PULL) ==
Patient -> PHR : Open task list
PHR -> XIS : GET [base]/Task?_tag=...|urn:oid:2.16.528.1.1023.5.6\n&_include=Task:based-on&_include=Task:focus\n&_include=Task:digital-activity
XIS --> PHR : 200 OK, searchset Bundle\n(Task + ServiceRequest(s) + ActivityDefinition\n[+ Endpoint, + requester resources])
opt referenced resource not included in the Bundle
  PHR -> XIS : GET [base]/[type]/[id]\n(e.g. Endpoint, ActivityDefinition)
  XIS --> PHR : 200 OK, referenced resource
end
PHR -> Patient : Show tasks grouped by Task.basedOn

== Launch activity ==
Patient -> PHR : Start digital activity
PHR -> MOD : SMART App Launch\n(Endpoint.address; Task id in launch context)
MOD -> XIS : GET [base]/Task/[id]
XIS --> MOD : 200 OK, pt-Task
Patient -> MOD : Perform the activity

== Update task status ==
MOD -> XIS : PATCH [base]/Task/[id]\n(Task.status = in-progress / completed)
XIS --> MOD : 200 OK

== Refresh task list ==
PHR -> XIS : GET [base]/Task?_tag=...|urn:oid:2.16.528.1.1023.5.6\n&_lastUpdated=ge[last sync]
XIS --> PHR : 200 OK, searchset Bundle (changed Tasks)
PHR -> Patient : Show updated status
@enduml

</plantuml>
