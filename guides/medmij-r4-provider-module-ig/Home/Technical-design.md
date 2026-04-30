---
topic: TO
---

# FHIR IG

## Introduction
This Technical Design (TD) describes the technical implementation of the ProviderTasks (Aanbiedertaken) based on the [Functional Design]() (FD). The TD is the technical counterpart of the FD and describes:
- the involved actors and systems;
- the FHIR profiles and resources to be used;
- the transactions (search/retrieve/update) including example queries;
- the workflow relationships between definitions, requests, and workflow items.

The FHIR version used for this IG is HL7 FHIR R4 (4.0.1).

## Workflow model
For this use case, the [HL7 Clinical Order Workflows IG (COW)](https://build.fhir.org/ig/HL7/fhir-cow-ig/en/index.html) has been used as the guiding framework. Clinical Order Workflows provides shared data models and coordination rules for Request-fulfilment workflows (e.g., order initiation, order grouping, status tracking and outcome sharing). The patterns and concepts in this Technical Design (such as the use of ServiceRequest as the grouping item for related Tasks, and the use of Task for tracking patient-facing execution and status) are aligned with the guidance from that IG.

### Definitions, Requests, and Events
- **Definitions:** reusable definitions of digital activities, primarily represented by the **ActivityDefinition** resource (for example, an ActivityDefinition that defines a questionnaire-based activity).
- **Requests:** patient-specific orders/requests indicating that something should be done. In this IG, Requests are represented by two ServiceRequest profiles; `pt-ServiceRequest-DigitalGroupPlan` (the grouping item for related Tasks) and `pt-ServiceRequest-ExecutionOrder` (patient-specific execution details for a single activity).
- **Events (out of scope):** records of execution and results (e.g., Observation, Procedure, QuestionnaireResponse).
- **Task (Request/Event):** per the [FHIR R4 Workflow specification](https://hl7.org/fhir/R4/workflow.html#12.5.1.1) the Task resource takes on characteristics of both Requests and Events and shares characteristics from both patterns. In this IG, Task is used as the patient-facing workflow item that represents the request to perform a digital activity (Request side) and at the same time tracks the execution and status of that activity (Event side, within the scope of this IG limited to status tracking).

### Core relationships in ProviderTasks
- **ActivityDefinition (Definition):** describes the digital activity and provides generic, reusable information on what the activity is and how it should be used. If the activity is launchable, ActivityDefinition references one or more Endpoint(s) that provide the technical access/launch details.
- **ServiceRequest – DigitalGroupPlan (Request):** the patient-specific clinical order that identifies which digital group plan/module is requested for the patient. It acts as the grouping item that ties related Tasks together and is referenced from each Task via `Task.basedOn`. The human-readable name of the digital group plan is carried in `ServiceRequest.code.text`.
- **ServiceRequest – ExecutionOrder (Request, optional):** the patient-specific execution plan for a single digital activity, containing scheduling (`occurrence`) and `patientInstruction` that deviate from or complement the generic ActivityDefinition guidance. It is referenced from a Task via `Task.focus`.
- **Task (Request/Event):** the patient-facing workflow item shown in the PHR task list. Task is treated as a hybrid Request/Event resource per the FHIR R4 Workflow specification: it represents the request to perform a digital activity for the patient and at the same time carries the execution status of that activity. Each Task represents one digital activity and links to the `pt-ServiceRequest-DigitalGroupPlan` via `Task.basedOn` (grouping) and, when patient-specific execution details are needed, to a `pt-ServiceRequest-ExecutionOrder` via `Task.focus`.

### Grouping of Tasks
Tasks that belong to the same digital care module are grouped through a shared **ServiceRequest – DigitalGroupPlan**. There is no parent–child hierarchy between Tasks: 
- **Grouping mechanism:** every Task references the same `pt-ServiceRequest-DigitalGroupPlan` via `Task.basedOn`. All Tasks that share the same `Task.basedOn` reference belong to the same digital group plan and can be presented and filtered together in the PHR.
- **Group name:** the human-readable name of the digital group plan is carried in `ServiceRequest.code.text` of the referenced DigitalGroupPlan. This same name is used as the display label of the Task group in the PHR; the value in `ServiceRequest.code.text` MUST match the name used to identify the group in the `Task.basedOn` reference.
- **Link to definition:** each Task in the group still links to its own ActivityDefinition (via the Koppeltaal `instantiates` extension), which describes the specific digital activity to be launched or performed. Different Tasks within the same group MAY reference different ActivityDefinitions.

### ServiceRequest profiles
This IG defines two distinct ServiceRequest profiles. They serve different purposes and are referenced from the Task in different ways. A single Task MAY reference both at the same time.

| Profile | Purpose | Referenced from | Intent |
| --- | --- | --- | --- |
| `pt-ServiceRequest-DigitalGroupPlan` | Identifies the digital group plan/module that the patient should perform. Acts as the grouping item that ties related Tasks together. | `Task.basedOn` | `plan` |
| `pt-ServiceRequest-ExecutionOrder` | Carries patient-specific execution details for a single digital activity (`occurrence`, `patientInstruction`) that deviate from or complement the generic ActivityDefinition. | `Task.focus` | `order` |

#### How to implement
- **Source system (XIS):**
  - When a healthcare professional starts a digital group plan/module for a patient, the source system creates **one** `pt-ServiceRequest-DigitalGroupPlan` instance and fills `ServiceRequest.code.text` with the (display) name of the digital group plan.
  - For each digital activity that is part of that group plan, the source system creates a `pt-Task` and sets `Task.basedOn` to the same `pt-ServiceRequest-DigitalGroupPlan`. This single shared reference is what groups the Tasks together.
  - When patient-specific scheduling and/or instructions are needed for an individual activity, the source system additionally creates a `pt-ServiceRequest-ExecutionOrder` and references it from the corresponding Task via `Task.focus`.
  - The generic activity content (what to launch or perform) is described in `pt-ActivityDefinition` and referenced from the Task via the Koppeltaal `instantiates` extension.
- **PHR system:**
  - The PHR retrieves Tasks via the PULL transaction and resolves the references on `Task.basedOn`, `Task.focus`, and the `instantiates` extension using the FHIR read interaction.
  - To display Tasks grouped per digital group plan, the PHR groups Tasks by the value of `Task.basedOn` (i.e., the reference to the same `pt-ServiceRequest-DigitalGroupPlan`) and uses `ServiceRequest.code.text` as the group label.
  - For each individual Task, the PHR uses the `pt-ActivityDefinition` for generic activity information and, when present, the `pt-ServiceRequest-ExecutionOrder` for the patient-specific scheduling and instructions.


{{render: guides/medmij-r4-provider-module-ig/images/Overview ProviderTask relationships.png}}

**Figure 1: Overview of ProviderTask releationships**

### Taks status
[TO DO]

## Actors involved

| Actor | Description | System | Role in exchange |
| --- | --- | --- | --- |
| Patient | Performs the digital activity | PHR/PGO | Retrieves tasks, launches activities, views status |
| Healthcare provider | Initiates digital activities for a patient | Source system (XIS) | Creates/maintains tasks (and optional ServiceRequest) |
| Module system | Delivers the digital activity | External module/application | Executes the activity after launch, triggers status updates |

## Boundaries and relationships
This IG covers use cases for exchanging task data between healthcare providers and patients (typically through a PHR).

This IG guide assumes that a PHR is able to connect with a source system. Requirements for infrastructure, security, authentication, and authorization are defined in the [MedMij Solution Design](https://changemanagement.medmij.nl/aanbiedermodules/actueel/). 

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
- LogicalModel [Task]()
- LogicalModel [Definition]()
- LogicalModel [ServiceRequest-ExecutionOrder]()
- LogicalModel [Patient]()

## Retrieve task list (PHR → Source System)
The PHR system requests task data using individual [search](https://hl7.org/fhir/R4/search.html) interactions. The task data exchange consists of multiple FHIR resources with specific constraints. These interactions are performed using an HTTP GET as shown below:

`GET [base]/[type]{?[parameters]}`

### PHR: request message
Goal: the patient retrieves open and (optionally) completed tasks, along with the related context required to display the task list and support launching the associated digital activity.

`GET [base]/Task?owner=Patient/[patient-id]`

#### filter Taks.owner
[TO DO]

#### Read operation
To resolve referenced resources (such as ActivityDefinition and ServiceRequest) from a retrieved Task, both the client and the server SHALL support the FHIR read interaction. The client follows the references in the Task and retrieves each referenced resource using `GET [base]/[type]/[id]`, so that the PHR can display the necessary context (e.g., generic activity information from ActivityDefinition and patient-specific instructions from ServiceRequest, when present). All resources referenced per literal reference SHALL be resolvable per the [MedMij FHIR IG by Nictiz](https://informatiestandaarden.nictiz.nl/wiki/MedMij:IG:V1/FHIR_IG#Including_referenced_resources).

### XIS: Response message
A Bundle containing Task resource(s) conforming to the `pt-Task` profile, including the references that allow the PHR to display and group the tasks:
- the referenced `pt-ServiceRequest-DigitalGroupPlan` via `Task.basedOn` (used to group the Tasks; the group display name is in `ServiceRequest.code.text`);
- the referenced `pt-ServiceRequest-ExecutionOrder` via `Task.focus` (when patient-specific execution details are present);
- the referenced `pt-ActivityDefinition` via the `instantiates` extension on the Task.

### request last-updated
The PHR SHALL be able to retrieve only those Task resources that have been updated since a given point in time, to support efficient incremental refresh of the task list. This is done using the standard FHIR _lastUpdated search parameter (based on `meta.lastUpdated`). The PHR determines the time window itself (e.g., since last sync) and includes the desired date/time range in the search query, for example:

`GET [base]/Task?_lastUpdated=ge2025-11-14T14:58:33+00:00`

Optionally, the PHR/PGO can also provide an upper bound to restrict the period:

`GET [base]/Task?_lastUpdated=ge2026-01-01T00:00:00+01:00&_lastUpdated=le2026-01-31T23:59:59+01:00`

## Update Task status (module system → Source System)
This IG uses PATCH for partial updates of Task resources.

PATCH [base]/Task/[id]

Goal: write back progress/completion after the patient interacted with the activity (including after returning from the external module/application). Status updates apply to each individual Task; there is no main/subtask hierarchy.

### PATCH (partial update) for task updates
In addition to full updates (PUT), a source system SHALL support the FHIR PATCH interaction to update specific elements of an existing Task (e.g., changing `Task.status` without resending the entire resource). PATCH is defined in the FHIR RESTful API specification: https://hl7.org/fhir/R4/http.html#patch

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




## Launch (PGO → module system)
The launch is based on information in ActivityDefinition and Endpoint (e.g., endpoint.address). In the ProviderTasks this is the step where the PHR starts an external module/application.

The launch is an interaction outside the core REST data exchange and is based on SMART App Launch. The specifications can be found in the [MedMij Solution Design](https://changemanagement.medmij.nl/aanbiedermodules/actueel/).


## Source system: example queries
The returned data to the PHR should conform to the profiles listed in the table below. The table below shows in the first four columns the provider module sections, the HCIMs that constitute those sections and the specific content of the provider module specific information. The last column shows the FHIR search queries to obtain the Provider Module information. These queries and expected responses are based on profiles listed in the {{pagelink:FO, text: functional design}}.  

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
            <th>FHIR Profile </th>
            <th>Search URL</th>
        </tr>
    </thead>
    <tbody>
        </tr>
         <tr>
            <td>Search of the Task</td>
            <td>Taak</td>
            <td>Task</td>
            <td><a href="" target="_blank">pt-Task</a></td>
            <td class="monospace">GET [base]/Task</td>
        </tr>
         <tr>
            <td>3</td>
            <td>Digitale activiteit</td>
            <td>ActivityDefinition</td>
            <td><a href="" target="_blank">pt-ActivityDefinition</a></td>
            <td class="monospace"> See Task </td>
        </tr>
         <tr>
            <td>4</td>
            <td>Zorgopdracht</td>
            <td>ServiceRequest</td>
            <td><a href="" target="_blank">pt-ServiceRequest</a></td>
            <td class="monospace">See Task</td>
        </tr>
         <tr>
            <td>5</td>
            <td>Endpoint</td>
            <td>Endpoint</td>
            <td><a href="" target="_blank">pt-Endpoint</a></td>
            <td class="monospace"> See ActivityDefinition </td>
        </tr>
         <tr>
            <td>6</td>
            <td>Taak</td>
            <td>Task</td>
            <td><a href="" target="_blank">pt-Task</a></td>
            <td class="monospace">PATCH [base]/Task/[id]</td>
        </tr>
        <tr>
            <td>7</td>
            <td>Zorgaanbieder</td>
            <td>HealthcareProvider</td>
            <td><a href="https://simplifier.net/packages/nictiz.fhir.nl.r4.nl-core/0.12.0-beta.1/files/2885775" target="_blank">nl-core-HealthcareProvider
            <a href="https://simplifier.net/packages/nictiz.fhir.nl.r4.nl-core/0.12.0-beta.1/files/2885776" target="_blank">nl-core-HealthcareProvider-Organization</a></td>
            <td class="monospace">See PractitionerRole</td>
        </tr>
        <tr>
            <td>8</td>
            <td>Zorgverlener</td>
            <td>HealthProfessional</td>
            <td><a href="https://simplifier.net/packages/nictiz.fhir.nl.r4.nl-core/0.12.0-beta.1/files/2885777" target="_blank">nl-core-HealthProfessional-Practitioner 
             <a href="https://simplifier.net/packages/nictiz.fhir.nl.r4.nl-core/0.12.0-beta.1/files/2885778" target="_blank">nl-core-HealthProfessional-PractitionerRole</a></td>
            <td class="monospace">See Task and ServiceRequest</td>
        </tr>
    </tbody>
</table>

</body>
</html>



