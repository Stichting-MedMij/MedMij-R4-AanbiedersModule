# Scenario 2

This scenario describes the digital care module *Digitale zorgmodule CVRM* (cardiovasculair risicomanagement) that *Huisartsenpraktijk de Haard* assigns to patient *Koos de Groot*. The module consists of four reusable digital activities (two information items, one questionnaire and home blood-pressure measurements) which together result in 17 patient-facing tasks. The patient performs the activities via an external module (Minddistrict), launched from the PGO.

The corresponding FHIR test resources are available in the [examples folder](https://simplifier.net/medmij-r4-provider-module).

## Patient data

| | |
| --- | --- |
| Name.GivenName | Koos (qualifier 'BR' – call name) |
| Name.FamilyName.Prefix | de |
| Name.FamilyName.LastName | Groot |
| Gender | Man (code 'M' from code system 'http://terminology.hl7.org/CodeSystem/v3-AdministrativeGender') |
| BirthDate | 20-09-1972 |
| Deceased | No |
| Nationality | Nederlandse (code '0001' from code system 'urn:oid:2.16.840.1.113883.2.4.4.16.32') |
| Address.AddressType | Primary home (code 'HP' from code system 'http://terminology.hl7.org/CodeSystem/v3-AddressUse') |
| Address.Street | Spui |
| Address.HouseNumber | 70 |
| Address.PostalCode | 2511 BT |
| Address.City | Den Haag |
| Address.Country | Nederland (code 'NL' from code system 'urn:iso:std:iso:3166') |
| ContactInformation.TelephoneNumber | +31612345611 (mobile contact, code 'MC' from code system 'http://terminology.hl7.org/CodeSystem/v3-AddressUse') |
| ContactInformation.EmailAddress | koosdegrootn@koos.com (home) |
| PatientIdentificationNumber (BSN) | masked (in identifier system 'http://fhir.nl/fhir/NamingSystem/bsn') |

## Healthcare provider organisation data

| | |
| --- | --- |
| OrganizationName | Huisartsenpraktijk de Haard |
| OrganizationIdentificationNumber | 01010235 (in identifier system AGB-Z 'http://fhir.nl/fhir/NamingSystem/agb-z') |
| Address.AddressType | Work Place (code 'WP' from code system 'http://terminology.hl7.org/CodeSystem/v3-AddressUse') |
| Address.Street | Dr. Klinkertweg |
| Address.HouseNumber | 18 |
| Address.PostalCode | 8004 DB |
| Address.City | Zwolle |
| ContactInformation.TelephoneNumber | +31653603740 (work) |
| ContactInformation.EmailAddress | huisartsenpraktijk-dehaard@huisarts.nl (work) |

## Healthcare professional data

Two healthcare professionals are involved in this scenario. Both work for *Huisartsenpraktijk de Haard* and have the specialty 'Huisarts, apotheekhoudend' (code '0110' from code system 'urn:oid:2.16.840.1.113883.2.4.6.7'). A. de Haard initiates the digital care module (digital group plan); L. de Jong is the requester of the individual tasks and the execution order.

| | A. de Haard | L. de Jong |
| --- | --- | --- |
| Name.Initials | L. (qualifier 'IN') |
| Name.FamilyName.Prefix | de |
| Name.FamilyName.LastName | Jong |
| HealthProfessionalIdentificationNumber (BIG) | 28910456 (in identifier system 'http://fhir.nl/fhir/NamingSystem/big') |
| Specialty | Huisarts, apotheekhoudend (code '0110' from code system 'urn:oid:2.16.840.1.113883.2.4.6.7') |
| Organization | Huisartsenpraktijk de Haard | 
| ContactInformation.TelephoneNumber | +31655504321 (work) |
| ContactInformation.EmailAddress | l.dejong@huisartspraktijk-example.nl (work) |

## Service request data – Digital group plan

The digital group plan groups all tasks belonging to the same digital care module. Its name ('Digitale zorgmodule CVRM') is used as the group label in the PGO task list.

| | |
| --- | --- |
| Identifier | 2025-1111999 (in identifier system 'http://medrie/servicerequest/id') |
| Name (group label) | Digitale zorgmodule CVRM |
| Status | active |
| Intent | plan |
| Subject | Koos de Groot |
| Requester | A. de Haard, Huisarts |

## Service request data – Execution order

The execution order describes the patient-specific instruction and the (repeating) schedule for the home blood-pressure measurements. The PGO uses this order as the single source for the schedule shown to the patient. There is only one execution order in this scenario; the information items and the questionnaire are scheduled at activity level and do not have a separate execution order.

| | |
| --- | --- |
| Identifier | 2025-999999 (in identifier system 'http://medrie/servicerequest/id') |
| Status | active |
| Intent | order |
| Subject | Koos de Groot |
| PatientInstruction | Meet 7 dagen, 2 keer per dag, uw bloeddruk: nuchter vóór het ontbijt en vóór het avondeten. |
| Occurrence.Period | 22-12-2025 t/m 28-12-2025 |
| Occurrence.Frequency | 2 keer per dag |
| Requester | A. de Haard, Huisarts |

## Activity definition data

The CVRM module references four reusable digital activities. All four activities are published by Minddistrict and reference the same launch endpoint (see [Endpoint data](#endpoint-data)).

| Title | Status | Publisher | Description | Timing |
| --- | --- | --- | --- | --- |
| Bloeddrukmeting | active | Minddistrict | Bloeddrukmeting volgens NHG protocol. 1 week, 2x per dag, 's ochtends en 's avonds | 1x per dag gedurende 7 dagen |
| Wat is cholesterol en wat zijn de risico's? | active | Minddistrict | Voorlichtingsmodule cholesterol: uitlegmateriaal over wat cholesterol is, cardiovasculaire risico's en leefstijl-/behandelopties ter ondersteuning van CVRM en gezamenlijke besluitvorming. | – |
| Informatie over thuis bloeddruk meten | active | Minddistrict | Instructiemodule thuismetingen bloeddruk: patiëntinstructie voor correcte meetmethode (rust, houding, manchet, meetmomenten) en registratie, ter verbetering van betrouwbaarheid van thuismetingen | – |
| Vragenlijst over uw situatie op gebied van hart- en vaatziekten | active | Minddistrict | Vragenlijst 'Uw situatie' om relevante klachten, leefstijl en risicofactoren rond hart- en vaatziekten te inventariseren als basis voor behandelafspraken. | – |

> Note: the patient-specific schedule for *Bloeddrukmeting* is taken from the execution order, not from the activity definition. The activity-level timing is informative for the healthcare professional only.

## Endpoint data

The endpoint is used to launch the external module (Minddistrict) for executing the digital activity.

| | |
| --- | --- |
| Status | active |
| ConnectionType | hl7-fhir-rest (code system 'http://terminology.hl7.org/CodeSystem/endpoint-connection-type') |
| ManagingOrganization | Huisartsenpraktijk de Haard |
| ClientID | dvaAanbiedertaken |
| PayloadType | any (code system 'http://terminology.hl7.org/CodeSystem/endpoint-payload-type') |
| Address (launch URL) | https://aanbiedermodule.example.org/web/api/smartonfhir/launch?iss=resourceserver.example.dva.nl |

## Task data

The CVRM module results in **17 patient-facing tasks**, all assigned to *Koos de Groot* and grouped under the digital group plan *Digitale zorgmodule CVRM*. All tasks have priority `routine`, intent `order` and were authored by *L. de Jong, Huisarts* on 22-12-2025.

The three task types (information, questionnaire and measurement) cover the three categories of digital activities described in the {{pagelink: FO, text: functional design}}.

### Information tasks

Two information tasks. The patient is not required to launch the module on a specific date; the entire execution period (22-12-2025 t/m 28-12-2025) is available.

| Identifier | ActivityDefinition | Description | Status | LastModified |
| --- | --- | --- | --- | --- |
| TASK-Informatie-Cholesterol-1 | Wat is cholesterol en wat zijn de risico's? | Lees wat cholesterol is, welke risico's erbij horen en wat je kunt doen met leefstijl en/of medicijnen. | received | 23-12-2025 07:00 |
| TASK-Informatie-Bloeddruk-1 | Informatie over thuis bloeddruk meten | Lees deze informatie over hoe je thuis je bloeddruk kan meten. | requested | 24-12-2025 07:00 |

### Questionnaire task

One questionnaire task. In this scenario the task has status `failed` to illustrate how the PGO should present a task that could not be completed by the module system.

| Identifier | ActivityDefinition | Description | Status | LastModified |
| --- | --- | --- | --- | --- |
| TASK-Informatie-Situatie-1 | Vragenlijst over uw situatie op gebied van hart- en vaatziekten | Beantwoord deze vragen over jouw situatie rondom hart- en vaatziekten. | failed | 23-12-2025 18:00 |

### Measurement tasks (Bloeddrukmeting)

Fourteen blood-pressure measurement tasks, 2 per day during 7 consecutive days (22-12-2025 t/m 28-12-2025). All 14 tasks share the following properties:

| | |
| --- | --- |
| ActivityDefinition | Bloeddrukmeting |
| BasedOn (digital group plan) | Digitale zorgmodule CVRM |
| Focus (execution order) | Uitvoeringsopdracht Bloeddrukmeting |
| Description | Je meet de bloeddruk om te controleren hoe goed het hart en de bloedvaten werken. |
| Status | received |
| AuthoredOn / LastModified | 22-12-2025 08:00 |

The execution dates per task are:

| Identifier | ExecutionPeriod |
| --- | --- |
| TASK-Bloeddruk-1 | 22-12-2025 (1st measurement) |
| TASK-Bloeddruk-2 | 22-12-2025 (2nd measurement) |
| TASK-Bloeddruk-3 | 23-12-2025 (1st measurement) |
| TASK-Bloeddruk-4 | 23-12-2025 (2nd measurement) |
| TASK-Bloeddruk-5 | 24-12-2025 (1st measurement) |
| TASK-Bloeddruk-6 | 24-12-2025 (2nd measurement) |
| TASK-Bloeddruk-7 | 25-12-2025 (1st measurement) |
| TASK-Bloeddruk-8 | 25-12-2025 (2nd measurement) |
| TASK-Bloeddruk-9 | 26-12-2025 (1st measurement) |
| TASK-Bloeddruk-10 | 26-12-2025 (2nd measurement) |
| TASK-Bloeddruk-11 | 27-12-2025 (1st measurement) |
| TASK-Bloeddruk-12 | 27-12-2025 (2nd measurement) |
| TASK-Bloeddruk-13 | 28-12-2025 (1st measurement) |
| TASK-Bloeddruk-14 | 28-12-2025 (2nd measurement) |
