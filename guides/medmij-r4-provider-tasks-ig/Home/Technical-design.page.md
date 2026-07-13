---
topic: TO
---

# Technical design

## Introduction

- This technical design provides the technical specification of the Provider Tasks (Dutch: Aanbiedertaken) standard.
- This technical design is the technical counterpart of the {{pagelink: FO, text: functional design}}. The FHIR version used for this IG is R4 (4.0.1).
- Note that in addition to this design, the (technical) guidelines as specified in the [MedMij FHIR IG by Nictiz](https://informatiestandaarden.nictiz.nl/wiki/MedMij:IG:V1/FHIR_IG#Afsprakenstelsel) apply.

## Workflow model

For this use case, the [HL7 Clinical Order Workflows IG](https://build.fhir.org/ig/HL7/fhir-cow-ig/en/index.html) has been used as the guiding framework (see the {{pagelink: Dependencies, text: Dependencies}} page for the package version). Clinical Order Worklflows provides shared data models and coordination rules for request-fulfillment workflows. The resource relationships below are aligned with the [FHIR R4 Workflow specification](https://hl7.org/fhir/R4/workflow.html).

### Resource relationships

- **ActivityDefinition (`pt-DigitalActivity`):** reusable definition of a digital activity. When the activity is launchable, the profile references one or more Endpoints that provide technical access/launch details.
- **ServiceRequest – DigitalGroupPlan (`pt-DigitalGroupPlan`):** patient-specific clinical request that identifies which digital group plan/module is requested for the patient. It groups related Tasks via `Task.basedOn`. The human-readable name of the digital group plan is carried in `ServiceRequest.code.text`.
- **ServiceRequest – ExecutionOrder (`pt-ExecutionOrder`, optional):** patient-specific execution plan for a single digital activity, containing scheduling (`occurrence[x]`) and `patientInstruction`. Referenced from a Task via `Task.focus`. Whenever a recurring schedule applies to an activity, a `pt-ExecutionOrder` SHALL be present and the schedule SHALL be carried in `ServiceRequest.occurrence[x]` (typically `occurrenceTiming`).
- **Task (`pt-Task`):** patient-facing workflow item shown in the PHR task list. Each Task represents one digital activity and links to `pt-DigitalGroupPlan` via `Task.basedOn` and, when patient-specific execution details are needed, to `pt-ExecutionOrder` via `Task.focus`. The digital activity definition is referenced via the MedMij `ext-DigitalActivity` extension.

Tasks that belong to the same digital care module share a `pt-DigitalGroupPlan` reference on `Task.basedOn`; there is no parent–child hierarchy between Tasks. The group display label is taken from `ServiceRequest.code.text` on the shared DigitalGroupPlan.

#### Implementation guidance
This technical design covers use cases for exchanging task data between healthcare providers and patients in a PHR setting.

**source system**

- When a healthcare professional starts a digital group plan/module for a patient, create one `pt-DigitalGroupPlan` and set `ServiceRequest.code.text` to the display name of the digital group plan.
- For each digital activity in that group plan, create a `pt-Task` with `Task.basedOn` pointing to the same `pt-DigitalGroupPlan`.
- When patient-specific scheduling and/or instructions are needed, create a `pt-ExecutionOrder` and reference it from the corresponding Task via `Task.focus`. Use `occurrenceTiming` for recurring schedules; use `occurrenceDateTime` or `occurrencePeriod` for single occurrences.
- Reference the generic activity content in `pt-DigitalActivity` from the Task via the `ext-DigitalActivity` extension.

**PHR**

- Retrieve Tasks via search and resolve references on `Task.basedOn`, `Task.focus`, and `ext-DigitalActivity` (via included resources in the response Bundle and/or the FHIR read interaction).
- Group Tasks by `Task.basedOn` and use `ServiceRequest.code.text` as the group label.
- For each Task, use `pt-DigitalActivity` for generic activity information and, when present, `pt-ExecutionOrder` for patient-specific scheduling and instructions.

## Actors and transactions

| Actor | Description | System | Role in exchange | FHIR CapabilityStatement |
| --- | --- | --- | --- | --- |
| Patient | Performs the digital activity | PHR | Retrieves tasks, launches activities, views status | [pt-Task-Retrieve](http://medmij.nl/fhir/CapabilityStatement/pt-Task-Retrieve) |
| Healthcare provider | Initiates digital activities for a patient | source system (XIS) | Creates/maintains tasks and clinical orders | [pt-Task-Serve](http://medmij.nl/fhir/CapabilityStatement/pt-Task-Serve) |
| — | Delivers the digital activity | module system | Executes the activity after launch, triggers status updates | — |

**Table 1: Actors, systems and FHIR CapabilityStatements**

- For each concept in these Logical Models, an id is assigned by MedMij. These ids are also added as mappings in the FHIR profiles on the corresponding elements, i.e. by specifying `.mapping.map` on each element accordingly. Therefore, these ids form the linking pin between the Logical Models and FHIR profiles. If no such mapping is possible for a certain element in a FHIR profile, guidance is provided to indicate how that element should be handled.
- nl-core profiles from the nictiz.fhir.nl.r4.nl-core package are used where applicable (for example, to resolve requester information).

| Logical Model | FHIR resource | FHIR profile |
| --- | --- | --- |
| {{pagelink: LogicalModelsIndex, text: Task, anchor: ptlmTask}} | Task | pt-Task |
| {{pagelink: LogicalModelsIndex, text: Activity, anchor: ptlmActivity}} | ActivityDefinition | pt-DigitalActivity |
| Digital group plan | ServiceRequest | pt-DigitalGroupPlan |
| Execution order | ServiceRequest | pt-ExecutionOrder |
| {{pagelink: LogicalModelsIndex, text: Endpoint, anchor: ptlmEndpoint}} | Endpoint | pt-Endpoint |

**Table 2: Mapping between Logical Models and FHIR profiles**

## Boundaries and relationships

This IG covers use cases for exchanging task data between healthcare providers and patients via a PHR.

This IG assumes that a PHR is able to connect with a source system. Requirements for infrastructure, security, authentication, and authorization are defined in the [MedMij Solution Design](https://changemanagement.medmij.nl/medmij-service-requests/actueel/v0-8-aanbiedermodules). Where this IG does not specify otherwise, the [MedMij FHIR IG by Nictiz](https://informatiestandaarden.nictiz.nl/wiki/MedMij:IG:V1/FHIR_IG) applies, including the rules for the use of identifiers and referenced resources.

Each transaction is performed in the context of a specific authenticated patient, established using the authentication mechanisms outlined in the MedMij Afsprakenstelsel (also see the MedMij FHIR IG by Nictiz), i.e. via an OAuth2 token. Each XIS gateway is required to perform filtering based on the patient associated with the context for the request, so only the records associated with the authenticated patient are returned. For this reason, search parameters for patient identification SHALL NOT be included.

Out of scope for this technical design:
- Exchange of clinical results produced by executing the activity (Event resources such as Observation or QuestionnaireResponse).

## Use case: Provider Tasks

The healthcare provider initiates digital activities for the patient. The patient retrieves the task list in the PHR, starts (launches) the digital activity, performs it in an external module system, and then sees task status updates in the PHR.

**Goal:** the patient retrieves open and (optionally) completed tasks, along with the related context required to display the task list, group related tasks, and support launching the associated digital activity. After interacting with an activity, the module system writes back task progress/completion to the source system.

### Actors

| Transaction group | Transaction | Actor | Role |
| --- | --- | --- | --- |
| Retrieve task list (PULL) | Search/read task data | Patient (using a PHR) | Retrieves tasks and related context from the source system |
| Retrieve task list (PULL) | Serve task data | Healthcare provider (using a source system) | Returns tasks and related context to the PHR |
| Update task status | PATCH task | module system | Updates `Task.status` after activity interaction |
| Update task status | Accept PATCH | Healthcare provider (using a source system) | Persists task status updates |
| Launch | Start external module | Patient (using a PHR) | Launches the digital activity in a module system |

**Table 2: Transactions within the Provider Tasks use case**

| Transaction group | Transaction | Actor | System role |
| --- | --- | --- | --- |
| Provider Tasks (PULL) | Retrieve task list | Patient (using a PHR) | pt-Task-Retrieve |
| Provider Tasks (PULL) | Serve task list | Healthcare provider (using a XIS) | pt-Task-Serve |
| Provider Tasks (PATCH) | Update task status | module system | Client |
| Provider Tasks (PATCH) | Accept task status update | Healthcare provider (using a XIS) | pt-Task-Serve |
| Launch | Start external module | Patient (using a PHR) | — |

**Table 3: Transactions within use case Provider Tasks**

The PHR executes an HTTP search conform the FHIR specification against the Task endpoint of the source system using the following URL:

```
GET [base]/Task
```

**Provider Tasks identification.** Tasks in scope for this information standard SHALL be distinguishable from Tasks used in other contexts. The recommended approach (pending confirmation on Zulip) is to tag Provider Tasks resources using `meta.tag` with system `http://medmij.nl/fhir/CodeSystem/information-standard` and code `providertasks`, and to include a corresponding `_tag` search parameter in the request above.

**Included references.** To retrieve referenced resources together with the Task search results, the PHR SHOULD use `_include` for references with core search parameters:

```
GET [base]/Task?owner=Patient/[patient-id]&_tag=http://medmij.nl/fhir/CodeSystem/information-standard|providertasks&_include=Task:based-on&_include=Task:focus
```

For the digital activity reference carried in the `ext-DigitalActivity` extension, a custom SearchParameter would be required to support `_include`. Until such a SearchParameter is defined, the source system SHOULD include the referenced `pt-DigitalActivity` (and, when applicable, `pt-Endpoint`) resources in the search response Bundle.

**Supported search parameters**

| Description | FHIR search parameter | Examples |
| --- | --- | --- |
| Filter Tasks belonging to the Provider Tasks information standard | `_tag` | `GET [base]/Task?_tag=…` (see example below) |
| Retrieve only Tasks updated since a given point in time | `_lastUpdated` | `GET [base]/Task?_lastUpdated=ge2025-11-14T14:58:33+00:00` |
| Include the digital group plan on which the Task is based | `_include=Task:based-on` | `GET [base]/Task?_include=Task:based-on` |
| Include the execution order referenced from the Task | `_include=Task:focus` | `GET [base]/Task?_include=Task:focus` |

**Table 4: Supported search parameters**

Referenced resources such as `pt-DigitalActivity`, `pt-DigitalGroupPlan`, `pt-ExecutionOrder`, `pt-Endpoint`, and nl-core resources used for requester resolution (Practitioner, PractitionerRole, Organization) need to be available to the PHR.

Per the [MedMij FHIR IG pattern for including referenced resources](https://informatiestandaarden.nictiz.nl/wiki/MedMij:IG:V1/FHIR_IG#Including_referenced_resources), the source system MAY include referenced resources directly in the search response Bundle. When referenced resources are not included, the PHR SHALL retrieve them using the FHIR read interaction (`GET [base]/[type]/[id]`) for at least:

- ActivityDefinition (`pt-DigitalActivity`)
- ServiceRequest (`pt-DigitalGroupPlan`, `pt-ExecutionOrder`)
- Endpoint (`pt-Endpoint`)

The PHR SHALL support read on these resource types. The source system SHALL support read on these resource types when it does not always include the referenced resources in the response Bundle.

##### Request last-updated

The PHR SHALL be able to retrieve only those Task resources that have been updated since a given point in time, to support efficient incremental refresh of the task list. This is done using the standard FHIR `_lastUpdated` search parameter ([specification](https://hl7.org/fhir/R4/search.html#lastUpdated)). The PHR determines the time window itself (e.g., since last sync) and includes the desired date/time range in the search query, for example:

```
GET [base]/Task?_lastUpdated=ge2025-11-14T14:58:33+00:00
```

The PHR MAY add an upper bound on `_lastUpdated` to restrict the period, for example:

```
GET [base]/Task?_lastUpdated=ge2026-01-01T00:00:00+01:00&_lastUpdated=le2026-01-31T23:59:59+01:00
```

For the digital activity reference in the `ext-DigitalActivity` extension, a custom SearchParameter would be required to support `_include`. Until such a SearchParameter is defined, the XIS SHOULD include the referenced `pt-DigitalActivity` (and, when applicable, `pt-Endpoint`) resources in the search response Bundle.

Per the [MedMij FHIR IG pattern for including referenced resources](https://informatiestandaarden.nictiz.nl/wiki/MedMij:IG:V1/FHIR_IG#Including_referenced_resources), the XIS MAY include referenced resources directly in the search response Bundle. When they are not included, the PHR SHALL retrieve them using the FHIR read interaction (`GET [base]/[type]/[id]`) for ActivityDefinition (`pt-DigitalActivity`), ServiceRequest (`pt-DigitalGroupPlan`, `pt-ExecutionOrder`), and Endpoint (`pt-Endpoint`). The PHR SHALL support read on these resource types. The XIS SHALL support read on these resource types when it does not always include the referenced resources in the response Bundle.

Referenced nl-core resources used for requester resolution (Practitioner, PractitionerRole, Organization) SHALL be resolvable per the MedMij FHIR IG by Nictiz.

##### XIS: response message

The XIS returns an HTTP Status code appropriate to the processing outcome and a Bundle with `Bundle.type` equal to _searchset_, including Task resources conforming to the `pt-Task` profile. The Bundle SHOULD also contain referenced `pt-DigitalGroupPlan`, `pt-ExecutionOrder`, and `pt-DigitalActivity` resources needed to display and group the tasks.

##### Module system: update task status

After the patient interacted with the activity, the module system updates task progress or completion on the XIS. Status updates apply to each individual Task.

```
PATCH [base]/Task/[id]
```

Both the module system (client) and the XIS (server) SHALL support the FHIR PATCH interaction to update specific elements of an existing Task (for example, `Task.status`). The XIS SHALL also support full updates (PUT). PATCH is defined in the [FHIR RESTful API specification](https://hl7.org/fhir/R4/http.html#patch).

**FHIRPath Patch**

The client sends a `Parameters` resource with one or more `operation` entries. Each operation specifies the patch type (e.g., `replace`), the FHIRPath path, and the new value. Example replacing `Task.status` with `completed`:

```json
{
  "resourceType": "Parameters",
  "parameter": [
    {
      "name": "operation",
      "part": [
        { "name": "type", "valueCode": "replace" },
        { "name": "path", "valueString": "Task.status" },
        { "name": "value", "valueCode": "completed" }
      ]
    }
  ]
}
```

**JSON Patch**

The client sends a JSON array of operation objects per [JSON Patch (RFC 6902)](https://datatracker.ietf.org/doc/html/rfc6902). Example:

```
PATCH [base]/Task/[id]
Content-Type: application/json-patch+json
```

```json
[
  {
    "op": "replace",
    "path": "/status",
    "value": "completed"
  }
]
```

#### PHR: launch activity

The launch is based on information in `pt-DigitalActivity` and `pt-Endpoint` (e.g., `Endpoint.address`). In Provider Tasks this is the step where the PHR starts an external module system.

The launch is an interaction outside the core REST data exchange and is based on SMART App Launch. The specifications can be found in the [Solution Design Aanbiedermodules v0.8](https://changemanagement.medmij.nl/medmij-service-requests/actueel/v0-8-aanbiedermodules) (see also the {{pagelink: Dependencies, text: Dependencies}} page).

The returned data to the PHR and the data exchanged with the module system SHALL conform to the profiles listed below. These requests are based on the profiles derived from the {{pagelink: LogicalModelsIndex, text: Logical Models}}.

| Description | CIM NL | HCIM EN | FHIR profile | Search URL |
| --- | --- | --- | --- | --- |
| Retrieve task list | Taak | Task | {{pagelink: FHIRProfilesIndex, text: pt-Task, anchor: ptTask}} | `GET [base]/Task?_tag=…` |
| Retrieve digital activity | Digitale activiteit | Digital Activity | pt-DigitalActivity | Resolved via `ext-DigitalActivity` on Task |
| Retrieve digital group plan | Digitaal groepsplan | Digital Group Plan | pt-DigitalGroupPlan | Resolved via `Task.basedOn` |
| Retrieve execution order | Uitvoeringsopdracht | Execution Order | pt-ExecutionOrder | Resolved via `Task.focus` |
| Retrieve launch endpoint | Endpoint | Endpoint | {{pagelink: FHIRProfilesIndex, text: pt-Endpoint, anchor: ptEndpoint}} | Resolved via endpoint reference on pt-DigitalActivity |
| Update task status | Taak | Task | {{pagelink: FHIRProfilesIndex, text: pt-Task, anchor: ptTask}} | `PATCH [base]/Task/[id]` |
| Retrieve healthcare provider | Zorgaanbieder | HealthcareProvider | [nl-core-HealthcareProvider](https://simplifier.net/resolve?canonical=http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthcareProvider&scope=nictiz.fhir.nl.r4.nl-core@0.12.0-beta.4), [nl-core-HealthcareProvider-Organization](https://simplifier.net/resolve?canonical=http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthcareProvider-Organization&scope=nictiz.fhir.nl.r4.nl-core@0.12.0-beta.4) | Resolved via `Task.requester` / `ServiceRequest.requester` → PractitionerRole.organization |
| Retrieve health professional | Zorgverlener | HealthProfessional | [nl-core-HealthProfessional-Practitioner](https://simplifier.net/resolve?canonical=http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthProfessional-Practitioner&scope=nictiz.fhir.nl.r4.nl-core@0.12.0-beta.4), [nl-core-HealthProfessional-PractitionerRole](https://simplifier.net/resolve?canonical=http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthProfessional-PractitionerRole&scope=nictiz.fhir.nl.r4.nl-core@0.12.0-beta.4) | Resolved via `Task.requester` / `ServiceRequest.requester` |

**Table 5: Overview of in-scope requests**
