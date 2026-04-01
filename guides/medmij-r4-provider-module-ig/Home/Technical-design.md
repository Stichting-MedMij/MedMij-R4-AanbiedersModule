---
topic: TO
---

# FHIR IG

## Introduction
This Technical Design (TD) describes the technical implementation of the ProviderTasks (Aanbiedertaken) based on the [Functional Design]() (FD). The TD is the technical counterpart of the FD and describes:
- the involved actors and systems;
- the FHIR profiles and resources to be used;
- the transactions (search/retrieve/update) including example queries;
- the workflow relationships between definitions, orders/requests, and workflow items.

The FHIR version used for this IG is HL7 FHIR R4 (4.0.1).

## Workflow model (FHIR Workflow)
ProviderTasks follows the [FHIR workflow](https://hl7.org/fhir/R4/workflow.html) approach where resources are grouped into Definitions, Requests, and Events:
- Definitions: reusable definitions of digital activities, primarily represented by the ActivityDefinition resource (for example, an ActivityDefinition that defines a questionnaire-based activity).
- Requests: patient-specific “orders/requests” indicating that something should be done (e.g., ServiceRequest, Task)
- Events: records of execution and results (e.g., Observation, Procedure, QuestionnaireResponse). This is out of scope in this TD version. The focus is on Definitions and Requests.

FHIR explicitly describes these categories (definitions/requests/events) and their relationships (e.g., requests referencing definitions, events referencing orders, parent-child relationships).

### Relationships in ProviderTasks
- ActivityDefinition (Definition) describes the digital activity (e.g., a launchable module or informational content) and contains generic, reusable information about what the digital activity is and how it should be used, including the technical launch information via Endpoint.
- ServiceRequest (Request) is optional and is used when patient-specific instructions and/or scheduling are needed that deviate from or complement the generic guidance in the ActivityDefinition (e.g., occurrence schedule and patientInstruction). Tasks may reference the originating ServiceRequest via `Task.basedOn`.
- Task (Request) is the patient-facing workflow item shown in the PHR (PGO) task list and used for status tracking. Tasks may be grouped (`groupIdentifier`) and may form parent-child relations (`partOf`) for repeating subtasks within one activity.
- Event resources (out of scope): Observations/QuestionnaireResponse/etc. resulting from execution (not specified here).


#### Workflow relationships and grouping

Link to Modules (ActivityDefinition):
- The Tasks (main task and subtasks) contain a link to ActivityDefinition that defines the launchable digital activity (what should be launched or performed).
- The ActivityDefinition references one or more Endpoint(s) that expose the activity and provide the technical access/launch details.

Main task and subtasks:
- If subtasks are used, there is always a main (parent) task representing the overall activity/module.
- Subtasks reference the main task via Task.partOf.
- Subtasks are only used for repeating tasks of a single digital activity (one ActivityDefinition). Therefore, subtasks linked via Task.partOf SHALL NOT reference a different ActivityDefinition than their main task.
- Grouping of tasks within a single digital care module can be done using Task.groupIdentifier.

Link to order (ServiceRequest)
- A Task can reference the originating ServiceRequest via Task.basedOn.
- The ServiceRequest represents the clinical order for the digital activity and may include:
    - the patient-specific requested schedule (occurrence);
    - patient-specific instructions (patientInstruction).

## Actors involved

| Actor | | System | | FHIR CapabilityStatement |
|| --- | --- | --- | --- | --- | --- |
| **Name** | **Description** | **Name** | **Description** | **Name** | **Description** |
| Patient | User who performs the digital activity | PHR | Personal health record (PHR)| [TO DO] | FHIR client requirements |
| Healthcare provider | User who initiates the digtial activity | source system (XIS) | Healthcare information system | [TO DO] | FHIR server requirements |
| Module system | System that delivers the digital activity | module system | Healthcare information system | [TO DO] | FHIR client requirements |

## Boundaries and relationships
This FHIR IG covers use cases for exchanging task data between healthcare providers and patients (typically through a PHR).

This IG guide assumes that a PHR is able to connect with a source system. Requirements for infrastructure, security, authentication, and authorization are defined in the [MedMij Solution Design](https://changemanagement.medmij.nl/aanbiedermodules/actueel/).

Out of scope for this TD version:
- Exchange of clinical results produced by executing the activity (Event resources such as Observation or QuestionnaireResponse).

## Use cases

### Overview
The healthcare provider initiates a digital activity for the patient. The patient retrieves the task list in the PHR, starts (launches) the digital activity, performs it in an external application/module, and then sees task status updates in the PHR.

### Transactions
- PULL task list (PHR→ source system): retrieve Task, including the links to the ActivityDefinition (instantiates extension), and `basedOn` links to ServiceRequest (if used).
- LAUNCH (PHR → module system): start the external module/application using information from ActivityDefinition and referenced Endpoint.
- UPDATE status (Module system → source system): update `Task.status` for both main tasks and subtasks to reflect progress and completion.

### Taks status
[TO DO]

### Dataset and conformance
The dataset is specified in the Logical Models:
- LogicalModel [Task]()
- LogicalModel [Definition]()
- LogicalModel [ServiceRequest]()
- LogicalModel [Patient]()

Test material (fixtures) and example instances are published separately as test artifacts in the Implementation Guide.

## Retrieve task list (PHR/PGO → Source System)

#### PHR: request message
The PHR system requests task data using individual [search](https://hl7.org/fhir/R4/search.html) interactions. The task data exchange consists of multiple FHIR resources with specific constraints. These interactions are performed using an HTTP GET as shown below:

`GET [base]/[type]{?[parameters]}`

Goal: the patient retrieves open and (optionally) completed tasks, along with the related context required to display the task list and support launching the associated digital activity.

### Response
A Bundle containing Task resource(s) conforming to the ProviderTasks-Task profile, including:
- the referenced ServiceRequest via `Task.basedOn` (if present);
- any subtasks linked via `Task.partOf` (if present).

## Update Task status (module system → Source System)
This IG uses PATCH for partial updates of Task resources.

PATCH [base]/Task/[id]

Goal: write back progress/completion after the patient interacted with the activity (including after returning from the external module/application). Status updates apply to main tasks and subtasks.

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

## Last-updated
[TO DO]

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
            <th>Section</th>
            <th>CIM NL</th>
            <th>HCIM EN</th>
            <th>FHIR Profile </th>
            <th>Search URL</th>
        </tr>
    </thead>
    <tbody>
               <tr>
            <td>1</td>
            <td>Patiënt</td>
            <td>Patient</td>
              <td><a href="https://simplifier.net/packages/nictiz.fhir.nl.r4.nl-core/0.12.0-beta.1/files/2885819" target="_blank">nl-core-Patient</a></td>
            <td class="monospace">GET [base]/Patient</td>
        </tr>
         <tr>
            <td>2</td>
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



