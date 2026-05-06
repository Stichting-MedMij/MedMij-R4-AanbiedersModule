// Bundle with FHIR test instances in FSH format for ProviderTasks test scenario 1
Instance: ProviderTasks-ServiceRequestExecution-Glucosemeting
InstanceOf: http://medmij.nl/fhir/StructureDefinition/pt-ServiceRequest-ExecutionOrder
Usage: #example
* text
  * status = #empty
  * div = "<div xmlns='http://www.w3.org/1999/xhtml'>No human-readable text provided in this case.</div>"
* identifier
  * system = "http://medrie/servicerequest/id"
  * value = "2025-00001234"
* status = #active
* intent = #order
* subject = Reference(ProviderTasks-Patient-Van-Duinen) "Tom van Duinen"
* occurrenceTiming.repeat
  * boundsPeriod.start = "2025-12-22"
  * boundsPeriod.end = "2025-12-28"
  * period = 1
  * periodUnit = #d
  * frequency = 2
  * frequencyMax = 2
* requester = Reference(ProviderTasks-PractitionerRole-De-Haard) "A. de Haard, Huisarts"
* patientInstruction = "Meet 7 dagen, 2 keer per dag, uw bloedglucose: nuchter vóór het ontbijt en vóór het avondeten."

Instance: ProviderTasks-ServiceRequestDigitalGroup-Diabetes
InstanceOf: http://medmij.nl/fhir/StructureDefinition/pt-ServiceRequest-DigitalGroupPlan
Usage: #example
* text
  * status = #empty
  * div = "<div xmlns='http://www.w3.org/1999/xhtml'>No human-readable text provided in this case.</div>"
* identifier
  * system = "http://medrie/servicerequest/id"
  * value = "2025-1111234"
* status = #active
* intent = #plan
* code.text = "Digitale zorgmodule Diabetes"
* subject = Reference(ProviderTasks-Patient-Van-Duinen) "Tom van Duinen"
* requester = Reference(ProviderTasks-PractitionerRole-De-Haard) "A. de Haard, Huisarts"

Instance: ProviderTasks-ActivityDefinition-Meetopdracht-Glucosemeting
InstanceOf: http://medmij.nl/fhir/StructureDefinition/pt-ActivityDefinition
Usage: #example
* text
  * status = #empty
  * div = "<div xmlns='http://www.w3.org/1999/xhtml'>No human-readable text provided in this case.</div>"
* extension
  * url = "http://koppeltaal.nl/fhir/StructureDefinition/KT2EndpointExtension"
  * valueReference = Reference(ProviderTasks-Endpoint-HINQ)
* url = "https://hing.zno.com/fhir/ActivityDefinition/b15d4634-4678-46bd-a55a-e46ef3dfb517"
* identifier
  * system = "https://hing.zno.com/content/id"
  * value = "60756972-0a15-47e1-8497-2e7d2919ebd7"
* version = "1.0.0"
* name = "MeetopdrachtBloedglucosemeting"
* title = "Bloedglucose meting volgens NHG protocol"
* status = #active
* publisher = "HinqZNO"
* description = "Bloedglucose meting volgens NHG protocol. Duur: 1 week, 2x per dag"
* usage = "controle diabetes"
* timingTiming.repeat
  * boundsDuration.value = 7
  * boundsDuration.system = "http://unitsofmeasure.org"
  * boundsDuration.code = #d
  * boundsDuration.unit = "day"
  * frequency = 1
  * period = 1
  * periodUnit = #d


Instance: ProviderTasks-Task-Meetopdracht-Glucosemeting-1
InstanceOf: http://medmij.nl/fhir/StructureDefinition/pt-Task
Usage: #example
* text
  * status = #empty
  * div = "<div xmlns='http://www.w3.org/1999/xhtml'>No human-readable text provided in this case.</div>"
* extension
  * url = $koppeltaal-instantiates
  * valueReference = Reference(ProviderTasks-ActivityDefinition-Meetopdracht-Glucosemeting)
    * type = "ActivityDefinition"
* identifier
  * system = "http://medrie.nl/taskIdentifier"
  * value = "SUBTASK-Glucose-1"
* basedOn = Reference(ProviderTasks-ServiceRequestDigitalGroup-Diabetes) "Digitale zorgmodule Diabetes"
* status = #completed
* intent = #order
* priority = #routine
* description = "Meet je bloedglucose (in de ochtend nuchter en in de avond voor het eten) en noteer de waarde in de app"
* focus = Reference(ProviderTasks-ServiceRequestExecution-Glucosemeting)
* for = Reference(ProviderTasks-Patient-Van-Duinen) "Tom van Duinen"
* executionPeriod
  * start = "2025-12-22T08:00:00+01:00"
  * end = "2025-12-22T00:00:00+01:00"
* authoredOn = "2025-12-22T08:00:00+01:00"
* lastModified = "2025-12-22T08:00:00+01:00"
* requester = Reference(ProviderTasks-PractitionerRole-De-Haard) "A. de Haard, Huisarts"
* owner = Reference(ProviderTasks-Patient-Van-Duinen) "Tom van Duinen"

Instance: ProviderTasks-Task-Meetopdracht-Glucosemeting-2
InstanceOf: http://medmij.nl/fhir/StructureDefinition/pt-Task
Usage: #example
* text
  * status = #empty
  * div = "<div xmlns='http://www.w3.org/1999/xhtml'>No human-readable text provided in this case.</div>"
* extension
  * url = $koppeltaal-instantiates
  * valueReference = Reference(ProviderTasks-ActivityDefinition-Meetopdracht-Glucosemeting)
    * type = "ActivityDefinition"
* identifier
  * system = "http://medrie.nl/taskIdentifier"
  * value = "SUBTASK-Glucose-2"
* basedOn = Reference(ProviderTasks-ServiceRequestDigitalGroup-Diabetes) "Digitale zorgmodule Diabetes"
* status = #completed
* intent = #order
* priority = #routine
* description = "Meet je bloedglucose (in de ochtend nuchter en in de avond voor het eten) en noteer de waarde in de app"
* focus = Reference(ProviderTasks-ServiceRequestExecution-Glucosemeting)
* for = Reference(ProviderTasks-Patient-Van-Duinen) "Tom van Duinen"
* executionPeriod
  * start = "2025-12-22T08:00:00+01:00"
  * end = "2025-12-22T00:00:00+01:00"
* authoredOn = "2025-12-22T08:00:00+01:00"
* lastModified = "2025-12-22T08:00:00+01:00"
* requester = Reference(ProviderTasks-PractitionerRole-De-Haard) "A. de Haard, Huisarts"
* owner = Reference(ProviderTasks-Patient-Van-Duinen) "Tom van Duinen"

Instance: ProviderTasks-Task-Meetopdracht-Glucosemeting-3
InstanceOf: http://medmij.nl/fhir/StructureDefinition/pt-Task
Usage: #example
* text
  * status = #empty
  * div = "<div xmlns='http://www.w3.org/1999/xhtml'>No human-readable text provided in this case.</div>"
* extension
  * url = $koppeltaal-instantiates
  * valueReference = Reference(ProviderTasks-ActivityDefinition-Meetopdracht-Glucosemeting)
    * type = "ActivityDefinition"
* identifier
  * system = "http://medrie.nl/taskIdentifier"
  * value = "SUBTASK-Glucose-3"
* basedOn = Reference(ProviderTasks-ServiceRequestDigitalGroup-Diabetes) "Digitale zorgmodule Diabetes"
* status = #completed
* intent = #order
* priority = #routine
* description = "Meet je bloedglucose (in de ochtend nuchter en in de avond voor het eten) en noteer de waarde in de app"
* focus = Reference(ProviderTasks-ServiceRequestExecution-Glucosemeting)
* for = Reference(ProviderTasks-Patient-Van-Duinen) "Tom van Duinen"
* executionPeriod
  * start = "2025-12-23T08:00:00+01:00"
  * end = "2025-12-23T00:00:00+01:00"
* authoredOn = "2025-12-22T08:00:00+01:00"
* lastModified = "2025-12-22T08:00:00+01:00"
* requester = Reference(ProviderTasks-PractitionerRole-De-Haard) "A. de Haard, Huisarts"
* owner = Reference(ProviderTasks-Patient-Van-Duinen) "Tom van Duinen"

Instance: ProviderTasks-Task-Meetopdracht-Glucosemeting-4
InstanceOf: http://medmij.nl/fhir/StructureDefinition/pt-Task
Usage: #example
* text
  * status = #empty
  * div = "<div xmlns='http://www.w3.org/1999/xhtml'>No human-readable text provided in this case.</div>"
* extension
  * url = $koppeltaal-instantiates
  * valueReference = Reference(ProviderTasks-ActivityDefinition-Meetopdracht-Glucosemeting)
    * type = "ActivityDefinition"
* identifier
  * system = "http://medrie.nl/taskIdentifier"
  * value = "SUBTASK-Glucose-4"
* basedOn = Reference(ProviderTasks-ServiceRequestDigitalGroup-Diabetes) "Digitale zorgmodule Diabetes"
* status = #cancelled
* intent = #order
* priority = #routine
* description = "Meet je bloedglucose (in de ochtend nuchter en in de avond voor het eten) en noteer de waarde in de app"
* focus = Reference(ProviderTasks-ServiceRequestExecution-Glucosemeting)
* for = Reference(ProviderTasks-Patient-Van-Duinen) "Tom van Duinen"
* executionPeriod
  * start = "2025-12-23T18:00:00+01:00"
  * end = "2025-12-23T00:00:00+01:00"
* authoredOn = "2025-12-22T08:00:00+01:00"
* lastModified = "2025-12-22T08:00:00+01:00"
* requester = Reference(ProviderTasks-PractitionerRole-De-Haard) "A. de Haard, Huisarts"
* owner = Reference(ProviderTasks-Patient-Van-Duinen) "Tom van Duinen"

Instance: ProviderTasks-Task-Meetopdracht-Glucosemeting-5
InstanceOf: http://medmij.nl/fhir/StructureDefinition/pt-Task
Usage: #example
* text
  * status = #empty
  * div = "<div xmlns='http://www.w3.org/1999/xhtml'>No human-readable text provided in this case.</div>"
* extension
  * url = $koppeltaal-instantiates
  * valueReference = Reference(ProviderTasks-ActivityDefinition-Meetopdracht-Glucosemeting)
    * type = "ActivityDefinition"
* identifier
  * system = "http://medrie.nl/taskIdentifier"
  * value = "SUBTASK-Glucose-5"
* basedOn = Reference(ProviderTasks-ServiceRequestDigitalGroup-Diabetes) "Digitale zorgmodule Diabetes"
* status = #received
* intent = #order
* priority = #routine
* description = "Meet je bloedglucose (in de ochtend nuchter en in de avond voor het eten) en noteer de waarde in de app"
* focus = Reference(ProviderTasks-ServiceRequestExecution-Glucosemeting)
* for = Reference(ProviderTasks-Patient-Van-Duinen) "Tom van Duinen"
* executionPeriod
  * start = "2025-12-24T08:00:00+01:00"
  * end = "2025-12-24T00:00:00+01:00"
* authoredOn = "2025-12-22T08:00:00+01:00"
* lastModified = "2025-12-22T08:00:00+01:00"
* requester = Reference(ProviderTasks-PractitionerRole-De-Haard) "A. de Haard, Huisarts"
* owner = Reference(ProviderTasks-Patient-Van-Duinen) "Tom van Duinen"

Instance: ProviderTasks-Task-Meetopdracht-Glucosemeting-6
InstanceOf: http://medmij.nl/fhir/StructureDefinition/pt-Task
Usage: #example
* text
  * status = #empty
  * div = "<div xmlns='http://www.w3.org/1999/xhtml'>No human-readable text provided in this case.</div>"
* extension
  * url = $koppeltaal-instantiates
  * valueReference = Reference(ProviderTasks-ActivityDefinition-Meetopdracht-Glucosemeting)
    * type = "ActivityDefinition"
* identifier
  * system = "http://medrie.nl/taskIdentifier"
  * value = "SUBTASK-Glucose-6"
* basedOn = Reference(ProviderTasks-ServiceRequestDigitalGroup-Diabetes) "Digitale zorgmodule Diabetes"
* status = #received
* intent = #order
* priority = #routine
* description = "Meet je bloedglucose (in de ochtend nuchter en in de avond voor het eten) en noteer de waarde in de app"
* focus = Reference(ProviderTasks-ServiceRequestExecution-Glucosemeting)
* for = Reference(ProviderTasks-Patient-Van-Duinen) "Tom van Duinen"
* executionPeriod
  * start = "2025-12-24T18:00:00+01:00"
  * end = "2025-12-24T00:00:00+01:00"
* authoredOn = "2025-12-22T08:00:00+01:00"
* lastModified = "2025-12-22T08:00:00+01:00"
* requester = Reference(ProviderTasks-PractitionerRole-De-Haard) "A. de Haard, Huisarts"
* owner = Reference(ProviderTasks-Patient-Van-Duinen) "Tom van Duinen"

Instance: ProviderTasks-Task-Meetopdracht-Glucosemeting-7
InstanceOf: http://medmij.nl/fhir/StructureDefinition/pt-Task
Usage: #example
* text
  * status = #empty
  * div = "<div xmlns='http://www.w3.org/1999/xhtml'>No human-readable text provided in this case.</div>"
* extension
  * url = $koppeltaal-instantiates
  * valueReference = Reference(ProviderTasks-ActivityDefinition-Meetopdracht-Glucosemeting)
    * type = "ActivityDefinition"
* identifier
  * system = "http://medrie.nl/taskIdentifier"
  * value = "SUBTASK-Glucose-7"
* basedOn = Reference(ProviderTasks-ServiceRequestDigitalGroup-Diabetes) "Digitale zorgmodule Diabetes"
* status = #received
* intent = #order
* priority = #routine
* description = "Meet je bloedglucose (in de ochtend nuchter en in de avond voor het eten) en noteer de waarde in de app"
* focus = Reference(ProviderTasks-ServiceRequestExecution-Glucosemeting)
* for = Reference(ProviderTasks-Patient-Van-Duinen) "Tom van Duinen"
* executionPeriod
  * start = "2025-12-25T08:00:00+01:00"
  * end = "2025-12-25T00:00:00+01:00"
* authoredOn = "2025-12-22T08:00:00+01:00"
* lastModified = "2025-12-22T08:00:00+01:00"
* requester = Reference(ProviderTasks-PractitionerRole-De-Haard) "A. de Haard, Huisarts"
* owner = Reference(ProviderTasks-Patient-Van-Duinen) "Tom van Duinen"

Instance: ProviderTasks-Task-Meetopdracht-Glucosemeting-8
InstanceOf: http://medmij.nl/fhir/StructureDefinition/pt-Task
Usage: #example
* text
  * status = #empty
  * div = "<div xmlns='http://www.w3.org/1999/xhtml'>No human-readable text provided in this case.</div>"
* extension
  * url = $koppeltaal-instantiates
  * valueReference = Reference(ProviderTasks-ActivityDefinition-Meetopdracht-Glucosemeting)
    * type = "ActivityDefinition"
* identifier
  * system = "http://medrie.nl/taskIdentifier"
  * value = "SUBTASK-Glucose-8"
* basedOn = Reference(ProviderTasks-ServiceRequestDigitalGroup-Diabetes) "Digitale zorgmodule Diabetes"
* status = #received
* intent = #order
* priority = #routine
* description = "Meet je bloedglucose (in de ochtend nuchter en in de avond voor het eten) en noteer de waarde in de app"
* focus = Reference(ProviderTasks-ServiceRequestExecution-Glucosemeting)
* for = Reference(ProviderTasks-Patient-Van-Duinen) "Tom van Duinen"
* executionPeriod
  * start = "2025-12-25T18:00:00+01:00"
  * end = "2025-12-25T00:00:00+01:00"
* authoredOn = "2025-12-22T08:00:00+01:00"
* lastModified = "2025-12-22T08:00:00+01:00"
* requester = Reference(ProviderTasks-PractitionerRole-De-Haard) "A. de Haard, Huisarts"
* owner = Reference(ProviderTasks-Patient-Van-Duinen) "Tom van Duinen"

Instance: ProviderTasks-Task-Meetopdracht-Glucosemeting-9
InstanceOf: http://medmij.nl/fhir/StructureDefinition/pt-Task
Usage: #example
* text
  * status = #empty
  * div = "<div xmlns='http://www.w3.org/1999/xhtml'>No human-readable text provided in this case.</div>"
* extension
  * url = $koppeltaal-instantiates
  * valueReference = Reference(ProviderTasks-ActivityDefinition-Meetopdracht-Glucosemeting)
    * type = "ActivityDefinition"
* identifier
  * system = "http://medrie.nl/taskIdentifier"
  * value = "SUBTASK-Glucose-9"
* basedOn = Reference(ProviderTasks-ServiceRequestDigitalGroup-Diabetes) "Digitale zorgmodule Diabetes"
* status = #received
* intent = #order
* priority = #routine
* description = "Meet je bloedglucose (in de ochtend nuchter en in de avond voor het eten) en noteer de waarde in de app"
* focus = Reference(ProviderTasks-ServiceRequestExecution-Glucosemeting)
* for = Reference(ProviderTasks-Patient-Van-Duinen) "Tom van Duinen"
* executionPeriod
  * start = "2025-12-26T08:00:00+01:00"
  * end = "2025-12-26T00:00:00+01:00"
* authoredOn = "2025-12-22T08:00:00+01:00"
* lastModified = "2025-12-22T08:00:00+01:00"
* requester = Reference(ProviderTasks-PractitionerRole-De-Haard) "A. de Haard, Huisarts"
* owner = Reference(ProviderTasks-Patient-Van-Duinen) "Tom van Duinen"

Instance: ProviderTasks-Task-Meetopdracht-Glucosemeting-10
InstanceOf: http://medmij.nl/fhir/StructureDefinition/pt-Task
Usage: #example
* text
  * status = #empty
  * div = "<div xmlns='http://www.w3.org/1999/xhtml'>No human-readable text provided in this case.</div>"
* extension
  * url = $koppeltaal-instantiates
  * valueReference = Reference(ProviderTasks-ActivityDefinition-Meetopdracht-Glucosemeting)
    * type = "ActivityDefinition"
* identifier
  * system = "http://medrie.nl/taskIdentifier"
  * value = "SUBTASK-Glucose-10"
* basedOn = Reference(ProviderTasks-ServiceRequestDigitalGroup-Diabetes) "Digitale zorgmodule Diabetes"
* status = #received
* intent = #order
* priority = #routine
* description = "Meet je bloedglucose (in de ochtend nuchter en in de avond voor het eten) en noteer de waarde in de app"
* focus = Reference(ProviderTasks-ServiceRequestExecution-Glucosemeting)
* for = Reference(ProviderTasks-Patient-Van-Duinen) "Tom van Duinen"
* executionPeriod
  * start = "2025-12-26T18:00:00+01:00"
  * end = "2025-12-26T00:00:00+01:00"
* authoredOn = "2025-12-22T08:00:00+01:00"
* lastModified = "2025-12-22T08:00:00+01:00"
* requester = Reference(ProviderTasks-PractitionerRole-De-Haard) "A. de Haard, Huisarts"
* owner = Reference(ProviderTasks-Patient-Van-Duinen) "Tom van Duinen"

Instance: ProviderTasks-Task-Meetopdracht-Glucosemeting-11
InstanceOf: http://medmij.nl/fhir/StructureDefinition/pt-Task
Usage: #example
* text
  * status = #empty
  * div = "<div xmlns='http://www.w3.org/1999/xhtml'>No human-readable text provided in this case.</div>"
* extension
  * url = $koppeltaal-instantiates
  * valueReference = Reference(ProviderTasks-ActivityDefinition-Meetopdracht-Glucosemeting)
    * type = "ActivityDefinition"
* identifier
  * system = "http://medrie.nl/taskIdentifier"
  * value = "SUBTASK-Glucose-11"
* basedOn = Reference(ProviderTasks-ServiceRequestDigitalGroup-Diabetes) "Digitale zorgmodule Diabetes"
* status = #received
* intent = #order
* priority = #routine
* description = "Meet je bloedglucose (in de ochtend nuchter en in de avond voor het eten) en noteer de waarde in de app"
* focus = Reference(ProviderTasks-ServiceRequestExecution-Glucosemeting)
* for = Reference(ProviderTasks-Patient-Van-Duinen) "Tom van Duinen"
* executionPeriod
  * start = "2025-12-27T08:00:00+01:00"
  * end = "2025-12-27T00:00:00+01:00"
* authoredOn = "2025-12-22T08:00:00+01:00"
* lastModified = "2025-12-22T08:00:00+01:00"
* requester = Reference(ProviderTasks-PractitionerRole-De-Haard) "A. de Haard, Huisarts"
* owner = Reference(ProviderTasks-Patient-Van-Duinen) "Tom van Duinen"

Instance: ProviderTasks-Task-Meetopdracht-Glucosemeting-12
InstanceOf: http://medmij.nl/fhir/StructureDefinition/pt-Task
Usage: #example
* text
  * status = #empty
  * div = "<div xmlns='http://www.w3.org/1999/xhtml'>No human-readable text provided in this case.</div>"
* extension
  * url = $koppeltaal-instantiates
  * valueReference = Reference(ProviderTasks-ActivityDefinition-Meetopdracht-Glucosemeting)
    * type = "ActivityDefinition"
* identifier
  * system = "http://medrie.nl/taskIdentifier"
  * value = "SUBTASK-Glucose-12"
* basedOn = Reference(ProviderTasks-ServiceRequestDigitalGroup-Diabetes) "Digitale zorgmodule Diabetes"
* status = #received
* intent = #order
* priority = #routine
* description = "Meet je bloedglucose (in de ochtend nuchter en in de avond voor het eten) en noteer de waarde in de app"
* focus = Reference(ProviderTasks-ServiceRequestExecution-Glucosemeting)
* for = Reference(ProviderTasks-Patient-Van-Duinen) "Tom van Duinen"
* executionPeriod
  * start = "2025-12-27T18:00:00+01:00"
  * end = "2025-12-27T00:00:00+01:00"
* authoredOn = "2025-12-22T08:00:00+01:00"
* lastModified = "2025-12-22T08:00:00+01:00"
* requester = Reference(ProviderTasks-PractitionerRole-De-Haard) "A. de Haard, Huisarts"
* owner = Reference(ProviderTasks-Patient-Van-Duinen) "Tom van Duinen"

Instance: ProviderTasks-Task-Meetopdracht-Glucosemeting-13
InstanceOf: http://medmij.nl/fhir/StructureDefinition/pt-Task
Usage: #example
* text
  * status = #empty
  * div = "<div xmlns='http://www.w3.org/1999/xhtml'>No human-readable text provided in this case.</div>"
* extension
  * url = $koppeltaal-instantiates
  * valueReference = Reference(ProviderTasks-ActivityDefinition-Meetopdracht-Glucosemeting)
    * type = "ActivityDefinition"
* identifier
  * system = "http://medrie.nl/taskIdentifier"
  * value = "SUBTASK-Glucose-13"
* basedOn = Reference(ProviderTasks-ServiceRequestDigitalGroup-Diabetes) "Digitale zorgmodule Diabetes"
* status = #received
* intent = #order
* priority = #routine
* description = "Meet je bloedglucose (in de ochtend nuchter en in de avond voor het eten) en noteer de waarde in de app"
* focus = Reference(ProviderTasks-ServiceRequestExecution-Glucosemeting)
* for = Reference(ProviderTasks-Patient-Van-Duinen) "Tom van Duinen"
* executionPeriod
  * start = "2025-12-28T08:00:00+01:00"
  * end = "2025-12-28T00:00:00+01:00"
* authoredOn = "2025-12-22T08:00:00+01:00"
* lastModified = "2025-12-22T08:00:00+01:00"
* requester = Reference(ProviderTasks-PractitionerRole-De-Haard) "A. de Haard, Huisarts"
* owner = Reference(ProviderTasks-Patient-Van-Duinen) "Tom van Duinen"

Instance: ProviderTasks-Task-Meetopdracht-Glucosemeting-14
InstanceOf: http://medmij.nl/fhir/StructureDefinition/pt-Task
Usage: #example
* text
  * status = #empty
  * div = "<div xmlns='http://www.w3.org/1999/xhtml'>No human-readable text provided in this case.</div>"
* extension
  * url = $koppeltaal-instantiates
  * valueReference = Reference(ProviderTasks-ActivityDefinition-Meetopdracht-Glucosemeting)
    * type = "ActivityDefinition"
* identifier
  * system = "http://medrie.nl/taskIdentifier"
  * value = "SUBTASK-Glucose-14"
* basedOn = Reference(ProviderTasks-ServiceRequestDigitalGroup-Diabetes) "Digitale zorgmodule Diabetes"
* status = #received
* intent = #order
* priority = #routine
* description = "Meet je bloedglucose (in de ochtend nuchter en in de avond voor het eten) en noteer de waarde in de app"
* for = Reference(ProviderTasks-Patient-Van-Duinen) "Tom van Duinen"
* executionPeriod
  * start = "2025-12-28T18:00:00+01:00"
  * end = "2025-12-28T00:00:00+01:00"
* authoredOn = "2025-12-22T08:00:00+01:00"
* lastModified = "2025-12-22T08:00:00+01:00"
* requester = Reference(ProviderTasks-PractitionerRole-De-Haard) "A. de Haard, Huisarts"
* owner = Reference(ProviderTasks-Patient-Van-Duinen) "Tom van Duinen"

Instance: ProviderTasks-ActivityDefinition-Informatie-Diabetes
InstanceOf: http://medmij.nl/fhir/StructureDefinition/pt-ActivityDefinition
Usage: #example
* text
  * status = #empty
  * div = "<div xmlns='http://www.w3.org/1999/xhtml'>No human-readable text provided in this case.</div>"
* extension
  * url = "http://koppeltaal.nl/fhir/StructureDefinition/KT2EndpointExtension"
  * valueReference = Reference(ProviderTasks-Endpoint-HINQ)
* identifier
  * system = "https://hing.zno.com/content/id"
  * value = "e767acd0-5928-4b0e-8310-e60e718b603d"
* url = "https://hing.zno.com/fhir/ActivityDefinition/6b7ac684-ab96-4f7f-a273-602837ae77e2"
* version = "1.0.0"
* name = "Informatie over diabetes type 2"
* title = "Wat is diabetes type 2?"
* status = #active
* publisher = "HinqZNO"
* description = "Voorlichtingsmodule ‘Wat is diabetes type 2?’: basisuitleg over het ziektebeeld, oorzaken/risicofactoren, klachten, metingen (glucose/HbA1c) en behandelprincipes (leefstijl en medicatie) ter ondersteuning van educatie en zelfmanagement."


Instance: ProviderTasks-Task-Informatie-Diabetes
InstanceOf: http://medmij.nl/fhir/StructureDefinition/pt-Task
Usage: #example
* text
  * status = #empty
  * div = "<div xmlns='http://www.w3.org/1999/xhtml'>No human-readable text provided in this case.</div>"
* extension
  * url = $koppeltaal-instantiates
  * valueReference = Reference(ProviderTasks-ActivityDefinition-Informatie-Diabetes)
    * type = "ActivityDefinition"
* identifier
  * system = "http://medrie.nl/taskIdentifier"
  * value = "TASK-Informatie-diabetes-12345"
* basedOn = Reference(ProviderTasks-ServiceRequestDigitalGroup-Diabetes) "Digitale zorgmodule Diabetes"
* status = #received
* intent = #order
* priority = #routine
* description = "Lees wat diabetes type 2 is en wat je zelf kunt doen"
* for = Reference(ProviderTasks-Patient-Van-Duinen) "Tom van Duinen"
* executionPeriod
  * start = "2025-12-22"
  * end = "2025-12-28"
* authoredOn = "2025-12-23T07:00:00+01:00"
* lastModified = "2025-12-23T07:00:00+01:00"
* requester = Reference(ProviderTasks-PractitionerRole-De-Haard) "A. de Haard, Huisarts"
* owner = Reference(ProviderTasks-Patient-Van-Duinen) "Tom van Duinen"

Instance: ProviderTasks-ActivityDefinition-Informatie-Gezonder-Leven
InstanceOf: http://medmij.nl/fhir/StructureDefinition/pt-ActivityDefinition
Usage: #example
* text
  * status = #empty
  * div = "<div xmlns='http://www.w3.org/1999/xhtml'>No human-readable text provided in this case.</div>"
* extension
  * url = "http://koppeltaal.nl/fhir/StructureDefinition/KT2EndpointExtension"
  * valueReference = Reference(ProviderTasks-Endpoint-HINQ)
* identifier
  * system = "https://hing.zno.com/content/id"
  * value = "801e6797-cb52-4020-847a-7440a15b5998"
* url = "https://hing.zno.com/fhir/ActivityDefinition/39318a5e-889d-48a5-8812-e59247743a0c"
* version = "1.0.0"
* name = "InformatieGezonderLeven"
* title = "Gezonder gaan leven"
* status = #active
* publisher = "HinqZNO"
* description = "Leefstijlmodule binnen de digitale zorgmodule Diabetes: praktische informatie en motivatie voor gezonder leven (voeding, beweging, gewicht, stoppen met roken, alcohol en slaap) ter ondersteuning van glykemische controle en cardiovasculair risicomanagement."

Instance: ProviderTasks-Task-Informatie-Gezonder-Leven
InstanceOf: http://medmij.nl/fhir/StructureDefinition/pt-Task
Usage: #example
* text
  * status = #empty
  * div = "<div xmlns='http://www.w3.org/1999/xhtml'>No human-readable text provided in this case.</div>"
* extension
  * url = $koppeltaal-instantiates
  * valueReference = Reference(ProviderTasks-ActivityDefinition-Informatie-Gezonder-Leven)
    * type = "ActivityDefinition"
* identifier
  * system = "http://medrie.nl/taskIdentifier"
  * value = "TASK-Informatie-Gezonderleven-6789"
* basedOn = Reference(ProviderTasks-ServiceRequestDigitalGroup-Diabetes) "Digitale zorgmodule Diabetes"
* status = #requested
* intent = #order
* priority = #routine
* description = "Lees tips voor gezonder leven (voeding, bewegen en volhouden)"
* for = Reference(ProviderTasks-Patient-Van-Duinen) "Tom van Duinen"
* executionPeriod
  * start = "2025-12-22"
  * end = "2025-12-28"
* authoredOn = "2025-12-24T07:00:00+01:00"
* lastModified = "2025-12-24T07:00:00+01:00"
* requester = Reference(ProviderTasks-PractitionerRole-De-Haard) "A. de Haard, Huisarts"
* owner = Reference(ProviderTasks-Patient-Van-Duinen) "Tom van Duinen"


Instance: ProviderTasks-ActivityDefinition-Vragenlijst-WoonLeefsituatie
InstanceOf: http://medmij.nl/fhir/StructureDefinition/pt-ActivityDefinition
Usage: #example
* text
  * status = #empty
  * div = "<div xmlns='http://www.w3.org/1999/xhtml'>No human-readable text provided in this case.</div>"
* extension
  * url = "http://koppeltaal.nl/fhir/StructureDefinition/KT2EndpointExtension"
  * valueReference = Reference(ProviderTasks-Endpoint-HINQ)
* identifier
  * system = "https://hinq.zno.com/content/id"
  * value = "d11eb00f-8659-4af2-97bf-1a0b656e0b4d"
* url = "https://hing.zno.com/fhir/ActivityDefinition/1bd9c3ed-1862-4e7e-a057-ac75278a8a5a"
* version = "1.0.0"
* name = "VragenlijstWoonLeefsituatie"
* title = "Vragenlijst over de woon- leefsituatie"
* status = #active
* publisher = "HinqZNO"
* description = "Vragenlijst woon-/leefsituatie binnen de digitale zorgmodule Diabetes om contextfactoren (wonen, dagelijks functioneren, ondersteuning, leefstijl en mogelijkheden/belemmeringen) in kaart te brengen als basis voor persoonsgerichte begeleiding en haalbare leefstijlafspraken."


Instance: ProviderTasks-Task-Vragenlijst-WoonLeefsituatie
InstanceOf: http://medmij.nl/fhir/StructureDefinition/pt-Task
Usage: #example
* text
  * status = #empty
  * div = "<div xmlns='http://www.w3.org/1999/xhtml'>No human-readable text provided in this case.</div>"
* extension
  * url = $koppeltaal-instantiates
  * valueReference = Reference(ProviderTasks-ActivityDefinition-Vragenlijst-WoonLeefsituatie)
    * type = "ActivityDefinition"
* identifier
  * system = "http://medrie.nl/taskIdentifier"
  * value = "TASK-Vragenlijst-Woonsituatie-9642"
* basedOn = Reference(ProviderTasks-ServiceRequestDigitalGroup-Diabetes) "Digitale zorgmodule Diabetes"
* status = #requested
* intent = #order
* priority = #routine
* description = "Vul de vragenlijst in over je woon/leefsituatie"
* for = Reference(ProviderTasks-Patient-Van-Duinen) "Tom van Duinen"
* executionPeriod
  * start = "2025-12-22"
  * end = "2025-12-28"
* authoredOn = "2025-12-23T18:00:00+01:00"
* lastModified = "2025-12-23T18:00:00+01:00"
* requester = Reference(ProviderTasks-PractitionerRole-De-Haard) "A. de Haard, Huisarts"
* owner = Reference(ProviderTasks-Patient-Van-Duinen) "Tom van Duinen"

Instance: ProviderTasks-Endpoint-HINQ
InstanceOf: http://medmij.nl/fhir/StructureDefinition/pt-Endpoint
Usage: #example
* text
  * status = #empty
  * div = "<div xmlns='http://www.w3.org/1999/xhtml'>No human-readable text provided in this case.</div>"
* extension
  * url = $client-id
  * valueString = "dvaAanbiedertakensweb"
* status = #active
* connectionType = http://terminology.hl7.org/CodeSystem/endpoint-connection-type#hl7-fhir-rest
* managingOrganization = Reference(ProviderTasks-Organization-Huisartsenpraktijk-De-Haard)
* payloadType = $endpoint-payload-type#any
* address = "https://module.test.5im.nl/web/api/smartonfhir/launch"

Instance: ProviderTasks-Patient-Van-Duinen
InstanceOf: http://nictiz.nl/fhir/StructureDefinition/nl-core-Patient
Usage: #example
* text
  * status = #empty
  * div = "<div xmlns='http://www.w3.org/1999/xhtml'>No human-readable text provided in this case.</div>"
* extension[http://hl7.org/fhir/StructureDefinition/patient-nationality].extension[code].valueCodeableConcept = urn:oid:2.16.840.1.113883.2.4.4.16.32#0001 "Nederlandse"
* identifier
  * system = "http://fhir.nl/fhir/NamingSystem/bsn"
  * value.extension[http://hl7.org/fhir/StructureDefinition/data-absent-reason].valueCode = #masked // gemaskeerd BSN
* name[0]
  * use = #official
  * text = "Tom van Duinen"
  * family = "van Duinen"
    * extension[http://hl7.org/fhir/StructureDefinition/humanname-own-prefix].valueString = "van"
    * extension[http://hl7.org/fhir/StructureDefinition/humanname-own-name].valueString = "Duinen"
  * given = "Erik"
    * extension[http://hl7.org/fhir/StructureDefinition/iso21090-EN-qualifier].valueCode = #BR
* name[1]
  * use = #usual
  * given = "Tom"
* telecom[0]
  * system = #phone
    * extension[http://nictiz.nl/fhir/StructureDefinition/ext-CodeSpecification].valueCodeableConcept = http://terminology.hl7.org/CodeSystem/v3-AddressUse#MC "mobile contact"
  * value = "+31612345600"
* telecom[1]
  * system = #email
  * value = "tomvanduinen@tom.com"
  * use = #home
* gender = #male
  * extension[http://nictiz.nl/fhir/StructureDefinition/ext-CodeSpecification].valueCodeableConcept.coding = http://terminology.hl7.org/CodeSystem/v3-AdministrativeGender#M "Male"
* birthDate = "1961-08-02"
* deceasedBoolean = false
* address
  * extension[http://nictiz.nl/fhir/StructureDefinition/ext-AddressInformation.AddressType].valueCodeableConcept = http://terminology.hl7.org/CodeSystem/v3-AddressUse#HP "primary home"
  * use = #home
  * type = #both
  * line = "Maanweg 174"
    * extension[http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-streetName].valueString = "Maanweg"
    * extension[http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-houseNumber].valueString = "174"
  * city = "Den Haag"
  * postalCode = "2516 AB"
  * country = "Nederland"
    * extension[http://nictiz.nl/fhir/StructureDefinition/ext-CodeSpecification].valueCodeableConcept = urn:iso:std:iso:3166#NL "Netherlands"

Instance: ProviderTasks-PractitionerRole-De-Haard
InstanceOf: http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthProfessional-PractitionerRole
Usage: #example
* text
  * status = #empty
  * div = "<div xmlns='http://www.w3.org/1999/xhtml'>No human-readable text provided in this case.</div>"
* practitioner = Reference(ProviderTasks-Practitioner-De-Haard) "A. de Haard"
* organization = Reference(ProviderTasks-Organization-Huisartsenpraktijk-De-Haard) "Huisartstenpraktijk de Haard"
* specialty
  * coding = urn:oid:2.16.840.1.113883.2.4.6.7#0110 "Huisarts, apotheekhoudend"

Instance: ProviderTasks-Practitioner-De-Haard
InstanceOf: http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthProfessional-Practitioner
Usage: #example
* text
  * status = #empty
  * div = "<div xmlns='http://www.w3.org/1999/xhtml'>No human-readable text provided in this case.</div>"
* identifier
  * system = "http://fhir.nl/fhir/NamingSystem/big"
  * value = "12070100"
* name
  * use = #official
  * text = "A. de Haard"
  * family = "de Haard"
    * extension[http://hl7.org/fhir/StructureDefinition/humanname-own-prefix].valueString = "de"
    * extension[http://hl7.org/fhir/StructureDefinition/humanname-own-name].valueString = "Haard"
  * given[0] = "A."
    * extension[http://hl7.org/fhir/StructureDefinition/iso21090-EN-qualifier].valueCode = #IN
* telecom[0]
  * system = #phone
  * value = "+31612345600"
  * use = #work
* telecom[1]
  * system = #email
  * value = "dehaard@huisarts.nl"
  * use = #work

Instance: ProviderTasks-Organization-Huisartsenpraktijk-De-Haard
InstanceOf: http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthcareProvider-Organization
Usage: #example
* text
  * status = #empty
  * div = "<div xmlns='http://www.w3.org/1999/xhtml'>No human-readable text provided in this case.</div>"
* identifier
  * system = "http://fhir.nl/fhir/NamingSystem/agb-z"
  * value = "01010235"
* name = "Huisartsenpraktijk de Haard"
* telecom[0]
  * system = #phone
  * value = "+31653603740"
  * use = #work
* telecom[1]
  * system = #email
  * value = "huisartsenpraktijk-dehaard@huisarts.nl"
  * use = #work
* address
  * extension[http://nictiz.nl/fhir/StructureDefinition/ext-AddressInformation.AddressType].valueCodeableConcept = http://terminology.hl7.org/CodeSystem/v3-AddressUse#WP "Work Place"
  * use = #work
  * line = "Dr. Klinkertweg 18"
    * extension[http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-streetName].valueString = "Dr. Klinkertweg"
    * extension[http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-houseNumber].valueString = "18"
  * city = "Zwolle"
  * postalCode = "8004 DB"