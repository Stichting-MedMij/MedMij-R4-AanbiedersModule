Profile: ProviderTasksServiceRequestExecutionOrder
Parent: ServiceRequest
Id: pt-ServiceRequest-ExecutionOrder
Description: "Patient-specific execution plan for a digital activity. This ServiceRequest captures patient-specific scheduling and instructions that deviate from or complement the generic ActivityDefinition. It is referenced from the patient-facing Task via Task.focus."
* insert DefaultNarrative
* ^status = #draft
* insert PublisherAndContactMedMij
* ^purpose = "To represent the healthcare professional’s order to start a specific digital activity for a patient."
* insert Copyright
* .
  * ^short = "Patient-specific execution details"
  * ^alias = "Uitvoeringsopdracht"
* insert Origin
* .
^definition = "Patient-specific execution plan for a digital activity, containing scheduling (occurrence) and patientInstruction. It is referenced from Task via Task.focus."
* intent = #order
* subject only Reference(Patient or Group or Location or Device or http://nictiz.nl/fhir/StructureDefinition/nl-core-Patient)
  * ^definition = "The patient for whom the digital activity applies."
* occurrence[x]
  * ^short = "Occurrence"
  * ^definition = "Requested schedule for performing the activity (e.g., duration, frequency, time of day)."
  * ^alias = "Tijdschema"
* requester only Reference(Practitioner or PractitionerRole or Organization or Patient or RelatedPerson or Device or http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthProfessional-PractitionerRole)
  * ^comment = """
    Each occurrence of the zib HealthProfessional is normally represented by _two_ FHIR resources: a PractitionerRole resource (instance of [nl-core-HealthProfessional-PractitionerRole](http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthProfessional-PractitionerRole)) and a Practitioner resource (instance of [nl-core-HealthProfessional-Practitioner](http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthProfessional-Practitioner)). The Practitioner resource is referenced from the PractitionerRole instance. For this reason, sending systems should fill the reference to the PractitionerRole instance here, and not the Practitioner resource. Receiving systems can then retrieve the reference to the Practitioner resource from that PractitionerRole instance.

    In rare circumstances, there is only a Practitioner instance, in which case it is that instance which will be referenced here. However, since this should be the exception, the nl-core-HealthProfessional-Practitioner profile is not explicitly mentioned as a target profile.
    """
  * ^short = "Requester"
  * ^definition = "Healthcare professional that requests this activity for the patient."
  * ^alias = "Aanvrager"
* patientInstruction 1..1
  * ^short = "Patient-specific instructions"
  * ^definition = "Patient-oriented instructions that may differ from or add to the generic activity information (e.g., fasting measurements, preferred timing, preparation steps). These instructions should be shown alongside the Task(s) created from this order."
  * ^alias = "PatiëntenInstructie"

Mapping: ProviderTasksServiceRequestExecutionOrderMedMij-100-alpha1
Source: ProviderTasksServiceRequestExecutionOrder
Id: pt-dataset-100-alpha1-20260511
Title: "Dataset Aanbiedertaken MedMij 1.0.0-alpha.1 20260511"
* -> "pt-dataelement-15" "ServiceRequest"
* patientInstruction -> "pt-dataelement-16" "patientInstruction"
* occurrence[x] -> "pt-dataelement-17" "Occurrence"
* requester -> "pt-dataelement-18" "Requester"