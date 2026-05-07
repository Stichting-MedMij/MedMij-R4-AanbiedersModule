Profile: PtServiceRequestDigitalGroupPlan
Parent: ServiceRequest
Id: pt-ServiceRequest-Digital-GroupPlan
Description: "Clinical request representing the selected digital group plan for a specific patient. This ServiceRequest identifies which digital group plan is requested. Patient-specific scheduling and instructions are provided in a separate ServiceRequest"
* insert DefaultNarrative
* ^status = #draft
* insert PublisherAndContactMedMij
* ^purpose = "To represent the healthcare professional’s order to start a specific digital group plan for a patient."
* insert Copyright
* .
  * ^short = "ServiceRequest digital group plan"
  * ^alias = "Module-opdracht"
* insert Origin
* .
^definition = "Patient-specific clinical order to initiate a digital group plan. It is referenced from the patient-facing Task via Task.basedOn."
* intent = #plan
* code 1..1
  * ^short = "Digital group plan identifier"
  * ^definition = "Identifies which digital group plan is requested for the patient. The human-readable (display) name of the digital group plan is carried in `code.text` and is used as the group label in the PHR."
  * ^alias = "Identificatie digitaal groepsplan"
  * text 1..1
    * ^short = "Display name of the digital group plan"
    * ^definition = "Human-readable name of the digital group plan. This name is used as the display label of the Task group in the PHR and MUST match the name used to identify the group in the `Task.basedOn` reference. The source system fills this element with the (display) name of the digital group plan when a healthcare professional starts a digital group plan/module for a patient."
    * ^alias = "Naam digitaal groepsplan"
* subject only Reference(Patient or Group or Location or Device or http://nictiz.nl/fhir/StructureDefinition/nl-core-Patient)
  * ^definition = "The patient for whom the activity is requested."
* requester only Reference(Practitioner or PractitionerRole or Organization or Patient or RelatedPerson or Device or http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthProfessional-PractitionerRole)
  * ^comment = """
    Each occurrence of the zib HealthProfessional is normally represented by _two_ FHIR resources: a PractitionerRole resource (instance of [nl-core-HealthProfessional-PractitionerRole](http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthProfessional-PractitionerRole)) and a Practitioner resource (instance of [nl-core-HealthProfessional-Practitioner](http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthProfessional-Practitioner)). The Practitioner resource is referenced from the PractitionerRole instance. For this reason, sending systems should fill the reference to the PractitionerRole instance here, and not the Practitioner resource. Receiving systems can then retrieve the reference to the Practitioner resource from that PractitionerRole instance.

    In rare circumstances, there is only a Practitioner instance, in which case it is that instance which will be referenced here. However, since this should be the exception, the nl-core-HealthProfessional-Practitioner profile is not explicitly mentioned as a target profile.
    """
