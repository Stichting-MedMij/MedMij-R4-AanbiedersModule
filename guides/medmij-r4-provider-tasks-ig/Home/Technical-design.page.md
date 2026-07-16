---
topic: TO
---

# Technical design

## Introduction

This technical design provides the technical specification of the Provider Tasks (Dutch: Aanbiedertaken) standard.

This technical design is the technical counterpart of the {{pagelink: FO, text: functional design}}. The FHIR version used for this IG is R4 (4.0.1).

Note that in addition to this design, the (technical) guidelines as specified in the [MedMij R4 Core IG](https://simplifier.net/guide/medmij-r4-core-ig?version=1.0.1) and the [MedMij FHIR IG for R4](https://informatiestandaarden.nictiz.nl/wiki/MedMij:IG:V1/FHIR_IG) apply, the latter of which is published by Nictiz.

## Workflow model

For this use case, the [HL7 Clinical Order Workflows IG](https://build.fhir.org/ig/HL7/fhir-cow-ig/en/index.html) has been used as the guiding framework (see the {{pagelink: Dependencies, text: Dependencies}} page for the package version). Clinical Order Workflows provides shared data models and coordination rules for request-fulfillment workflows. Provider Tasks uses the FHIR R4 workflow resources `Task`, `ServiceRequest`, and `ActivityDefinition`. Their roles and relationships within this information standard are described below and follow the [FHIR R4 Workflow specification](https://hl7.org/fhir/R4/workflow.html).

## Actors involved

| Actor | | System | | FHIR CapabilityStatement | |
| --- | --- | --- | --- | --- | --- |
| **Name** | **Description** | **Name** | **Description** | **Name** | **Description** |
| Patient | The user of a personal healthcare environment | PHR | Personal health record | [pt-PHR](https://simplifier.net/medmij-r4-provider-tasks-develop/pt-phr) | FHIR client requirements |
| Healthcare provider | The user of a XIS | XIS | Healthcare information system | [pt-XIS](https://simplifier.net/medmij-r4-provider-tasks-develop/pt-xis) | FHIR server requirements |
| Patient | Delivers the digital activity | Provider module | Executes the digital activity after launch | [pt-ModuleSystem](https://simplifier.net/medmij-r4-provider-tasks-develop/pt-modulesystem) | FHIR client requirements |

**Table 1: Actors, systems and FHIR CapabilityStatements**

## Boundaries and relationships

This technical design includes use cases for exchanging task data between healthcare providers and patients via a PHR.

This technical design assumes that a PHR is able to make a connection to the right XIS that contains the patient's information. Requirements for infrastructure, security, authentication, and authorization are defined in the [MedMij Solution Design](https://changemanagement.medmij.nl/alpha-of-beta/v14/sd-aanbiedermodules). Each XIS gateway is required to perform filtering based on the patient associated with the context for the request, so only the records associated with the authenticated patient are returned. For this reason, search parameters for patient identification SHALL NOT be included.

Out of scope for this technical design:
- Exchange of clinical results produced by executing the activity (Event resources such as Observation or QuestionnaireResponse).

## <a name="relatingFHIR"></a> Relating FHIR (profiles) to its functional counterpart

The functional model of Provider Tasks is represented by {{pagelink: LogicalModelsIndex, text: Logical Models}}.
- For each concept in these Logical Models, an id is assigned by MedMij. These ids are also added as mappings in the FHIR profiles on the corresponding elements, i.e. by specifying `.mapping.map` on each element accordingly. Therefore, these ids form the linking pin between the Logical Models and FHIR profiles. If no such mapping is possible for a certain element in a FHIR profile, guidance is provided to indicate how that element should be handled.
- nl-core profiles from the [nictiz.fhir.nl.r4.nl-core](https://simplifier.net/packages/nictiz.fhir.nl.r4.nl-core/0.12.0-beta.4) package are used where applicable (for example, to resolve requester information).

| Logical Model | FHIR resource | FHIR profile |
| --- | --- | --- |
| {{pagelink: LogicalModelsIndex, text: Task, anchor: ptlmTask}} | Task | {{pagelink: FHIRProfilesIndex, text: pt-Task, anchor: ptTask}} |
| {{pagelink: LogicalModelsIndex, text: Digital activity, anchor: ptlmDigitalActivity}} | ActivityDefinition | {{pagelink: FHIRProfilesIndex, text: pt-DigitalActivity, anchor: ptDigitalActivity}} |
| {{pagelink: LogicalModelsIndex, text: Digital group plan, anchor: ptlmDigitalGroupPlan}} | ServiceRequest | {{pagelink: FHIRProfilesIndex, text: pt-DigitalGroupPlan, anchor: ptDigitalGroupPlan}} |
| {{pagelink: LogicalModelsIndex, text: Execution order, anchor: ptlmExecutionOrder}} | ServiceRequest | {{pagelink: FHIRProfilesIndex, text: pt-ExecutionOrder, anchor: ptExecutionOrder}} |
| {{pagelink: LogicalModelsIndex, text: Endpoint, anchor: ptlmEndpoint}} | Endpoint | {{pagelink: FHIRProfilesIndex, text: pt-Endpoint, anchor: ptEndpoint}} |

**Table 2: Mapping between Logical Models and FHIR profiles**

### Resource relationships

A `pt-Task` is one unit of work for one patient. Multiple Tasks may reference the same `pt-DigitalGroupPlan` and the same `pt-DigitalActivity`. There is no parent–child hierarchy between tasks. A task ties the other resources together through references:

| Reference on Task | Target | Purpose |
| --- | --- | --- |
| `Task.basedOn` | `pt-DigitalGroupPlan` (ServiceRequest) | Groups the Tasks of one digital care module; group label in `ServiceRequest.code.text` |
| `Task.focus` | `pt-ExecutionOrder` (ServiceRequest, optional) | Patient-specific scheduling (`occurrence[x]`) and `patientInstruction` |
| `ext-DigitalActivity` extension | `pt-DigitalActivity` (ActivityDefinition) | Generic activity definition; references `pt-Endpoint` when the activity is launchable |

**Table 3: References from `pt-Task`**

#### Implementation guidance

**Source system** 
Creates the resources when a healthcare professional assigns a digital care module to a patient:
- Create one `pt-DigitalGroupPlan` per module and set `ServiceRequest.code.text` to its display name.
- Create a `pt-Task` for each unit of work the patient must perform, with `Task.basedOn` to the group plan and `ext-DigitalActivity` to the matching `pt-DigitalActivity`. Multiple Tasks may point to the same group plan and the same digital activity.
- Create a `pt-ExecutionOrder` only when the activity needs patient-specific scheduling or instructions. Use `occurrenceTiming` for a recurring schedule, `occurrenceDateTime` or `occurrencePeriod` for a single occurrence. A recurring schedule SHALL use a `pt-ExecutionOrder`.

**Personal healthcare environment** 
Reads and displays the task list:
- Search Tasks and resolve `Task.basedOn`, `Task.focus`, and `ext-DigitalActivity` from the response Bundle or via a read interaction.
- Group Tasks by `Task.basedOn`, using `ServiceRequest.code.text` as the group label.
- Show `pt-DigitalActivity` for generic activity content and, when present, `pt-ExecutionOrder` for scheduling and instructions.

**Module system** 
Reports progress after the patient performs the activity:
- Update `Task.status` on the source system to reflect progress or completion.

## Use case: Provider Tasks

The healthcare provider initiates digital activities for the patient. The patient retrieves open and (optionally) completed tasks in the PHR. The patient starts (launches) the digital activity, performs it in an external module system, and then sees task status updates in the PHR after the module system writes back task progress/completion to the source system.

| Transaction group | Transaction | Actor | Role |
| --- | --- | --- | --- |
| Retrieve task list (PULL) | Retrieve task data | Patient (using a PHR) | Retrieves tasks and related context from the source system |
| Retrieve task list (PULL) | Serve task data | Healthcare provider (using a source system) | Returns tasks and related context to the PHR |
| Launch | Start external module | Patient (using a PHR) | Launches the digital activity in a module system |
| Update task | Update task | Module system | Updates `Task.status` after activity interaction |

**Table 4: Transactions within the Provider Tasks use case**

### PHR: request message

The PHR executes an HTTP search conform the [FHIR specification](https://hl7.org/fhir/R4/search.html) against the Task endpoint of the source system using the following URL:

```
GET [base]/Task{?[parameters]}
```

Here, `[parameters]` represents a series of encoded name-value pairs representing the filter for the query. Tasks in scope for this information standard are represented by Task resources where `.meta.tag` contains code *providertasks* from system *http://medmij.nl/fhir/CodeSystem/information-standard*, which distinguishes them from Tasks used in other contexts. Hence, the PHR SHALL always include the search parameter `_tag` with the appropriate value in their request, resulting in:

```
GET [base]/Task?_tag=http://medmij.nl/fhir/CodeSystem/information-standard|providertasks{&[additional parameters]}
```

**Included references.** To retrieve referenced resources together with the Task search results, the PHR SHOULD use `_include` for references with core search parameters:

```
GET [base]/Task?_tag=http://medmij.nl/fhir/CodeSystem/information-standard|providertasks&_include=Task:based-on&_include=Task:focus&_include=Task:digitalActivity
```

The digital activity reference is carried in the `ext-DigitalActivity` extension, which core FHIR search parameters cannot target. For this reason, a custom SearchParameter [`digitalActivity`](http://medmij.nl/fhir/SearchParameter/Task-digitalActivity) is defined so that `_include=Task:digitalActivity` can be used to retrieve the referenced `pt-DigitalActivity` together with the Task. Because `pt-Endpoint` is referenced from `pt-DigitalActivity` (and not directly from Task), it cannot be retrieved with a single-level `_include`; the source system SHOULD include the referenced `pt-Endpoint` resource(s) in the search response Bundle, or the PHR resolves them via a read interaction.

**Supported search parameters**

| Description | FHIR search parameter | Examples |
| --- | --- | --- |
| Filter Tasks belonging to the Provider Tasks information standard | `_tag` | `GET [base]/Task?_tag=http://medmij.nl/fhir/CodeSystem/information-standard\|providertasks` |
| Include the digital activity referenced from the Task | `_include=Task:digitalActivity` | `GET [base]/Task?_include=Task:digitalActivity` |
| Include the digital group plan on which the Task is based | `_include=Task:based-on` | `GET [base]/Task?_include=Task:based-on` |
| Include the execution order referenced from the Task | `_include=Task:focus` | `GET [base]/Task?_include=Task:focus` |

**Table 5: Supported search parameters**

Referenced resources such as `pt-DigitalActivity`, `pt-DigitalGroupPlan`, `pt-ExecutionOrder`, `pt-Endpoint`, and nl-core resources used for requester resolution (Practitioner, PractitionerRole, Organization) need to be available to the PHR.

Per the [MedMij FHIR IG pattern for including referenced resources](https://informatiestandaarden.nictiz.nl/wiki/MedMij:IG:V1/FHIR_IG#Including_referenced_resources), the source system MAY include referenced resources directly in the search response Bundle. When referenced resources are not included, the PHR SHALL retrieve them using the FHIR read interaction (`GET [base]/[type]/[id]`) for at least:

- ActivityDefinition (`pt-DigitalActivity`)
- ServiceRequest (`pt-DigitalGroupPlan`, `pt-ExecutionOrder`)
- Endpoint (`pt-Endpoint`)

The PHR SHALL support read on these resource types. The source system SHALL support read on these resource types when it does not always include the referenced resources in the response Bundle.

##### Module system: update task status

After the patient interacted with the activity, the module system updates task progress or completion on the XIS. Status updates apply to each individual Task.

```
PATCH [base]/Task/[id]
```

Both the module system (client) and the XIS (server) SHALL support the FHIR PATCH interaction to update specific elements of an existing Task (for example, `Task.status`). The XIS SHALL also support full updates (PUT). PATCH is defined in the [FHIR RESTful API specification](https://hl7.org/fhir/R4/http.html#patch).

**FHIRPath Patch**

The client sends a `Parameters` resource with one or more `operation` entries, conform the [FHIRPath Patch specification](http://hl7.org/fhir/R4/fhirpatch.html). Each operation specifies the patch type (e.g., `replace`), the FHIRPath path, and the new value. Example replacing `Task.status` with `completed`:

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

##### Request last-updated

The PHR SHALL be able to retrieve only those Task resources that have been updated since a given point in time, to support efficient incremental refresh of the task list. This is done using the standard FHIR `_lastUpdated` search parameter ([specification](https://hl7.org/fhir/R4/search.html#lastUpdated)). The PHR determines the time window itself (e.g., since last sync) and includes the desired date/time range in the search query, for example:

```
GET [base]/Task?_lastUpdated=ge2025-11-14T14:58:33+00:00
```

The PHR MAY add an upper bound on `_lastUpdated` to restrict the period, for example:

```
GET [base]/Task?_lastUpdated=ge2026-01-01T00:00:00+01:00&_lastUpdated=le2026-01-31T23:59:59+01:00
```

##### XIS: response message

The XIS returns an HTTP Status code appropriate to the processing outcome as well as a Bundle, with `Bundle.type` equal to *searchset*, including the resources matching the search query. The returned data to the PHR and the data exchanged with the module system SHALL conform to the profiles listed below.

| Description | CIM NL | HCIM EN | FHIR profile | Search URL |
| --- | --- | --- | --- | --- |
| Retrieve task list | Taak | Task | {{pagelink: FHIRProfilesIndex, text: pt-Task, anchor: ptTask}} | `GET [base]/Task?_tag=http://medmij.nl/fhir/CodeSystem/information-standard\|providertasks&_include=Task:based-on&_include=Task:focus&_include=Task:digitalActivity` |
| Retrieve digital activity | Digitale activiteit | Digital Activity |  {{pagelink: FHIRProfilesIndex, text: pt-DigitalActivity, anchor: ptDigitalActivity}} | `GET [base]/Task?_include=Task:digitalActivity` |
| Retrieve digital group plan | Digitaal groepsplan | Digital Group Plan | {{pagelink: FHIRProfilesIndex, text: pt-DigitalGroupPlan, anchor: ptDigitalGroupPlan}} | `GET [base]/Task?_include=Task:based-on` |
| Retrieve execution order | Uitvoeringsopdracht | Execution Order | {{pagelink: FHIRProfilesIndex, text: pt-ExecutionOrder, anchor: ptExecutionOrder}} | `GET [base]/Task?_include=Task:focus` |
| Retrieve launch endpoint | Endpoint | Endpoint | {{pagelink: FHIRProfilesIndex, text: pt-Endpoint, anchor: ptEndpoint}} | Resolved via endpoint reference on pt-DigitalActivity |
| Update task status | Taak | Task | {{pagelink: FHIRProfilesIndex, text: pt-Task, anchor: ptTask}} | `PATCH [base]/Task/[id]` |
| Retrieve healthcare provider | Zorgaanbieder | HealthcareProvider | [nl-core-HealthcareProvider](https://simplifier.net/resolve?canonical=http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthcareProvider&scope=nictiz.fhir.nl.r4.nl-core@0.12.0-beta.4) | Resolved via `Task.requester` / `ServiceRequest.requester` |
| Retrieve health professional | Zorgverlener | HealthProfessional | [nl-core-HealthProfessional-Practitioner](https://simplifier.net/resolve?canonical=http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthProfessional-Practitioner&scope=nictiz.fhir.nl.r4.nl-core@0.12.0-beta.4), [nl-core-HealthProfessional-PractitionerRole](https://simplifier.net/resolve?canonical=http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthProfessional-PractitionerRole&scope=nictiz.fhir.nl.r4.nl-core@0.12.0-beta.4) | Resolved via `Task.requester` / `ServiceRequest.requester` |

**Table 6: Overview of in-scope requests**

#### PHR: launch activity

The launch is based on information in `pt-DigitalActivity` and `pt-Endpoint` (e.g., `Endpoint.address`). In Provider Tasks this is the step where the PHR starts an external module system.

The launch is an interaction outside the core REST data exchange and is based on SMART App Launch. The specifications can be found in the [Solution Design Aanbiedermodules v0.8](https://changemanagement.medmij.nl/alpha-of-beta/v14/sd-aanbiedermodules) (see also the {{pagelink: Dependencies, text: Dependencies}} page).