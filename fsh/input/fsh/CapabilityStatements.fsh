// CapabilityStatements used in ProviderTasks (Aanbiedertaken)

Instance: pt-Task-Retrieve
InstanceOf: CapabilityStatement
Usage: #definition
* insert DefaultNarrativeInstance
* name = "Pt Task Retrieve"
* status = #draft
* date = "2026-05-13"
* insert PublisherAndContactInstance
* description = "This CapabilityStatement describes the minimal requirements for a client to fulfill the 'Retrieve Task(s)' transaction within Provider Task."
* purpose = "This CapabilityStatement is informative in nature and does not represent the minimum or maximum set of capabilities the client or server should support. The aim is to design the CapabilityStatement as complete as possible, however for the exact set of capabilities the implementation guide should be consulted."
* insert CopyrightInstance
* kind = #requirements
* fhirVersion = #4.0.1
* format[0] = #xml
* format[1] = #json
* rest
  * mode = #client
  * documentation = "Minimal requirements for a client to fulfill the 'Retrieve task' transaction (system role: PT-TGR-1.0.0-alpha.1)"
  * resource[+]
    * type = #Task
    * supportedProfile = "http://medmij.nl/fhir/StructureDefinition/pt-Task"
    * interaction
      * code = #search-type
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
  * interaction
    * code = #search-system

Instance: pt-Task-Serve
InstanceOf: CapabilityStatement
Usage: #definition
* insert DefaultNarrativeInstance
* name = "Pt Task Serve"
* status = #draft
* date = "2026-04-13"
* insert PublisherAndContactInstance
* description = "This CapabilityStatement describes the minimal requirements for a server to fulfill the 'Serve Task' transaction within Provider Task."
* purpose = "This CapabilityStatement is informative in nature and does not represent the minimum or maximum set of capabilities the client or server should support. The aim is to design the CapabilityStatement as complete as possible, however for the exact set of capabilities the implementation guide should be consulted."
* insert CopyrightInstance
* kind = #requirements
* fhirVersion = #4.0.1
* format[0] = #xml
* format[1] = #json
* rest
  * mode = #server
  * documentation = "Minimal requirements for a server to fulfill the 'Serve Task' transaction (system role: PT-TGB-1.0.0-alpha.1)."
  * resource[+]
    * type = #Task
    * supportedProfile = "http://medmij.nl/fhir/StructureDefinition/pt-Task"
    * interaction
      * code = #search-type
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

Instance: pt-Task-Update
InstanceOf: CapabilityStatement
Usage: #definition
* insert DefaultNarrativeInstance
* name = "Pt Task Update"
* status = #draft
* date = "2026-07-14"
* insert PublisherAndContactInstance
* description = "This CapabilityStatement describes the minimal requirements for a module system to fulfill the 'Update Task' transaction within Provider Task, in which the module system reports task progress by changing the Task status after the patient has interacted with the digital activity."
* purpose = "This CapabilityStatement is informative in nature and does not represent the minimum or maximum set of capabilities the client or server should support. The aim is to design the CapabilityStatement as complete as possible, however for the exact set of capabilities the implementation guide should be consulted."
* insert CopyrightInstance
* kind = #requirements
* fhirVersion = #4.0.1
* format[0] = #xml
* format[1] = #json
* rest
  * mode = #client
  * documentation = "Minimal requirements for a module system (client) to fulfill the 'Update task' transaction. The module system obtains the Task id from the launch context (SMART App Launch `resource` token response field), retrieves the Task and updates `Task.status` to reflect progress or completion of the digital activity."
  * resource[+]
    * type = #Task
    * supportedProfile = "http://medmij.nl/fhir/StructureDefinition/pt-Task"
    * interaction[+]
      * code = #read
      * documentation = "The module system retrieves the Task using the Task id from the launch context, e.g. `GET [base]/Task/[id]`."
    * interaction[+]
      * code = #patch
      * documentation = "The module system updates specific elements of the Task (typically `Task.status`) using a FHIRPath Patch or JSON Patch, e.g. `PATCH [base]/Task/[id]`. See [MedMij Change Management: 3.7 Wijzigen Task Status Module](https://changemanagement.medmij.nl/alpha-of-beta/v14/3-7-wijzigen-task-status-module)."
    * versioning = #versioned
    * conditionalRead = #not-supported
    * readHistory = false
    * updateCreate = false