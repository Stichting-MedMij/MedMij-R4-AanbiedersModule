Profile: PtDigitalActivity
Parent: ActivityDefinition
Id: pt-DigitalActivity
Title: "pt DigitalActivity"
Description: "Reusable definition of a digital activity (module) that can be selected by a healthcare professional and presented to a patient as part of the care process. The activity describes what the patient will do (e.g., read information, complete a questionnaire, perform a home measurement) and provides the information needed to start or access the activity when applicable."
* ^status = #draft
* insert PublisherAndContact
* ^purpose = "This ActivityDefinition resource represents the DigitalActivity building block for patient use cases in the context of the information standard Provider Tasks (Aanbiedertaken)."
* insert Copyright
* .
  * ^short = "Digital Activity"
  * ^definition = "Reusable definition of a digital activity (module) that can be selected by a healthcare professional and presented to a patient as part of the care process. The activity describes what the patient will do (e.g., read information, complete a questionnaire, perform a home measurement) and provides the information needed to start or access the activity when applicable."
  * ^alias = "Digitale Activiteit"
* extension contains ExtEndpointReference named endpoint 1..*
* extension[endpoint] ^short = "Endpoint for launching the activity"
  * ^definition = "Mandatory reference to the service application (endpoint) that provides the launchable digital activity. Can be more than one endpoint."
* identifier
  * ^short = "Identifier"
  * ^definition = "Business identifier for this digital activity definition."
  * ^alias = "Identificatie"
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
* usage
  * ^definition = "A detailed description of how the activity definition is used from a clinical perspective. In the MedMij use case, this text is intended for the healthcare professional who is selecting and assigning the activity to the patient."
* topic from http://vzvz.nl/fhir/ValueSet/koppeltaal-definition-topic (extensible)
  * ^short = "E.g. Self-Treatment and Self-Assessment, etc."
  * ^definition = "Descriptive topics related to the content of the activity. The topic is used to indicate that the activity is intended or suitable for initialization by patients."
  * ^binding.description = "High-level categorization of the definition, used for indicating special patient initialised activities"
* timing[x] only Timing
* timingTiming
  * ^short = "Timing"
  * ^definition = "Generic recommendation for how often/when the activity is typically performed. Patient-specific scheduling belongs in the execution order (ServiceRequest)."
  * ^alias = "Tijdschema"

Mapping: ProviderTasksDigitalActivityMedMij-100-alpha1
Source: PtDigitalActivity
Id: pt-dataset-100-alpha1-20260511
Title: "Dataset Aanbiedertaken MedMij 1.0.0-alpha.2 20260511"
* -> "pt-dataelement-9" "DigitalActivity"
* identifier -> "pt-dataelement-31" "Identifier"
* title -> "pt-dataelement-10" "Title"
* status -> "pt-dataelement-11" "Status"
* publisher -> "pt-dataelement-12" "Publisher"
* description -> "pt-dataelement-13" "Description"
* timingTiming -> "pt-dataelement-14" "Schedule"
* usage -> "pt-dataelement-30" "Usage"
* extension[$pt-endpoint] -> "pt-dataelement-36" "Endpoint"
