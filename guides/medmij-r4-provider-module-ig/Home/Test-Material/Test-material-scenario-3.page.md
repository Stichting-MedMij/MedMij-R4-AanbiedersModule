# Scenario 3

This scenario describes the digital care module *Digitale zorgmodule COPD* that *Huisartsenpraktijk de Haard* assigns to patient *Sanne van Dijk*. The module consists of four reusable digital activities (two information items, one questionnaire and home oxygen-saturation measurements) which together result in 10 patient-facing tasks. The patient performs the activities via an external module (HinqZNO), launched from the PGO.

In contrast to scenarios 1 and 2, this scenario does **not** include a separate execution order. The home oxygen-saturation measurements are modelled as one task per measurement, scheduled directly via each task's `executionPeriod`. This represents the modelling alternative where there are no additional patient-specific instructions beyond what is captured per task.

The corresponding FHIR test resources are available in the [examples folder](https://github.com/Stichting-MedMij/MedMij-R4-AanbiedersModule/tree/main/examples) and have IDs starting with `ProviderTasks-`.

## Patient data

| | |
| --- | --- |
| Name.GivenName (official) | Sanne (qualifier 'BR' – call name) |
| Name.GivenName (usual / call name) | Sanne |
| Name.FamilyName.Prefix | van |
| Name.FamilyName.LastName | Dijk |
| Gender | Vrouw (code 'F' from code system 'http://terminology.hl7.org/CodeSystem/v3-AdministrativeGender') |
| BirthDate | 14-03-1984 |
| Deceased | No |
| Nationality | Nederlandse (code '0001' from code system 'urn:oid:2.16.840.1.113883.2.4.4.16.32') |
| Address.AddressType | Primary home (code 'HP' from code system 'http://terminology.hl7.org/CodeSystem/v3-AddressUse') |
| Address.Street | Prinsengracht |
| Address.HouseNumber | 263 |
| Address.PostalCode | 1016 GV |
| Address.City | Amsterdam |
| Address.Country | Nederland (code 'NL' from code system 'urn:iso:std:iso:3166') |
| ContactInformation.TelephoneNumber | +31655501234 (mobile contact, code 'MC' from code system 'http://terminology.hl7.org/CodeSystem/v3-AddressUse') |
| ContactInformation.EmailAddress | sanne.vandijk@voorbeeldmail.nl (home) |
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

One healthcare professional is involved in this scenario. *M. van Rijn* initiates the digital care module (digital group plan) and is the requester of all individual tasks.

| | |
| --- | --- |
| Name.Initials | M. (qualifier 'IN') |
| Name.FamilyName.Prefix | van |
| Name.FamilyName.LastName | Rijn |
| HealthProfessionalIdentificationNumber (BIG) | 19078234 (in identifier system 'http://fhir.nl/fhir/NamingSystem/big') |
| Specialty | Huisarts, apotheekhoudend (code '0110' from code system 'urn:oid:2.16.840.1.113883.2.4.6.7') |
| Organization | Huisartsenpraktijk de Haard |
| ContactInformation.TelephoneNumber | +31655506789 (work) |
| ContactInformation.EmailAddress | m.vanrijn@huisartspraktijk-example.nl (work) |

## Service request data – Digital group plan

The digital group plan groups all tasks belonging to the same digital care module. Its name ('Digitale zorgmodule COPD') is used as the group label in the PGO task list.

| | |
| --- | --- |
| Identifier | 2025-33344555 (in identifier system 'http://hing.zno.com/servicerequest/id') |
| Name (group label) | Digitale zorgmodule COPD |
| Status | active |
| Intent | plan |
| Subject | Sanne van Dijk |
| Requester | M. van Rijn, Huisarts |

## Service request data – Execution order

This scenario does **not** include a separate execution order. Each individual measurement task carries its own `executionPeriod` (one date per task), and there are no additional patient-specific instructions beyond what is captured per task. Consequently, none of the tasks reference an execution order through `focus`.

## Activity definition data

The COPD module references four reusable digital activities. All four activities are published by HinqZNO and reference the same launch endpoint (see [Endpoint data](#endpoint-data)).

| Title | Status | Publisher | Description | Timing |
| --- | --- | --- | --- | --- |
| Saturatiemeting | active | HinqZNO | Saturatiemeting volgens NHG protocol. 1 week, 1x per dag | 1x per dag gedurende 7 dagen |
| Instructiemodule inhalatiemedicatie | active | HinqZNO | Instructiemodule inhalatiemedicatie: juiste inhalatietechniek, therapietrouw en praktische adviezen (inclusief controlepunten en veelgemaakte fouten). | – |
| Informatie over leven met COPD | active | HinqZNO | Informatieve module voor patiënt: leven met COPD, inclusief inhalatiegebruik, energieverdeling, beweging en omgaan met benauwdheid. | – |
| Vragenlijst: Wat wilt u bereiken? | active | HinqZNO | Vragenlijst Wat wilt u bereiken? om patiëntdoelen en prioriteiten in kaart te brengen als basis voor gezamenlijke besluitvorming en het behandel-/zelfmanagementplan. | – |

## Endpoint data

The endpoint is used to launch the external module (HinqZNO) for executing the digital activity.

| | |
| --- | --- |
| Status | active |
| ConnectionType | hl7-fhir-rest (code system 'http://terminology.hl7.org/CodeSystem/endpoint-connection-type') |
| ManagingOrganization | Huisartsenpraktijk de Haard |
| ClientID | dvaAanbiedertakensweb |
| PayloadType | any (code system 'http://terminology.hl7.org/CodeSystem/endpoint-payload-type') |
| Address (launch URL) | https://module.test.5im.nl/web/api/smartonfhir/launch |

## Task data

The COPD module results in **10 patient-facing tasks**, all assigned to *Sanne van Dijk* and grouped under the digital group plan *Digitale zorgmodule COPD*. All tasks have priority `routine`, intent `order` and requester *M. van Rijn, Huisarts*.

The three task types (information, questionnaire and measurement) cover the three categories of digital activities described in the {{pagelink: FO, text: functional design}}.

### Information tasks

Two information tasks. The patient is not required to launch the module on a specific date; the entire execution period is available.

| Identifier | ActivityDefinition | Description | Status | ExecutionPeriod | LastModified |
| --- | --- | --- | --- | --- | --- |
| TASK-1673834 | Informatie over leven met COPD | Lees de praktische tips om met COPD te leven. | received | 05-01-2025 t/m 11-01-2025 | 23-12-2025 07:00 |
| TASK-983823471 | Instructiemodule inhalatiemedicatie | Lees hoe je inhalatiemedicatie thuis goed gebruikt. | requested | 05-01-2025 t/m 11-01-2025 | 24-12-2025 07:00 |

### Questionnaire task

One questionnaire task on the patient's treatment goals. The task is open (status `requested`) and available during the entire execution period.

| Identifier | ActivityDefinition | Description | Status | ExecutionPeriod | LastModified |
| --- | --- | --- | --- | --- | --- |
| TASK-74745858 | Vragenlijst: Wat wilt u bereiken? | Beantwoord deze vragen over wat je belangrijk vindt en wat je wilt bereiken met je behandeling of begeleiding. | requested | 05-01-2025 t/m 11-01-2025 | 23-12-2025 18:00 |

### Measurement tasks (Saturatiemeting)

Seven oxygen-saturation measurement tasks, 1 per day during 7 consecutive days (05-01-2026 t/m 11-01-2026). All 7 tasks share the following properties:

| | |
| --- | --- |
| ActivityDefinition | Saturatiemeting |
| BasedOn (digital group plan) | Digitale zorgmodule COPD |
| Focus (execution order) | – (this scenario has no execution order) |
| Description | Je meet saturatie om te kijken hoeveel zuurstof er in je bloed zit. Dit zegt iets over hoe goed je longen en bloedsomloop functioneren. |
| Status | received |
| AuthoredOn / LastModified | 05-01-2026 08:00 |

The execution date per task is:

| Identifier | ExecutionPeriod |
| --- | --- |
| TASK-Saturatie-1 | 05-01-2026 |
| TASK-Saturatie-2 | 06-01-2026 |
| TASK-Saturatie-3 | 07-01-2026 |
| TASK-Saturatie-4 | 08-01-2026 |
| TASK-Saturatie-5 | 09-01-2026 |
| TASK-Saturatie-6 | 10-01-2026 |
| TASK-Saturatie-7 | 11-01-2026 |

> Notes:
> - None of the 10 tasks in this scenario carry a `focus` reference, because there is no execution order. PGOs must therefore derive the schedule shown to the patient directly from each task's `executionPeriod`.
> - The two information tasks and the questionnaire task have an `executionPeriod` in **January 2025** while they were authored in **December 2025** (and the related measurement tasks are scheduled for January 2026). This makes the information/questionnaire tasks appear retroactively-dated relative to the measurement tasks. PGOs should still display the tasks exactly as supplied; tooling that depends on a temporal sort should remain stable in the presence of inconsistent date ranges.
