Profile: PtDigitalGroupPlan
Parent: ServiceRequest
Id: pt-DigitalGroupPlan
Title: "pt DigitalGroupPlan"
Description: "Patient-specific digital group plan that groups related tasks belonging to the same digital care module. The digital group plan provides the display label used to present grouped tasks in the patient's task list."
* insert DefaultNarrative
* ^status = #draft
* insert PublisherAndContact
* ^purpose = "This ServiceRequest resource represents the DigitalGroupPlan building block for patient use cases in the context of the data service Provider Tasks (Aanbiedertaken)."
* insert Copyright
* .
  * ^short = "Digital group plan"
  * ^alias = "Module-opdracht"
* .
^definition = "Patient-specific clinical order to initiate a digital group plan. It is referenced from the patient-facing Task via Task.basedOn."
* intent = #plan
* status 1..1
  * ^short = "Status"
  * ^definition = "Current state of the digital group plan order (e.g., draft, active, on-hold, revoked, completed)."
* code 1..1
  * ^short = "Digital group plan"
  * ^alias = "Digitaal groepsplan"
  * text 1..1
    * ^short = "Display name of the digital group plan"
    * ^definition = "Human-readable name of the digital group plan."
    * ^comment = "This name is used as the display label of the Task group in the PHR. The display on Task.basedOn.reference SHALL match this value. The source system fills this element with the (display) name of the digital group plan when a healthcare professional starts a digital group plan/module for a patient."
    * ^alias = "Naam digitaal groepsplan"
* subject only Reference(Patient or Group or Location or Device or http://nictiz.nl/fhir/StructureDefinition/nl-core-Patient)
  * ^definition = "The patient for whom the activity is requested."
* requester only Reference(Practitioner or PractitionerRole or http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthProfessional-PractitionerRole)
  * ^comment = """
    Each occurrence of the zib HealthProfessional is normally represented by _two_ FHIR resources: a PractitionerRole resource (instance of [nl-core-HealthProfessional-PractitionerRole](http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthProfessional-PractitionerRole)) and a Practitioner resource (instance of [nl-core-HealthProfessional-Practitioner](http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthProfessional-Practitioner)). The Practitioner resource is referenced from the PractitionerRole instance. For this reason, sending systems should fill the reference to the PractitionerRole instance here, and not the Practitioner resource. Receiving systems can then retrieve the reference to the Practitioner resource from that PractitionerRole instance.

    In rare circumstances, there is only a Practitioner instance, in which case it is that instance which will be referenced here. However, since this should be the exception, the nl-core-HealthProfessional-Practitioner profile is not explicitly mentioned as a target profile.
    """
  * ^short = "Requester"
  * ^definition = "Healthcare professional that requests this digital group plan for the patient."
  * ^alias = "Aanvrager"

Mapping: ProviderTasksDigitalGroupPlanMedMij-100-alpha1
Source: PtDigitalGroupPlan
Id: pt-dataset-100-alpha1-20260511
Title: "Dataset Aanbiedertaken MedMij 1.0.0-alpha.2 20260511"
* -> "pt-dataelement-20" "DigitalGroupPlan"
* code.text -> "pt-dataelement-21" "Name"
* status -> "pt-dataelement-22" "Status"
* requester -> "pt-dataelement-23" "Requester"
