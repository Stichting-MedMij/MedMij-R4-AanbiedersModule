---
topic: TO
---

# FHIR IG

## Introduction
This Technical Design (TD) describes the technical implementation of the ProviderTasks (Aanbiedertaken) based on the {{pagelink: FO, text: Functional Design}} (FD). The TD is the technical counterpart of the FD and describes:
- the involved actors and systems;
- the FHIR profiles and resources to be used;
- the transactions (search/retrieve/update) including example queries;
- the workflow relationships between definitions, requests, and workflow items.

The FHIR version used for this IG is HL7 FHIR R4 (4.0.1).

This Technical Design is based on the [MedMij FHIR IG by Nictiz](https://informatiestandaarden.nictiz.nl/wiki/MedMij:IG:V1/FHIR_IG#Afsprakenstelsel). That document defines the overarching agreements for MedMij FHIR implementations, including the rules for the use of identifiers. Where this IG does not specify otherwise, the Nictiz guidelines apply.

## Workflow model
For this use case, the [HL7 Clinical Order Workflows IG (COW)](https://build.fhir.org/ig/HL7/fhir-cow-ig/en/index.html) has been used as the guiding framework. Clinical Order Workflows provides shared data models and coordination rules for Request-fulfilment workflows (e.g., order initiation, order grouping, status tracking and outcome sharing). The patterns and concepts in this Technical Design are aligned with the guidance from that IG.

### Definitions, Requests, and Events
The [FHIR R4 Workflow specification](https://hl7.org/fhir/R4/workflow.html#12.5.1.1) groups workflow-relevant resources into three categories: Definitions, Requests, and Events. The **Task** resource takes on characteristics of both Requests and Events (see the FHIR R4 Workflow specification, footnote ‡) and is therefore listed under both categories below.

- **Definitions:** reusable definitions of digital activities, primarily represented by the **ActivityDefinition** resource (for example, an ActivityDefinition that defines a questionnaire activity).
- **Requests:** patient-specific orders/requests indicating that something should be done. In this IG, two distinct Request resource types are used:
  - **ServiceRequest** — the clinical order, represented by two profiles in this IG:
    - `pt-ServiceRequest-DigitalGroupPlan` — the grouping item for related Tasks.
    - `pt-ServiceRequest-ExecutionOrder` — patient-specific execution details for a single activity.
  - **Task** — the patient-facing request to perform a digital activity. Task also carries Event characteristics; see the Events bullet below.
- **Events:** records of execution and results.
  - Clinical results produced by executing a digital activity (e.g., Observation, Procedure, QuestionnaireResponse) are **out of scope** for this IG.
  - The Event-side of the **Task** resource is in scope and is used to track execution progress and completion through `Task.status`.


### Relationships in ProviderTasks
- **ActivityDefinition (Definition):** describes the digital activity and provides generic, reusable information on what the activity is and how it should be used. If the activity is launchable, ActivityDefinition references one Endpoint that provides the technical access/launch details.
- **ServiceRequest – DigitalGroupPlan (Request):** the patient-specific clinical request that identifies which digital group plan/module is requested for the patient. It acts as the grouping item that ties related Tasks together and is referenced from each Task via `Task.basedOn`. The human-readable name of the digital group plan is carried in `ServiceRequest.code.text`.
- **ServiceRequest – ExecutionOrder (Request, optional):** the patient-specific execution plan for a single digital activity, containing scheduling (`occurrence[x]`) and `patientInstruction`. It is referenced from a Task via `Task.focus`. **Design rule:** whenever a recurring schedule applies to an activity, a `pt-ServiceRequest-ExecutionOrder` SHALL be present and the schedule SHALL be carried in `ServiceRequest.occurrence[x]` (typically `occurrenceTiming`).
- **Task (Request/Event):** the patient-facing workflow item shown in the PHR task list. Task is treated as a hybrid Request/Event resource per the FHIR R4 Workflow specification: it represents the request to perform a digital activity for the patient and at the same time carries the execution status of that activity. Each Task represents one digital activity and links to the `pt-ServiceRequest-DigitalGroupPlan` via `Task.basedOn` (grouping) and, when patient-specific execution details are needed, to a `pt-ServiceRequest-ExecutionOrder` via `Task.focus`.

### Grouping of Tasks
Tasks that belong to the same digital care module are grouped through a shared **ServiceRequest – DigitalGroupPlan**. There is no parent–child hierarchy between Tasks: 
- **Grouping mechanism:** every Task references the same `pt-ServiceRequest-DigitalGroupPlan` via `Task.basedOn`. All Tasks that share the same `Task.basedOn` reference belong to the same digital group plan and can be presented and filtered together in the PHR.
- **Group name:** the human-readable name of the digital group plan is carried in `ServiceRequest.code.text` of the referenced DigitalGroupPlan. This same name is used as the display label of the Task group in the PHR.
- **Link to definition:** each Task in the group still links to its own ActivityDefinition (via the Koppeltaal `instantiates` extension), which describes the specific digital activity to be launched or performed. Different Tasks within the same group MAY reference different ActivityDefinitions.

#### How to implement
- **Source system (XIS):**
  - When a healthcare professional starts a digital group plan/module for a patient, the source system creates **one** `pt-ServiceRequest-DigitalGroupPlan` instance and fills `ServiceRequest.code.text` with the (display) name of the digital group plan.
  - For each digital activity that is part of that group plan, the source system creates a `pt-Task` and sets `Task.basedOn` to the same `pt-ServiceRequest-DigitalGroupPlan`. This single shared reference is what groups the Tasks together.
  - When patient-specific scheduling and/or instructions are needed for an individual activity, the source system creates a `pt-ServiceRequest-ExecutionOrder` and references it from the corresponding Task via `Task.focus`. In particular, whenever a recurring schedule applies to the activity, a `pt-ServiceRequest-ExecutionOrder` SHALL be present and the schedule SHALL be placed in `ServiceRequest.occurrence[x]` (use `occurrenceTiming` for recurring schedules; use `occurrenceDateTime` or `occurrencePeriod` for single, non-recurring occurrences).
  - The generic activity content (what to launch or perform) is described in `pt-ActivityDefinition` and referenced from the Task via the Koppeltaal `instantiates` extension.
- **PHR system:**
  - The PHR retrieves Tasks via the PULL transaction and resolves the references on `Task.basedOn`, `Task.focus`, and the `instantiates` extension using the FHIR read interaction.
  - To display Tasks grouped per digital group plan, the PHR groups Tasks by the value of `Task.basedOn` (i.e., the reference to the same `pt-ServiceRequest-DigitalGroupPlan`) and uses `ServiceRequest.code.text` as the group label.
  - For each individual Task, the PHR uses the `pt-ActivityDefinition` for generic activity information and, when present, the `pt-ServiceRequest-ExecutionOrder` for the patient-specific scheduling and instructions. Any schedule for the activity, including a recurring schedule, is read exclusively from `ServiceRequest.occurrence[x]` on the ExecutionOrder.


## Actors involved

| Actor | Description | System | Role in exchange |
| --- | --- | --- | --- |
| Patient | Performs the digital activity | PHR/PGO | Retrieves tasks, launches activities, views status |
| Healthcare provider | Initiates digital activities for a patient | Source system (XIS) | Creates/maintains tasks (and optional ServiceRequest) |
| Module system | Delivers the digital activity | External module/application | Executes the activity after launch, triggers status updates |

## Boundaries and relationships
This IG covers use cases for exchanging task data between healthcare providers and patients (typically through a PHR).

This IG assumes that a PHR is able to connect with a source system. Requirements for infrastructure, security, authentication, and authorization are defined in the [MedMij Solution Design](https://changemanagement.medmij.nl/medmij-service-requests/actueel/v0-8-aanbiedermodules).

Each transaction is performed in the context of a specific authenticated patient, which has been established using the authentication mechanisms outlined in the MedMij Afsprakenstelsel (also see the MedMij FHIR IG by Nictiz), i.e. via an OAuth2 token. Each XIS gateway is required to perform filtering based on the patient associated with the context for the request, so only the records associated with the authenticated patient are returned. For this reason, search parameters for patient identification SHALL NOT be included.

Out of scope for this TD version:
- Exchange of clinical results produced by executing the activity (Event resources such as Observation or QuestionnaireResponse).

## Use cases

### Overview
The healthcare provider initiates a digital activity for the patient. The patient retrieves the task list in the PHR, starts (launches) the digital activity, performs it in an external application/module, and then sees task status updates in the PHR.

### Transactions
- PULL task list (PHR → source system): retrieve Task, including the links to the ActivityDefinition (`instantiates` extension), the `pt-ServiceRequest-DigitalGroupPlan` via `Task.basedOn`, and (when present) the `pt-ServiceRequest-ExecutionOrder` via `Task.focus`.
- LAUNCH (PHR → module system): start the external module/application using information from ActivityDefinition and referenced Endpoint.
- UPDATE status (Module system → source system): update `Task.status` to reflect progress and completion of the individual Task.

### Dataset
The dataset is specified in the Logical Models:
- LogicalModel {{pagelink: LogicalModelsIndex, text: Task, anchor: ptlmTask}}
- LogicalModel {{pagelink: LogicalModelsIndex, text: Activity, anchor: ptlmActivity}}
- LogicalModel {{pagelink: LogicalModelsIndex, text: ServiceRequest, anchor: ptlmServiceRequest}}

## Retrieve task list (PHR → Source System)
The PHR system requests task data using individual [search](https://hl7.org/fhir/R4/search.html) interactions. The task data exchange consists of multiple FHIR resources with specific constraints. These interactions are performed using an HTTP GET as shown below:

`GET [base]/[type]{?[parameters]}`

### PHR: request message
Goal: the patient retrieves open and (optionally) completed tasks, along with the related context required to display the task list and support launching the associated digital activity.

`GET [base]/Task?owner=Patient/[patient-id]`

#### Read operation
To resolve referenced resources (such as ActivityDefinition and ServiceRequest) from a retrieved Task, both the client and the server SHALL support the FHIR read interaction. The client follows the references in the Task and retrieves each referenced resource using `GET [base]/[type]/[id]`, so that the PHR can display the necessary context (e.g., generic activity information from ActivityDefinition and patient-specific instructions from ServiceRequest, when present). All resources referenced per literal reference SHALL be resolvable per the [MedMij FHIR IG by Nictiz](https://informatiestandaarden.nictiz.nl/wiki/MedMij:IG:V1/FHIR_IG#Including_referenced_resources).

### XIS: Response message
A Bundle containing Task resource(s) conforming to the `pt-Task` profile, including the references that allow the PHR to display and group the tasks:
- the referenced `pt-ServiceRequest-DigitalGroupPlan` via `Task.basedOn` (used to group the Tasks; the group display name is in `ServiceRequest.code.text`);
- the referenced `pt-ServiceRequest-ExecutionOrder` via `Task.focus` (when patient-specific execution details are present);
- the referenced `pt-ActivityDefinition` via the `instantiates` extension on the Task.

### Request last-updated
The PHR SHALL be able to retrieve only those Task resources that have been updated since a given point in time, to support efficient incremental refresh of the task list. This is done using the standard FHIR _lastUpdated search parameter (based on `meta.lastUpdated`). The PHR determines the time window itself (e.g., since last sync) and includes the desired date/time range in the search query, for example:

`GET [base]/Task?_lastUpdated=ge2025-11-14T14:58:33+00:00`

Optionally, the PHR/PGO can also provide an upper bound to restrict the period:

`GET [base]/Task?_lastUpdated=ge2026-01-01T00:00:00+01:00&_lastUpdated=le2026-01-31T23:59:59+01:00`

## Update Task status (module system → Source System)
This IG uses PATCH for partial updates of Task resources.

`PATCH [base]/Task/[id]`

Goal: write back progress/completion after the patient interacted with the activity (including after returning from the external module/application). Status updates apply to each individual Task; there is no main/subtask hierarchy.

### PATCH (partial update) for task updates
In addition to full updates (PUT), a source system SHALL support the FHIR PATCH interaction to update specific elements of an existing Task (e.g., changing `Task.status` without resending the entire resource). PATCH is defined in the FHIR RESTful API specification: https://hl7.org/fhir/R4/http.html#patch

#### FHIRPath Patch
In the FHIRPath Patch approach, the client sends a `Parameters` resource that contains one or more `operation` entries. Each operation specifies the patch type (e.g., `replace`), the FHIRPath path to update, and the new value. The following example uses FHIRPath Patch to replace the Task status by setting `Task.status` to `completed`:

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

#### JSON Patch
In the JSON Patch (RFC 6902) approach, the client sends a JSON array containing one or more operation objects. Each object specifies the operation type (e.g., replace), the JSON Pointer path to the element being updated, and the new value. The following example uses JSON Patch to replace the Task status by setting the /status element to completed:

HTTP request: 
PATCH [base]/Task/[id]
Content-Type: application/json-patch+json

```json
[
  {
    "op": "replace",
    "path": "/status",
    "value": "completed"
  }
]
```

## Launch (PGO → module system)
The launch is based on information in ActivityDefinition and Endpoint (e.g., endpoint.address). In the ProviderTasks this is the step where the PHR starts an external module/application.

The launch is an interaction outside the core REST data exchange and is based on SMART App Launch. The specifications can be found in the [MedMij Solution Design](https://changemanagement.medmij.nl/medmij-service-requests/actueel/v0-8-aanbiedermodules).


## Source system: example queries
The returned data to the PHR should conform to the profiles listed in the table below. The first four columns of the table list the provider module sections, the CIMs that constitute those sections and the provider module-specific content. The last column shows the FHIR search queries used to obtain the Provider Task information. These queries and expected responses are based on the profiles listed in the {{pagelink: FO, text: functional design}}.

<!DOCTYPE html>
<html lang="nl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Nette Tabel</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f4f4f4;
        }
        .monospace {
            font-family: monospace;
            font-size: 12px;
        }
    </style>
</head>
<body>

<table>
    <thead>
        <tr>
            <th>Description</th>
            <th>CIM NL</th>
            <th>HCIM EN</th>
            <th>FHIR Profile</th>
            <th>Search URL</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Retrieve task list</td>
            <td>Taak</td>
            <td>Task</td>
            <td><a href="" target="_blank">pt-Task</a></td>
            <td class="monospace">GET [base]/Task?owner=Patient/[patient-id]</td>
        </tr>
        <tr>
            <td>Retrieve digital activity</td>
            <td>Digitale activiteit</td>
            <td>ActivityDefinition</td>
            <td><a href="" target="_blank">pt-ActivityDefinition</a></td>
            <td class="monospace">See Task (resolved via the <code>instantiates</code> extension)</td>
        </tr>
        <tr>
            <td>Retrieve digital group plan</td>
            <td>Zorgopdracht (digitaal groepsplan)</td>
            <td>ServiceRequest (digital group plan)</td>
            <td><a href="" target="_blank">pt-ServiceRequest-DigitalGroupPlan</a></td>
            <td class="monospace">See Task (resolved via Task.basedOn)</td>
        </tr>
        <tr>
            <td>Retrieve patient-specific execution details</td>
            <td>Zorgopdracht (uitvoeringsopdracht)</td>
            <td>ServiceRequest (execution order)</td>
            <td><a href="" target="_blank">pt-ServiceRequest-ExecutionOrder</a></td>
            <td class="monospace">See Task (resolved via Task.focus)</td>
        </tr>
        <tr>
            <td>Retrieve launch endpoint</td>
            <td>Endpoint</td>
            <td>Endpoint</td>
            <td><a href="" target="_blank">pt-Endpoint</a></td>
            <td class="monospace">See ActivityDefinition (resolved via ActivityDefinition.endpoint)</td>
        </tr>
        <tr>
            <td>Update task status</td>
            <td>Taak</td>
            <td>Task</td>
            <td><a href="" target="_blank">pt-Task</a></td>
            <td class="monospace">PATCH [base]/Task/[id]</td>
        </tr>
        <tr>
            <td>Retrieve healthcare provider</td>
            <td>Zorgaanbieder</td>
            <td>HealthcareProvider</td>
            <td>
                <a href="https://simplifier.net/resolve?canonical=http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthcareProvider&scope=nictiz.fhir.nl.r4.nl-core@0.12.0-beta.4" target="_blank">nl-core-HealthcareProvider</a>,
                <a href="https://simplifier.net/resolve?canonical=http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthcareProvider-Organization&scope=nictiz.fhir.nl.r4.nl-core@0.12.0-beta.4" target="_blank">nl-core-HealthcareProvider-Organization</a>
            </td>
            <td class="monospace">See Task and ServiceRequest (resolved via Task.requester / ServiceRequest.requester &rarr; PractitionerRole.organization)</td>
        </tr>
        <tr>
            <td>Retrieve health professional</td>
            <td>Zorgverlener</td>
            <td>HealthProfessional</td>
            <td>
                <a href="https://simplifier.net/resolve?canonical=http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthProfessional-Practitioner&scope=nictiz.fhir.nl.r4.nl-core@0.12.0-beta.4" target="_blank">nl-core-HealthProfessional-Practitioner</a>,
                <a href="https://simplifier.net/resolve?canonical=http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthProfessional-PractitionerRole&scope=nictiz.fhir.nl.r4.nl-core@0.12.0-beta.4" target="_blank">nl-core-HealthProfessional-PractitionerRole</a>
            </td>
            <td class="monospace">See Task and ServiceRequest (resolved via Task.requester / ServiceRequest.requester)</td>
        </tr>
    </tbody>
</table>

</body>
</html>



