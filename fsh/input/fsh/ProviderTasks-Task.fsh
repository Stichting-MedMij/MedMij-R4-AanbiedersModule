Profile: PtTask
Parent: Task
Id: pt-Task
Title: "pt Task"
Description: "Patient-specific task that tells a patient what to do as part of a digital care activity. A Task is shown in the patient's task list and supports tracking progress and completion over time."
* insert DefaultNarrative
* ^status = #draft
* insert PublisherAndContact
* ^purpose = "This Task resource represents the Task building block for patient use cases in the context of the information standard Provider Tasks (Aanbiedertaken)."
* insert Copyright
* .
  * ^short = "Task"
  * ^alias = "Taak"
* .
^definition = "Patient-specific task that tells a patient what to do as part of a digital care activity. A Task is shown in the patient's task list and supports tracking progress and completion over time."
* extension contains ExtDigitalActivity named digitalActivity 1..1
  * ^short = "Reference to ActivityDefinition"
  * ^definition = "A link to the ActivityDefinition that defines the launchable eHealth activity (i.e., what module/content should be launched or performed) associated with this Task."
  * ^alias = "DigitaleActiviteit"
  * valueReference only Reference(PtDigitalActivity)
* identifier 1..
  * ^comment = "Mapping to the functional model is pending: a corresponding identifier concept is to be added to the Task Logical Model."
* basedOn 1..1
* basedOn only Reference(PtDigitalGroupPlan)
  * ^short = "Digital group plan"
  * ^definition = "Reference to the ServiceRequest that initiates the digital group plan for the patient. This is the module-level order and links the Task to the requested digital group plan."
  * ^alias = "DigitaalGroepsplan"
* status 1..1
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
* focus only Reference(PtExecutionOrder)
  * ^short = "Patient-specific execution details"
  * ^definition = "Reference to the ServiceRequest that contains patient-specific scheduling and/or instructions that deviate from or complement the generic ActivityDefinition guidance."
  * ^alias = "Uitvoeringsopdracht"
* for 1..
* for only Reference(http://nictiz.nl/fhir/StructureDefinition/nl-core-Patient)
  * ^definition = "The patient who benefits from the performance of the service specified in the task."
  * ^requirements = "Used to track tasks outstanding for a beneficiary. Do not use to track the task owner or creator (see owner and creator respectively). This can also affect access control."
* requester only Reference(Practitioner or PractitionerRole or http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthProfessional-PractitionerRole)
  * ^comment = """
    Each occurrence of the zib HealthProfessional is normally represented by _two_ FHIR resources: a PractitionerRole resource (instance of [nl-core-HealthProfessional-PractitionerRole](http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthProfessional-PractitionerRole)) and a Practitioner resource (instance of [nl-core-HealthProfessional-Practitioner](http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthProfessional-Practitioner)). The Practitioner resource is referenced from the PractitionerRole instance. For this reason, sending systems should fill the reference to the PractitionerRole instance here, and not the Practitioner resource. Receiving systems can then retrieve the reference to the Practitioner resource from that PractitionerRole instance.

    In rare circumstances, there is only a Practitioner instance, in which case it is that instance which will be referenced here. However, since this should be the exception, the nl-core-HealthProfessional-Practitioner profile is not explicitly mentioned as a target profile.
    """
  * ^short = "Requester"
  * ^definition = "The healthcare professional who requested or initiated this Task."
  * ^alias = "Aanvrager"
* owner 1..
* owner only Reference(Practitioner or PractitionerRole or Organization or CareTeam or HealthcareService or Patient or Device or RelatedPerson or http://nictiz.nl/fhir/StructureDefinition/nl-core-CareTeam or http://nictiz.nl/fhir/StructureDefinition/nl-core-Patient or http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthProfessional-PractitionerRole or http://nictiz.nl/fhir/StructureDefinition/nl-core-ContactPerson)
  * ^short = "Owner"
  * ^definition = "The party currently responsible for executing the task."
  * ^alias = "Uitvoerder"
  * ^comment = """
    In Provider Tasks, the owner is typically the performer of the task (usually the patient), but execution may also be delegated to another responsible party such as a caregiver/contact person or a care team.

    Each occurrence of the zib HealthProfessional is normally represented by two FHIR resources: a PractitionerRole resource (instance of [nl-core-HealthProfessional-PractitionerRole](http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthProfessional-PractitionerRole)) and a Practitioner resource (instance of [nl-core-HealthProfessional-Practitioner](http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthProfessional-Practitioner)). The Practitioner resource is referenced from the PractitionerRole instance. For this reason, sending systems should fill the reference to the PractitionerRole instance here, and not the Practitioner resource. Receiving systems can then retrieve the reference to the Practitioner resource from that PractitionerRole instance.

    In rare circumstances, there is only a Practitioner instance, in which case it is that instance which will be referenced here. However, since this should be the exception, the nl-core-HealthProfessional-Practitioner profile is not explicitly mentioned as a target profile.
    """

Mapping: ProviderTasksTaskMedMij-100-alpha1
Source: PtTask
Id: pt-dataset-100-alpha1-20260511
Title: "Dataset Aanbiedertaken MedMij 1.0.0-alpha.1 20260511"
* -> "pt-dataelement-1" "Task"
* extension[$pt-digital-activity] -> "pt-dataelement-2" "DigitalActivity"
* basedOn -> "pt-dataelement-3" "GroupPlan"
* focus -> "pt-dataelement-19" "ExecutionOrder"
* status -> "pt-dataelement-4" "Status"
* priority -> "pt-dataelement-5" "Priority"
* description -> "pt-dataelement-6" "Description"
* executionPeriod -> "pt-dataelement-7" "ExecutionPeriod"
* requester -> "pt-dataelement-8" "Requester"
* owner -> "pt-dataelement-24" "Owner"
