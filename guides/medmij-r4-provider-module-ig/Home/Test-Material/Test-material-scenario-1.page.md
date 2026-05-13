# Scenario 1

This scenario describes the digital care module *Digitale zorgmodule Diabetes* that *Huisartsenpraktijk de Haard* assigns to patient *Tom van Duinen*. The module consists of four reusable digital activities (two information items, one questionnaire and home blood-glucose measurements) which together result in 17 patient-facing tasks. The patient performs the activities via an external module (HinqZNO), launched from the PGO.

This scenario covers the full range of task statuses (`completed`, `cancelled`, `received`, `requested`) so that PGO behaviour for both open and finished tasks can be tested.

The corresponding FHIR test resources are available in the [examples folder](https://simplifier.net/medmij-r4-provider-module).

## Patient data

| | |
| --- | --- |
| Name.GivenName (official) | Tom (qualifier 'BR' – call name) |
| Name.GivenName (usual / call name) | Tom |
| Name.FamilyName.Prefix | van |
| Name.FamilyName.LastName | Duinen |
| Gender | Man (code 'M' from code system 'http://terminology.hl7.org/CodeSystem/v3-AdministrativeGender') |
| BirthDate | 02-08-1961 |
| Deceased | No |
| Nationality | Nederlandse (code '0001' from code system 'urn:oid:2.16.840.1.113883.2.4.4.16.32') |
| Address.AddressType | Primary home (code 'HP' from code system 'http://terminology.hl7.org/CodeSystem/v3-AddressUse') |
| Address.Street | Maanweg |
| Address.HouseNumber | 174 |
| Address.PostalCode | 2516 AB |
| Address.City | Den Haag |
| Address.Country | Nederland (code 'NL' from code system 'urn:iso:std:iso:3166') |
| ContactInformation.TelephoneNumber | +31612345600 (mobile contact, code 'MC' from code system 'http://terminology.hl7.org/CodeSystem/v3-AddressUse') |
| ContactInformation.EmailAddress | tomvanduinen@tom.com (home) |
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

One healthcare professional is involved in this scenario. *A. de Haard* initiates the digital care module (digital group plan), creates the patient-specific execution order and is the requester of all individual tasks.

| | |
| --- | --- |
| Name.Initials | A. (qualifier 'IN') |
| Name.FamilyName.Prefix | de |
| Name.FamilyName.LastName | Haard |
| HealthProfessionalIdentificationNumber (BIG) | 12070100 (in identifier system 'http://fhir.nl/fhir/NamingSystem/big') |
| Specialty | Huisarts, apotheekhoudend (code '0110' from code system 'urn:oid:2.16.840.1.113883.2.4.6.7') |
| Organization | Huisartsenpraktijk de Haard |
| ContactInformation.TelephoneNumber | +31612345600 (work) |
| ContactInformation.EmailAddress | dehaard@huisarts.nl (work) |

## Service request data – Digital group plan

The digital group plan groups all tasks belonging to the same digital care module. Its name ('Digitale zorgmodule Diabetes') is used as the group label in the PGO task list.

| | |
| --- | --- |
| Identifier | 2025-1111234 (in identifier system 'http://medrie/servicerequest/id') |
| Name (group label) | Digitale zorgmodule Diabetes |
| Status | active |
| Intent | plan |
| Subject | Tom van Duinen |
| Requester | A. de Haard, Huisarts |

## Service request data – Execution order

The execution order describes the patient-specific instruction and the (repeating) schedule for the home blood-glucose measurements. The PGO uses this order as the single source for the schedule shown to the patient. There is only one execution order in this scenario; the information items and the questionnaire are scheduled at activity level and do not have a separate execution order.

| | |
| --- | --- |
| Identifier | 2025-00001234 (in identifier system 'http://medrie/servicerequest/id') |
| Status | active |
| Intent | order |
| Subject | Tom van Duinen |
| PatientInstruction | Meet 7 dagen, 2 keer per dag, uw bloedglucose: nuchter vóór het ontbijt en vóór het avondeten. |
| Occurrence.Period | 22-12-2025 t/m 28-12-2025 |
| Occurrence.Frequency | 2 keer per dag |
| Requester | A. de Haard, Huisarts |

## Activity definition data

The Diabetes module references four reusable digital activities. All four activities are published by HinqZNO and reference the same launch endpoint (see [Endpoint data](#endpoint-data)).

| Title | Status | Publisher | Description | Timing |
| --- | --- | --- | --- | --- |
| Bloedglucose meting volgens NHG protocol | active | HinqZNO | Bloedglucose meting volgens NHG protocol. Duur: 1 week, 2x per dag | 1x per dag gedurende 7 dagen |
| Wat is diabetes type 2? | active | HinqZNO | Voorlichtingsmodule 'Wat is diabetes type 2?': basisuitleg over het ziektebeeld, oorzaken/risicofactoren, klachten, metingen (glucose/HbA1c) en behandelprincipes (leefstijl en medicatie) ter ondersteuning van educatie en zelfmanagement. | – |
| Gezonder gaan leven | active | HinqZNO | Leestips voor een gezondere leefstijl. | – |
| Vragenlijst over de woon- leefsituatie | active | HinqZNO | Vragenlijst woon-/leefsituatie binnen de digitale zorgmodule Diabetes om contextfactoren (wonen, dagelijks functioneren, ondersteuning, leefstijl en mogelijkheden/belemmeringen) in kaart te brengen als basis voor persoonsgerichte begeleiding en haalbare leefstijlafspraken. | – |

> Note: the patient-specific schedule for *Bloedglucose meting volgens NHG protocol* is taken from the execution order, not from the activity definition. The activity-level timing is informative for the healthcare professional only.

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

The Diabetes module results in **17 patient-facing tasks**, all assigned to *Tom van Duinen* and grouped under the digital group plan *Digitale zorgmodule Diabetes*. All tasks have priority `routine`, intent `order` and requester *A. de Haard, Huisarts*. The measurement tasks were authored on 22-12-2025; the other tasks have their own authoring dates (see below).

### Information tasks

Two information tasks. The patient is not required to launch the module on a specific date; the entire execution period (22-12-2025 t/m 28-12-2025) is available.

| Identifier | ActivityDefinition | Description | Status | LastModified |
| --- | --- | --- | --- | --- |
| TASK-Informatie-diabetes-12345 | Wat is diabetes type 2? | Lees wat diabetes type 2 is en wat je zelf kunt doen | received | 23-12-2025 07:00 |
| TASK-Informatie-Gezonderleven-6789 | Gezonder gaan leven | Lees tips voor een gezonder leven: voeding, bewegen en volhouden | requested | 24-12-2025 07:00 |

### Questionnaire task

One questionnaire task on the patient's living situation. The task is open (status `requested`) and available during the entire execution period (22-12-2025 t/m 28-12-2025).

| Identifier | ActivityDefinition | Description | Status | LastModified |
| --- | --- | --- | --- | --- |
| TASK-Vragenlijst-Woonsituatie-9642 | Vragenlijst over de woon- leefsituatie | Beantwoord deze vragen over je woon/leefsituatie | requested | 23-12-2025 18:00 |

### Measurement tasks (Bloedglucosemeting)

Fourteen blood-glucose measurement tasks, 2 per day during 7 consecutive days (22-12-2025 t/m 28-12-2025). All 14 tasks share the following properties:

| | |
| --- | --- |
| ActivityDefinition | Bloedglucose meting volgens NHG protocol |
| BasedOn (digital group plan) | Digitale zorgmodule Diabetes |
| Focus (execution order) | Uitvoeringsopdracht Bloedglucosemeting |
| AuthoredOn / LastModified | 22-12-2025 08:00 |

The execution date, status and description per task are:

| Identifier | ExecutionPeriod | Status | Description |
| --- | --- | --- | --- |
| TASK-Glucose-1 | 22-12-2025 (1st measurement) | completed | Je meet de bloeddruk om te controleren hoe goed het hart en de bloedvaten werken. |
| TASK-Glucose-2 | 22-12-2025 (2nd measurement) | completed | Je meet de bloeddruk om te controleren hoe goed het hart en de bloedvaten werken. |
| TASK-Glucose-3 | 23-12-2025 (1st measurement) | completed | Je meet de bloeddruk om te controleren hoe goed het hart en de bloedvaten werken. |
| TASK-Glucose-4 | 23-12-2025 (2nd measurement) | cancelled | Je meet de bloeddruk om te controleren hoe goed het hart en de bloedvaten werken. |
| TASK-Glucose-5 | 24-12-2025 (1st measurement) | received | Je meet de bloeddruk om te controleren hoe goed het hart en de bloedvaten werken. |
| TASK-Glucose-6 | 24-12-2025 (2nd measurement) | received | Deze meting helpt om inzicht te krijgen in de bloedsuikerspiegel. |
| TASK-Glucose-7 | 25-12-2025 (1st measurement) | received | Deze meting helpt om inzicht te krijgen in de bloedsuikerspiegel. |
| TASK-Glucose-8 | 25-12-2025 (2nd measurement) | received | Deze meting helpt om inzicht te krijgen in de bloedsuikerspiegel. |
| TASK-Glucose-9 | 26-12-2025 (1st measurement) | received | Deze meting helpt om inzicht te krijgen in de bloedsuikerspiegel. |
| TASK-Glucose-10 | 26-12-2025 (2nd measurement) | received | Deze meting helpt om inzicht te krijgen in de bloedsuikerspiegel. |
| TASK-Glucose-11 | 27-12-2025 (1st measurement) | received | Deze meting helpt om inzicht te krijgen in de bloedsuikerspiegel. |
| TASK-Glucose-12 | 27-12-2025 (2nd measurement) | received | Deze meting helpt om inzicht te krijgen in de bloedsuikerspiegel. |
| TASK-Glucose-13 | 28-12-2025 (1st measurement) | received | Deze meting helpt om inzicht te krijgen in de bloedsuikerspiegel. |
| TASK-Glucose-14 | 28-12-2025 (2nd measurement) | received | Deze meting helpt om inzicht te krijgen in de bloedsuikerspiegel. |

> Notes:
> - Tasks 1–5 reuse a description from the blood-pressure activity ("Je meet de bloeddruk …"). This is an intentional inconsistency in the test data to verify that PGOs render the task description exactly as it is supplied, without substituting their own text.
> - Tasks 1–3 illustrate completed tasks, task 4 illustrates a cancelled task, and tasks 5–14 illustrate still-open ('received') tasks. PGOs must be able to render the full mix in a single overview.
> - Task 14 has no `focus` reference to the execution order, to verify that PGOs degrade gracefully when an individual task is missing its link to the execution order. All other measurement tasks reference the execution order through `focus`.
