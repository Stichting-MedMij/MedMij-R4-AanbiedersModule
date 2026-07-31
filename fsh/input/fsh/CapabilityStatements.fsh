// CapabilityStatements used in ProviderTasks (Aanbiedertaken)
// Organized per system (actor): PHR (client), Module system (client) and XIS (server).

Instance: pt-PHR
InstanceOf: CapabilityStatement
Usage: #definition
* insert DefaultNarrativeInstanceDefinitional
* name = "PtPHR"
* title = "pt PHR"
* status = #draft
* date = "2026-07-16"
* insert PublisherAndContactInstance
* description = "This CapabilityStatement describes the minimal requirements for a PHR to fulfill the 'Retrieve Task(s)' transaction within Provider Task, in which the PHR retrieves the patient's tasks and resolves the referenced (secondary) resources."
* purpose = "This CapabilityStatement is informative in nature and does not represent the minimum or maximum set of capabilities the client or server should support. The aim is to design the CapabilityStatement as complete as possible, however for the exact set of capabilities the implementation guide should be consulted."
* insert CopyrightInstance
* kind = #requirements
* fhirVersion = #4.0.1
* format[0] = #xml
* format[1] = #json
* rest
  * mode = #client
  * documentation = "Minimal requirements for a PHR (client) to fulfill the 'Retrieve task' transaction (system role: PT-TGR-1.0.0-alpha.2)."
  * resource[+]
    * type = #Task
    * supportedProfile = "http://medmij.nl/fhir/StructureDefinition/pt-Task"
    * interaction
      * code = #search-type
    * searchInclude[0] = "Task:based-on"
    * searchInclude[1] = "Task:focus"
    * searchInclude[2] = "Task:digital-activity"
    * searchParam[+]
      * name = "_tag"
      * definition = "http://hl7.org/fhir/SearchParameter/Resource-tag"
      * type = #token
      * documentation = "The client SHALL always scope the search to the Provider Tasks data service, i.e. `_tag=http://medmij.nl/fhir/CodeSystem/DataService|urn:oid:2.16.528.1.1023.5.6`."
    * searchParam[+]
      * name = "_lastUpdated"
      * definition = "http://hl7.org/fhir/SearchParameter/Resource-lastUpdated"
      * type = #date
      * documentation = "The client SHALL be able to retrieve only those Tasks changed since a given point in time, to support incremental refresh of the task list, e.g. `_lastUpdated=ge2025-11-14T14:58:33+00:00`. The prefixes `ge`, `gt`, `le` and `lt` SHALL be supported; an upper and lower bound MAY be combined to restrict the period."
    * searchParam[+]
      * name = "digitalActivity"
      * definition = "http://medmij.nl/fhir/SearchParameter/Task-digitalActivity"
      * type = #reference
      * documentation = "Custom search parameter targeting the `ext-Task.DigitalActivity` extension, which enables `_include=Task:digital-activity`."
  * resource[+]
    * type = #ActivityDefinition
    * supportedProfile = "http://medmij.nl/fhir/StructureDefinition/pt-DigitalActivity"
    * documentation = "This is a secondary resource that needs to be resolvable, either by supporting a `read` interaction or explicitly including it in the Bundle."
    * interaction
      * code = #read
      * documentation = "If the server includes this (secondary) resource in the Bundle, the client does not need to execute a `read`. However, since a server may choose to not include it in the Bundle, support of the `read` interaction is mandatory for a client."
  * resource[+]
    * type = #ServiceRequest
    * supportedProfile[0] = "http://medmij.nl/fhir/StructureDefinition/pt-DigitalGroupPlan"
    * supportedProfile[1] = "http://medmij.nl/fhir/StructureDefinition/pt-ExecutionOrder"
    * documentation = "This is a secondary resource that needs to be resolvable, either by supporting a `read` interaction or explicitly including it in the Bundle."
    * interaction
      * code = #read
      * documentation = "If the server includes this (secondary) resource in the Bundle, the client does not need to execute a `read`. However, since a server may choose to not include it in the Bundle, support of the `read` interaction is mandatory for a client."
  * resource[+]
    * type = #Patient
    * supportedProfile = "http://nictiz.nl/fhir/StructureDefinition/nl-core-Patient"
    * documentation = "This is a secondary resource that needs to be resolvable, either by supporting a `read` interaction or explicitly including it in the Bundle."
    * interaction
      * code = #read
      * documentation = "If the server includes this (secondary) resource in the Bundle, the client does not need to execute a `read`. However, since a server may choose to not include it in the Bundle, support of the `read` interaction is mandatory for a client."
  * resource[+]
    * type = #PractitionerRole
    * supportedProfile = "http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthProfessional-PractitionerRole"
    * documentation = "This is a secondary resource that needs to be resolvable, either by supporting a `read` interaction or explicitly including it in the Bundle."
    * interaction
      * code = #read
      * documentation = "If the server includes this (secondary) resource in the Bundle, the client does not need to execute a `read`. However, since a server may choose to not include it in the Bundle, support of the `read` interaction is mandatory for a client."
  * resource[+]
    * type = #Practitioner
    * supportedProfile = "http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthProfessional-Practitioner"
    * documentation = "This is a secondary resource that needs to be resolvable, either by supporting a `read` interaction or explicitly including it in the Bundle."
    * interaction
      * code = #read
      * documentation = "If the server includes this (secondary) resource in the Bundle, the client does not need to execute a `read`. However, since a server may choose to not include it in the Bundle, support of the `read` interaction is mandatory for a client."
  * resource[+]
    * type = #Organization
    * supportedProfile = "http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthcareProvider-Organization"
    * documentation = "This is a secondary resource that needs to be resolvable, either by supporting a `read` interaction or explicitly including it in the Bundle."
    * interaction
      * code = #read
      * documentation = "If the server includes this (secondary) resource in the Bundle, the client does not need to execute a `read`. However, since a server may choose to not include it in the Bundle, support of the `read` interaction is mandatory for a client."
  * resource[+]
    * type = #Location
    * supportedProfile = "http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthcareProvider"
    * documentation = "This is a secondary resource that needs to be resolvable, either by supporting a `read` interaction or explicitly including it in the Bundle."
    * interaction
      * code = #read
      * documentation = "If the server includes this (secondary) resource in the Bundle, the client does not need to execute a `read`. However, since a server may choose to not include it in the Bundle, support of the `read` interaction is mandatory for a client."
  * interaction
    * code = #search-system

Instance: pt-ModuleSystem
InstanceOf: CapabilityStatement
Usage: #definition
* insert DefaultNarrativeInstanceDefinitional
* name = "PtModuleSystem"
* title = "pt Module System"
* status = #draft
* date = "2026-07-16"
* insert PublisherAndContactInstance
* description = "This CapabilityStatement describes the minimal requirements for a module system to fulfill the 'Retrieve Task' and 'Update Task' transactions within Provider Task. The module system retrieves the Task from the launch context and reports task progress by changing the Task status after the patient has interacted with the digital activity."
* purpose = "This CapabilityStatement is informative in nature and does not represent the minimum or maximum set of capabilities the client or server should support. The aim is to design the CapabilityStatement as complete as possible, however for the exact set of capabilities the implementation guide should be consulted."
* insert CopyrightInstance
* kind = #requirements
* fhirVersion = #4.0.1
* format[0] = #xml
* format[1] = #json
* patchFormat = #application/json-patch+json
* rest
  * mode = #client
  * documentation = "Minimal requirements for a module system (client) to fulfill the 'Retrieve task' and 'Update task' transactions (system role: PA-DAU-1.0.0-alpha.2). The module system obtains the Task id from the launch context (SMART App Launch `resource` token response field), retrieves the Task and updates `Task.status` to reflect progress or completion of the digital activity."
  * resource[+]
    * type = #Task
    * supportedProfile = "http://medmij.nl/fhir/StructureDefinition/pt-Task"
    * interaction[+]
      * code = #read
      * documentation = "The module system retrieves the Task using the Task id from the launch context, e.g. `GET [base]/Task/[id]`."
    * interaction[+]
      * code = #patch
      * documentation = "The module system updates specific elements of the Task (typically `Task.status`) using a JSON Patch (`application/json-patch+json`), e.g. `PATCH [base]/Task/[id]`. See [MedMij Change Management: 3.7 Wijzigen Task Status Module](https://changemanagement.medmij.nl/alpha-of-beta/v14/3-7-wijzigen-task-status-module)."
    * versioning = #versioned
    * conditionalRead = #not-supported
    * readHistory = false
    * updateCreate = false

Instance: pt-XIS
InstanceOf: CapabilityStatement
Usage: #definition
* insert DefaultNarrativeInstanceDefinitional
* name = "PtXIS"
* title = "pt XIS"
* status = #draft
* date = "2026-07-16"
* insert PublisherAndContactInstance
* description = "This CapabilityStatement describes the minimal requirements for a server (XIS) to fulfill the 'Serve Task' transaction and to process task status updates within Provider Task."
* purpose = "This CapabilityStatement is informative in nature and does not represent the minimum or maximum set of capabilities the client or server should support. The aim is to design the CapabilityStatement as complete as possible, however for the exact set of capabilities the implementation guide should be consulted."
* insert CopyrightInstance
* kind = #requirements
* fhirVersion = #4.0.1
* format[0] = #xml
* format[1] = #json
* patchFormat = #application/json-patch+json
* rest
  * mode = #server
  * documentation = "Minimal requirements for a server (XIS) to fulfill the 'Serve task' transaction and to process task status updates (system role: PT-TGB-1.0.0-alpha.2)."
  * resource[+]
    * type = #Task
    * supportedProfile = "http://medmij.nl/fhir/StructureDefinition/pt-Task"
    * interaction[+]
      * code = #search-type
    * interaction[+]
      * code = #read
    * interaction[+]
      * code = #patch
      * documentation = "The server processes task status updates submitted by the module system as a JSON Patch (`application/json-patch+json`), e.g. `PATCH [base]/Task/[id]`. See [MedMij Change Management: 3.7 Wijzigen Task Status Module](https://changemanagement.medmij.nl/alpha-of-beta/v14/3-7-wijzigen-task-status-module)."
    * versioning = #versioned
    * conditionalRead = #not-supported
    * readHistory = false
    * updateCreate = false
    * searchInclude[0] = "Task:based-on"
    * searchInclude[1] = "Task:focus"
    * searchInclude[2] = "Task:digital-activity"
    * searchParam[+]
      * name = "_tag"
      * definition = "http://hl7.org/fhir/SearchParameter/Resource-tag"
      * type = #token
      * documentation = "The server SHALL support filtering on the Provider Tasks data service tag, i.e. `_tag=http://medmij.nl/fhir/CodeSystem/DataService|urn:oid:2.16.528.1.1023.5.6`."
    * searchParam[+]
      * name = "_lastUpdated"
      * definition = "http://hl7.org/fhir/SearchParameter/Resource-lastUpdated"
      * type = #date
      * documentation = "The server SHALL support returning only those Tasks changed since a given point in time, to support incremental refresh of the task list, e.g. `_lastUpdated=ge2025-11-14T14:58:33+00:00`. The prefixes `ge`, `gt`, `le` and `lt` SHALL be supported, including two `_lastUpdated` parameters that together bound the period."
    * searchParam[+]
      * name = "digitalActivity"
      * definition = "http://medmij.nl/fhir/SearchParameter/Task-digitalActivity"
      * type = #reference
      * documentation = "Custom search parameter targeting the `ext-Task.DigitalActivity` extension, which enables `_include=Task:digital-activity`."
  * resource[+]
    * type = #ActivityDefinition
    * supportedProfile = "http://medmij.nl/fhir/StructureDefinition/pt-DigitalActivity"
    * documentation = "This is a secondary resource that needs to be resolvable, either by supporting a `read` interaction or explicitly including it in the Bundle."
    * interaction
      * code = #read
      * documentation = "If the server always includes this (secondary) resource in the Bundle, support of the `read` interaction is optional."
  * resource[+]
    * type = #ServiceRequest
    * supportedProfile[0] = "http://medmij.nl/fhir/StructureDefinition/pt-DigitalGroupPlan"
    * supportedProfile[1] = "http://medmij.nl/fhir/StructureDefinition/pt-ExecutionOrder"
    * documentation = "This is a secondary resource that needs to be resolvable, either by supporting a `read` interaction or explicitly including it in the Bundle."
    * interaction
      * code = #read
      * documentation = "If the server always includes this (secondary) resource in the Bundle, support of the `read` interaction is optional."
  * resource[+]
    * type = #Patient
    * supportedProfile = "http://nictiz.nl/fhir/StructureDefinition/nl-core-Patient"
    * documentation = "This is a secondary resource that needs to be resolvable, either by supporting a `read` interaction or explicitly including it in the Bundle."
    * interaction
      * code = #read
      * documentation = "If the server always includes this (secondary) resource in the Bundle, support of the `read` interaction is optional."
  * resource[+]
    * type = #PractitionerRole
    * supportedProfile = "http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthProfessional-PractitionerRole"
    * documentation = "This is a secondary resource that needs to be resolvable, either by supporting a `read` interaction or explicitly including it in the Bundle."
    * interaction
      * code = #read
      * documentation = "If the server always includes this (secondary) resource in the Bundle, support of the `read` interaction is optional."
  * resource[+]
    * type = #Practitioner
    * supportedProfile = "http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthProfessional-Practitioner"
    * documentation = "This is a secondary resource that needs to be resolvable, either by supporting a `read` interaction or explicitly including it in the Bundle."
    * interaction
      * code = #read
      * documentation = "If the server always includes this (secondary) resource in the Bundle, support of the `read` interaction is optional."
  * resource[+]
    * type = #Organization
    * supportedProfile = "http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthcareProvider-Organization"
    * documentation = "This is a secondary resource that needs to be resolvable, either by supporting a `read` interaction or explicitly including it in the Bundle."
    * interaction
      * code = #read
      * documentation = "If the server always includes this (secondary) resource in the Bundle, support of the `read` interaction is optional."
  * resource[+]
    * type = #Location
    * supportedProfile = "http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthcareProvider"
    * documentation = "This is a secondary resource that needs to be resolvable, either by supporting a `read` interaction or explicitly including it in the Bundle."
    * interaction
      * code = #read
      * documentation = "If the server always includes this (secondary) resource in the Bundle, support of the `read` interaction is optional."
  * interaction
    * code = #search-system
