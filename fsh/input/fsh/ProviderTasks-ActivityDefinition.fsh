Profile: PtActivityDefinition
Parent: ActivityDefinition
Id: pt-ActivityDefinition
Description: "This (FHIR) ActivityDefinition profile describes a reusable definition of a launchable digital (eHealth) activity that can be requested for a patient in MedMij and/or Koppeltaal workflows. It captures the clinical intent and the technical launch information (e.g., endpoint)."
* ^status = #draft
* insert PublisherAndContactMedMij
* insert Origin
* insert Copyright
* . 
  * ^short = "Digital Activity"
  * ^definition = "Definition of a launchable digital (eHealth) activity that can be used as a template for patient-specific workflow requests. The definition may describe different activity types (e.g., launching a third-party module, presenting information, completing a questionnaire, or performing a measurement) and includes the technical launch details needed to invoke the activity in the correct context."
  * ^alias = "Digitale Activiteit"
* extension contains
    $koppeltaal-endpoint named endpoint 1..* and
    $koppeltaal-publisher-id named publisherId 0..1
* extension[endpoint] ^short = "Endpoint for launching the activity"
  * ^definition = "Mandatory reference to the service application (endpoint) that provides the launchable eHealth activity. Can be more than one endpoint."
* url 1..
* title 1..
  * ^short = "Title"
  * ^definition = "Short, human-friendly title for the digital activity."
  * ^alias = "Titel"
* status
  * ^short = "Status"
  * ^definition = "Lifecycle status of the digital activity (e.g., draft, active, retired). A retired activity can no longer be selected or assigned."
  * ^alias = "Status"
* publisher
  * ^short = "Publisher"
  * ^definition = "Organization responsible for the content/functionality of this digital activity and its maintenance."
* description
  * ^short = "Description"
  * ^definition = "Guidance on how this digital activity should be used in clinical workflows."
  * ^alias = "Omschrijving"
* useContext
  * ^definition = "The context for the content of the eHealth activity."
  * ^comment = "E.g. the activity is targeted to a certain age group."
* usage
  * ^definition = "A detailed description of how the activity definition is used from a clinical perspective. In the MedMij use case, this text is intended for the healthcare professional who is selecting and assigning the activity to the patient."
* topic from http://vzvz.nl/fhir/ValueSet/koppeltaal-definition-topic (extensible)
  * ^short = "E.g. Self-Treatment and Self-Assessment, etc."
  * ^definition = "Descriptive topics related to the content of the activity. The topic is used to indicate that the activity is intended or suitable for initialization by patients."
  * ^binding.description = "High-level categorization of the definition, used for indicating special patient initialised activities"
* timing[x] only Timing
* timingTiming
  * ^short = "Timing"
  * ^definition = "Generic recommendation for how often/when the activity is typically performed. Patient-specific scheduling belongs in the clinical order (e.g., ServiceRequestExecutionOrder)."
  * ^alias = "Tijdschema"

Mapping: ProviderTasksActivityDefinitionMedMij-100-alpha1
Source: ProviderTasksActivityDefinition
Id: pt-dataset-100-alpha1-20260511
Title: "Dataset Aanbiedertaken MedMij 1.0.0-alpha.1 20260511"
* -> "pt-dataelement-9" "Activity"
* title -> "pt-dataelement-10" "Title"
* status -> "pt-dataelement-11" "Status"
* publisher -> "pt-dataelement-12" "Publisher"
* description -> "pt-dataelement-13" "Description"
* timingTiming -> "pt-dataelement-14" "Timing"
