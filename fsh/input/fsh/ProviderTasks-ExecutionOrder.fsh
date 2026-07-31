Profile: PtExecutionOrder
Parent: ServiceRequest
Id: pt-ExecutionOrder
Title: "pt ExecutionOrder"
Description: "Patient-specific execution order for a digital activity, created by a healthcare professional for a patient."
* insert DefaultNarrative
* ^status = #draft
* insert PublisherAndContact
* ^purpose = "This ServiceRequest resource represents the ExecutionOrder building block for patient use cases in the context of the information standard Provider Tasks (Aanbiedertaken)."
* insert Copyright
* .
  * ^short = "Execution order"
  * ^alias = "Uitvoeringsopdracht"
* .
^definition = "Patient-specific clinical order for a digital activity, created by a healthcare professional for a patient."
* intent = #order
* identifier
  * ^short = "Identifier"
  * ^definition = "Business identifier for this execution order."
  * ^alias = "Identificatie"
* status 1..1
  * ^short = "Status"
  * ^definition = "Current state of the execution order (e.g., draft, active, on-hold, revoked, completed)."
* subject only Reference(Patient or Group or Location or Device or http://nictiz.nl/fhir/StructureDefinition/nl-core-Patient)
  * ^definition = "The patient for whom the digital activity applies."
* occurrence[x]
  * ^short = "Occurrence"
  * ^definition = "Requested schedule for performing the activity (e.g., duration, frequency, time of day)."
  * ^alias = "Tijdschema"
* requester only Reference(Practitioner or PractitionerRole or http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthProfessional-PractitionerRole)
  * ^comment = """
    Each occurrence of the zib HealthProfessional is normally represented by _two_ FHIR resources: a PractitionerRole resource (instance of [nl-core-HealthProfessional-PractitionerRole](http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthProfessional-PractitionerRole)) and a Practitioner resource (instance of [nl-core-HealthProfessional-Practitioner](http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthProfessional-Practitioner)). The Practitioner resource is referenced from the PractitionerRole instance. For this reason, sending systems should fill the reference to the PractitionerRole instance here, and not the Practitioner resource. Receiving systems can then retrieve the reference to the Practitioner resource from that PractitionerRole instance.

    In rare circumstances, there is only a Practitioner instance, in which case it is that instance which will be referenced here. However, since this should be the exception, the nl-core-HealthProfessional-Practitioner profile is not explicitly mentioned as a target profile.
    """
  * ^short = "Requester"
  * ^definition = "Healthcare professional that requests this activity for the patient."
  * ^alias = "Aanvrager"
* patientInstruction 0..1
  * ^short = "Patient-specific instructions"
  * ^definition = "Patient-oriented instructions that may differ from or add to the generic activity information (e.g., fasting measurements, preferred timing, preparation steps). These instructions should be shown alongside the task(s) created from this order."
  * ^alias = "PatiëntenInstructie"

Mapping: ProviderTasksExecutionOrderMedMij-100-alpha1
Source: PtExecutionOrder
Id: pt-dataset-100-alpha1-20260511
Title: "Dataset Aanbiedertaken MedMij 1.0.0-alpha.2 20260511"
* -> "pt-dataelement-15" "ExecutionOrder"
* identifier -> "pt-dataelement-32" "Identifier"
* patientInstruction -> "pt-dataelement-16" "PatientInstruction"
* occurrence[x] -> "pt-dataelement-17" "Schedule"
* requester -> "pt-dataelement-18" "Requester"
