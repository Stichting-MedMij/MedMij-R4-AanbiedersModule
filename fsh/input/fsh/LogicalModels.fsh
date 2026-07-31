// All LogicalModels used in ProviderTasks

Logical: PtLmDigitalActivity
Parent: http://hl7.org/fhir/StructureDefinition/Element
Id: pt-lm-DigitalActivity
Title: "Digital Activity"
Description: "Reusable definition of a digital activity (module) that can be selected by a healthcare professional and presented to a patient as part of the care process. The activity describes what the patient will do (e.g., read information, complete a questionnaire, perform a home measurement) and provides the information needed to start or access the activity when applicable."
Characteristics: #can-be-target
* insert DefaultNarrative
* ^status = #draft
* insert PublisherAndContact
* ^purpose = "This LogicalModel represents the DigitalActivity building block for patient use cases in the context of the information standard Provider Tasks (Aanbiedertaken)."
* insert Copyright
* ^abstract = false
* .
  * ^short = "Digital activity"
  * ^alias = "DigitaleActiviteit"
* Identifier 0..* Identifier "Business identifier for this digital activity definition."
  * ^short = "Identifier"
  * ^alias = "Identificatie"
* Title 1..1 string "Short, human-friendly title for the digital activity."
  * ^short = "Title"
  * ^alias = "Titel"
* Status 0..1 code "Lifecycle status of the digital activity."
  * ^short = "Status"
  * ^alias = "Status"
  * ^binding.strength = #required
  * ^binding.valueSet = "http://hl7.org/fhir/ValueSet/publication-status"
* Publisher 0..1 string "Organization responsible for the content/functionality of this digital activity and its maintenance."
  * ^short = "Publisher"
  * ^alias = "Uitgever"
* Description 0..1 markdown "Guidance on how this digital activity should be used in clinical workflows."
  * ^short = "Description"
  * ^alias = "Omschrijving"
* Schedule[x] 0..1 dateTime or Period or Timing "Generic recommendation for how often/when the activity is typically performed. Patient-specific scheduling belongs in the execution order."
  * ^short = "Schedule"
  * ^alias = "Tijdschema"
* Usage 0..1 string "A detailed description of how the digital activity is used from a clinical perspective. In the MedMij use case, this text is intended for the healthcare professional who is selecting and assigning the activity to the patient."
  * ^short = "Usage"
  * ^alias = "Gebruik"
* Endpoint 1..* Reference(PtLmEndpoint) "Mandatory reference to the service application (endpoint) that provides the launchable digital activity. Can be more than one endpoint."
  * ^short = "Endpoint"
  * ^alias = "Endpoint"

Mapping: PtLmDigitalActivityMedMij-100-alpha1
Source: PtLmDigitalActivity
Id: pt-dataset-100-alpha1-20260511
Title: "Dataset Aanbiedertaken MedMij 1.0.0-alpha.1 20260511"
* . -> "pt-dataelement-9" "DigitalActivity"
* Identifier -> "pt-dataelement-31" "Identifier"
* Title -> "pt-dataelement-10" "Title"
* Status -> "pt-dataelement-11" "Status"
* Publisher -> "pt-dataelement-12" "Publisher"
* Description -> "pt-dataelement-13" "Description"
* Schedule[x] -> "pt-dataelement-14" "Schedule"
* Usage -> "pt-dataelement-30" "Usage"
* Endpoint -> "pt-dataelement-36" "Endpoint"

Logical: PtLmDigitalGroupPlan
Parent: http://hl7.org/fhir/StructureDefinition/Element
Id: pt-lm-DigitalGroupPlan
Title: "Digital Group Plan"
Description: "Patient-specific digital group plan that groups related tasks belonging to the same digital care module. The digital group plan provides the display label used to present grouped tasks in the patient's task list."
Characteristics: #can-be-target
* insert DefaultNarrative
* ^status = #draft
* insert PublisherAndContact
* ^purpose = "This LogicalModel represents the DigitalGroupPlan building block for patient use cases in the context of the information standard Provider Tasks (Aanbiedertaken)."
* insert Copyright
* ^abstract = false
* .
  * ^short = "Digital group plan"
  * ^alias = "DigitaalGroepsplan"
* Name 1..1 string "Human-readable name of the digital group plan, used as the display label for grouped tasks."
  * ^short = "Name"
  * ^alias = "Naam"
* Status 0..1 code "Current state of the digital group plan request."
  * ^short = "Status"
  * ^alias = "Status"
  * ^binding.strength = #required
  * ^binding.valueSet = "http://hl7.org/fhir/ValueSet/request-status"
* Requester 0..1 Reference(MedMijCoreLmHealthProfessional) "Healthcare professional that requested this digital group plan for the patient."
  * ^short = "Requester"
  * ^alias = "Aanvrager"

Mapping: PtLmDigitalGroupPlanMedMij-100-alpha1
Source: PtLmDigitalGroupPlan
Id: pt-dataset-100-alpha1-20260511
Title: "Dataset Aanbiedertaken MedMij 1.0.0-alpha.1 20260511"
* . -> "pt-dataelement-20" "DigitalGroupPlan"
* Name -> "pt-dataelement-21" "Name"
* Status -> "pt-dataelement-22" "Status"
* Requester -> "pt-dataelement-23" "Requester"

Logical: PtLmExecutionOrder
Parent: http://hl7.org/fhir/StructureDefinition/Element
Id: pt-lm-ExecutionOrder
Title: "Execution Order"
Description: "Patient-specific execution order for a digital activity, created by a healthcare professional for a patient."
Characteristics: #can-be-target
* insert DefaultNarrative
* ^status = #draft
* insert PublisherAndContact
* ^purpose = "This LogicalModel represents the ExecutionOrder building block for patient use cases in the context of the information standard Provider Tasks (Aanbiedertaken)."
* insert Copyright
* ^abstract = false
* .
  * ^short = "Execution order"
  * ^alias = "Uitvoeringsopdracht"
* Identifier 0..* Identifier "Business identifier for this execution order."
  * ^short = "Identifier"
  * ^alias = "Identificatie"
* PatientInstruction 0..1 string "Patient-oriented instructions that may differ from or add to the generic activity information. These instructions should be shown alongside the task(s) created from this order."
  * ^short = "Patient instruction"
  * ^alias = "PatiëntenInstructie"
* Schedule[x] 0..1 dateTime or Period or Timing "Requested schedule for performing the activity."
  * ^short = "Schedule"
  * ^alias = "Tijdschema"
* Requester 0..1 Reference(MedMijCoreLmHealthProfessional) "Healthcare professional that requests this activity for the patient."
  * ^short = "Requester"
  * ^alias = "Aanvrager"

Mapping: PtLmExecutionOrderMedMij-100-alpha1
Source: PtLmExecutionOrder
Id: pt-dataset-100-alpha1-20260511
Title: "Dataset Aanbiedertaken MedMij 1.0.0-alpha.1 20260511"
* . -> "pt-dataelement-15" "ExecutionOrder"
* Identifier -> "pt-dataelement-32" "Identifier"
* PatientInstruction -> "pt-dataelement-16" "PatientInstruction"
* Schedule[x] -> "pt-dataelement-17" "Schedule"
* Requester -> "pt-dataelement-18" "Requester"

Logical: PtLmTask
Parent: http://hl7.org/fhir/StructureDefinition/Element
Id: pt-lm-Task
Title: "Task"
Description: "Patient-specific task that tells a patient what to do as part of a digital care activity. A task is shown in the patient's task list and supports tracking progress and completion over time."
* insert DefaultNarrative
* ^status = #draft
* insert PublisherAndContact
* ^purpose = "This LogicalModel represents the Task building block for patient use cases in the context of the information standard Provider Tasks (Aanbiedertaken)."
* insert Copyright
* ^abstract = false
* .
  * ^short = "Task"
  * ^alias = "Taak"
* Identifier 0..* Identifier "Business identifier for this patient task."
  * ^short = "Identifier"
  * ^alias = "Identificatie"
* DigitalActivity 1..1 Reference(PtLmDigitalActivity) "Reference to the digital activity definition associated with this task."
  * ^short = "Digital activity"
  * ^alias = "DigitaleActiviteit"
* GroupPlan 1..1 Reference(PtLmDigitalGroupPlan) "Reference to the digital group plan that groups this task with related tasks in the same digital care module."
  * ^short = "Group plan"
  * ^alias = "DigitaalGroepsplan"
* ExecutionOrder 0..1 Reference(PtLmExecutionOrder) "Execution order that triggered this patient task. May include patient-specific instructions and the requested schedule."
  * ^short = "Execution order"
  * ^alias = "Uitvoeringsopdracht"
* Status 1..1 code "Current state of the task in the workflow."
  * ^short = "Status"
  * ^alias = "Status"
  * ^binding.strength = #required
  * ^binding.valueSet = "http://hl7.org/fhir/ValueSet/task-status"
* Priority 0..1 code "Indicates how urgent it is to perform the activity."
  * ^short = "Priority"
  * ^alias = "Prioriteit"
  * ^binding.strength = #required
  * ^binding.valueSet = "http://hl7.org/fhir/ValueSet/request-priority"
* Description 0..1 string "Short instruction for the patient describing what to do."
  * ^short = "Description"
  * ^alias = "Omschrijving"
* ExecutionPeriod 0..1 Period "Time window in which the task should be performed (start/end), if applicable."
  * ^short = "Execution period"
  * ^alias = "Periode"
* AuthoredOn 0..1 dateTime "The date and time this task was created."
  * ^short = "Authored on"
  * ^alias = "CreatieDatumTijd"
* LastModified 0..1 dateTime "The date and time of last modification to this task."
  * ^short = "Last modified"
  * ^alias = "MutatieDatumTijd"
* Requester 0..1 Reference(MedMijCoreLmHealthProfessional) "The healthcare professional who requested or initiated this task."
  * ^short = "Requester"
  * ^alias = "Aanvrager"
* Owner 1..1 Reference(http://nictiz.nl/fhir/StructureDefinition/nl-core-Patient or MedMijCoreLmHealthProfessional or http://nictiz.nl/fhir/StructureDefinition/nl-core-ContactPerson or http://nictiz.nl/fhir/StructureDefinition/nl-core-CareTeam) "The party currently responsible for executing the task."
  * ^short = "Owner"
  * ^alias = "Eigenaar"

Mapping: PtLmTaskMedMij-100-alpha1
Source: PtLmTask
Id: pt-dataset-100-alpha1-20260511
Title: "Dataset Aanbiedertaken MedMij 1.0.0-alpha.1 20260511"
* . -> "pt-dataelement-1" "Task"
* Identifier -> "pt-dataelement-33" "Identifier"
* DigitalActivity -> "pt-dataelement-2" "DigitalActivity"
* GroupPlan -> "pt-dataelement-3" "GroupPlan"
* ExecutionOrder -> "pt-dataelement-19" "ExecutionOrder"
* Status -> "pt-dataelement-4" "Status"
* Priority -> "pt-dataelement-5" "Priority"
* Description -> "pt-dataelement-6" "Description"
* ExecutionPeriod -> "pt-dataelement-7" "ExecutionPeriod"
* AuthoredOn -> "pt-dataelement-34" "AuthoredOn"
* LastModified -> "pt-dataelement-35" "LastModified"
* Requester -> "pt-dataelement-8" "Requester"
* Owner -> "pt-dataelement-24" "Owner"

Logical: PtLmEndpoint
Parent: http://hl7.org/fhir/StructureDefinition/Element
Id: pt-lm-Endpoint
Title: "Endpoint"
Description: "Technical FHIR REST endpoint of a source system (XIS), used by a Task to retrieve and update task data and the required context for the Provider Tasks use case."
Characteristics: #can-be-target
* insert DefaultNarrative
* ^status = #draft
* insert PublisherAndContact
* ^purpose = "This LogicalModel represents the Endpoint building block for patient use cases in the context of the information standard Provider Tasks (Aanbiedertaken)."
* insert Copyright
* ^abstract = false
* .
  * ^short = "Endpoint"
  * ^alias = "Endpoint"
* ClientID 0..* string "The client ID used as the audience input parameter in the token exchange request between PHR and the DVA authorisation server."
  * ^short = "Client ID"
  * ^alias = "ClientID"
* Status 1..1 code "The operational status of the endpoint (e.g., active, suspended, error, off, entered-in-error)."
  * ^short = "Status"
  * ^alias = "Status"
  * ^binding.strength = #required
  * ^binding.valueSet = "http://hl7.org/fhir/ValueSet/endpoint-status"
* ConnectionType 1..1 Coding "Protocol/profile used to communicate with the endpoint."
  * ^short = "Connection type"
  * ^alias = "Verbindingstype"
  * ^binding.strength = #extensible
  * ^binding.valueSet = "http://vzvz.nl/fhir/ValueSet/endpoint-connection-type"
* ManagingOrganization 0..1 Reference(Organization or http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthcareProvider-Organization) "Organization that manages this endpoint (and not necessarily the technical infrastructure hosting it)."
  * ^short = "Managing organization"
  * ^alias = "BeherendeOrganisatie"

Mapping: PtLmEndpointMedMij-100-alpha1
Source: PtLmEndpoint
Id: pt-dataset-100-alpha1-20260511
Title: "Dataset Aanbiedertaken MedMij 1.0.0-alpha.1 20260511"
* . -> "pt-dataelement-25" "Endpoint"
* ClientID -> "pt-dataelement-26" "ClientID"
* Status -> "pt-dataelement-27" "Status"
* ConnectionType -> "pt-dataelement-28" "ConnectionType"
* ManagingOrganization -> "pt-dataelement-29" "ManagingOrganization"
