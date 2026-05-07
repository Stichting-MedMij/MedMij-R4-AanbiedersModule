Profile: PtTask
Parent: Task
Id: pt-Task
Description: "This (FHIR) Task profile describes a patient-specific actionable item, intended to be presented to the patient in a client application (e.g., a PGO) and/or processed within the Koppeltaal workflow. It may optionally reference an ActivityDefinition that defines what should be launched or performed (module, questionnaire, information, measurement)."
* insert DefaultNarrative
* ^status = #draft
* insert PublisherAndContactMedMij
* ^purpose = "This profile represents a patient-specific actionable item, intended to be presented to the patient in a client application (e.g., a PGO) and/or processed in the Koppeltaal workflow, optionally instantiating an ActivityDefinition that can be launched or performed (module, questionnaire, information, measurement)."
* insert Copyright
* .
  * ^short = "Task"
  * ^alias = "Taak"
* insert Origin
* .
^definition = "A patient-specific actionable item, assigned to the patient and optionally linked to an ActivityDefinition describing what to launch or perform."
* extension contains $koppeltaal-instantiates named instantiates 0..*
  * ^short = "Reference to ActivityDefinition" 
  * ^definition = "A link to the ActivityDefinition that defines the launchable eHealth activity (i.e., what module/content should be launched or performed) associated with this Task. In both MedMij and Koppeltaal implementations, this link is carried using the Koppeltaal instantiates extension."
  * ^alias = "DigitaleActiviteit"
  * valueReference only Reference(ProviderTasksActivityDefinition)
* identifier 1..
* basedOn only Reference(ProviderTasksServiceRequestDigitalGroupPlan)
  * ^short = "Digital group plan"
  * ^definition = "Reference to the ServiceRequest that initiates the digital group plan for the patient. This is the module-level order and links the Task to the requested digital group plan."
  * ^alias = "GebaseerdOp"
* partOf only Reference(ProviderTasksTask)
* status
  * ^short = "Status"
  * ^definition = "Current state of the Task in the workflow (e.g., requested, received, accepted, in-progress, completed, cancelled)."
  * ^alias = "Status"
* priority
  * ^short = "Priority"
  * ^definition = "Indicates how urgent it is to perform the activity (e.g., routine, urgent, asap)."
  * ^alias = "Prioriteit"
* description
  * ^definition = "A free-text description of what is to be performed. Implementers should ensure the text is readable on mobile applications."
  * ^alias = "Omschrijving"
* executionPeriod
  * ^short = "ExecutionPeriod"
  * ^definition = "Time window in which the task should be performed (start/end), if applicable."
  * ^alias = "Periode"
* focus 0..1
* focus only Reference(ProviderTasksServiceRequestExecutionOrder)
  * ^short = "Patient-specific execution details"
  * ^definition = "Reference to the ServiceRequest that contains patient-specific scheduling and/or instructions that deviate from or complement the generic ActivityDefinition guidance."
* for 1..
* for only Reference(http://nictiz.nl/fhir/StructureDefinition/nl-core-Patient)
  * ^definition = "The patient who benefits from the performance of the service specified in the task."
  * ^comment = "In this profile, this element always refers to the patient for whom the task is intended."
  * ^requirements = "Used to track tasks outstanding for a beneficiary. Do not use to track the task owner or creator (see owner and creator respectively). This can also affect access control."
* requester only Reference(Device or Organization or Practitioner or PractitionerRole or RelatedPerson or http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthProfessional-PractitionerRole)
  * ^comment = """
    Each occurrence of the zib HealthProfessional is normally represented by _two_ FHIR resources: a PractitionerRole resource (instance of [nl-core-HealthProfessional-PractitionerRole](http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthProfessional-PractitionerRole)) and a Practitioner resource (instance of [nl-core-HealthProfessional-Practitioner](http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthProfessional-Practitioner)). The Practitioner resource is referenced from the PractitionerRole instance. For this reason, sending systems should fill the reference to the PractitionerRole instance here, and not the Practitioner resource. Receiving systems can then retrieve the reference to the Practitioner resource from that PractitionerRole instance.

    In rare circumstances, there is only a Practitioner instance, in which case it is that instance which will be referenced here. However, since this should be the exception, the nl-core-HealthProfessional-Practitioner profile is not explicitly mentioned as a target profile.
    """
  * ^definition = "In Koppeltaal this element contains a reference to the person requesting the eHealth Task"
  * ^alias = "Aanvrager"
* owner 1..
* owner only Reference(Practitioner or PractitionerRole or Organization or CareTeam or HealthcareService or Patient or Device or RelatedPerson or http://nictiz.nl/fhir/StructureDefinition/nl-core-CareTeam or http://nictiz.nl/fhir/StructureDefinition/nl-core-Patient or http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthProfessional-PractitionerRole or http://nictiz.nl/fhir/StructureDefinition/nl-core-ContactPerson)
  * ^definition = "Practitioner, CareTeam, RelatedPerson or Patient currently responsible for task execution."
  * ^comment = "For Koppeltaal: In Koppeltaal the patient is usually the person who executes the task. Note, this element is not intended to be used for access restriction. That is left to the relevant applications.\r\n\r\nEach occurrence of the zib HealthProfessional is normally represented by two FHIR resources: a PractitionerRole resource (instance of [nl-core-HealthProfessional-PractitionerRole](http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthProfessional-PractitionerRole)) and a Practitioner resource (instance of [nl-core-HealthProfessional-Practitioner](http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthProfessional-Practitioner)). The Practitioner resource is referenced from the PractitionerRole instance. For this reason, sending systems should fill the reference to the PractitionerRole instance here, and not the Practitioner resource. Receiving systems can then retrieve the reference to the Practitioner resource from that PractitionerRole instance.\r\n\r\nIn rare circumstances, there is only a Practitioner instance, in which case it is that instance which will be referenced here. However, since this should be the exception, the nl-core-HealthProfessional-Practitioner profile is not explicitly mentioned as a target profile.\r\n\r\n In ProviderTasks, the owner is typically the performer of the task (usually the patient), but execution may also be delegated to another responsible party such as a caregiver/contact person or a care team."

Mapping: ProviderTasksTaskMedMij-100-alpha1
Source: ProviderTasksTask
Id: pt-dataset-100-alpha1-20260511
Title: "Dataset Aanbiedertaken MedMij 1.0.0-alpha.1 20260511"
* -> "pt-dataelement-1" "Task"
* extension[instantiates] -> "pt-dataelement-2" "ActivityDefinition"
* basedOn -> "pt-dataelement-3" "BasedOn"
* status -> "pt-dataelement-4" "Status"
* priority -> "pt-dataelement-5" "Priority"
* description -> "pt-dataelement-6" "Description"
* executionPeriod -> "pt-dataelement-7" "ExecutionPeriod"
* requester -> "pt-dataelement-8" "Requester"