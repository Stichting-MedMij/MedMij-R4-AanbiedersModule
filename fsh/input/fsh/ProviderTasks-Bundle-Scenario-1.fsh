// Bundle with FHIR test instances in FSH format for ProviderTasks test scenario 1
Instance: ServiceRequest-ProviderTasks-Execution-Glucosemeting-Van-Duinen
InstanceOf: http://medmij.nl/fhir/StructureDefinition/pt-ExecutionOrder
Usage: #example
* text
  * status = #empty
  * div = "<div xmlns='http://www.w3.org/1999/xhtml'>No human-readable text provided in this case.</div>"
* identifier
  * system = "http://medrie/servicerequest/id"
  * value = "2025-00001234"
* status = #active
* intent = #order
* subject = Reference(Patient-ProviderTasks-Van-Duinen) "Tom van Duinen"
* occurrenceTiming.repeat
  * boundsPeriod.start = "2025-12-22"
  * boundsPeriod.end = "2025-12-28"
  * period = 1
  * periodUnit = #d
  * frequency = 2
  * frequencyMax = 2
* requester = Reference(PractitionerRole-ProviderTasks-De-Haard) "A. de Haard, Huisarts"
* patientInstruction = "Meet 7 dagen, 2 keer per dag, uw bloedglucose: nuchter vóór het ontbijt en vóór het avondeten."

Instance: ServiceRequest-ProviderTasks-DigitalGroup-Diabetes-Van-Duinen
InstanceOf: http://medmij.nl/fhir/StructureDefinition/pt-DigitalGroupPlan
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
* subject = Reference(Patient-ProviderTasks-Van-Duinen) "Tom van Duinen"
* requester = Reference(PractitionerRole-ProviderTasks-De-Haard) "A. de Haard, Huisarts"

Instance: ActivityDefinition-ProviderTasks-Glucosemeting-Van-Duinen
InstanceOf: http://medmij.nl/fhir/StructureDefinition/pt-DigitalActivity
Usage: #example
* text
  * status = #empty
  * div = "<div xmlns='http://www.w3.org/1999/xhtml'>No human-readable text provided in this case.</div>"
* extension
  * url = "http://medmij.nl/fhir/StructureDefinition/ext-Endpoint"
  * valueReference = Reference(Endpoint-ProviderTasks-HINQ)
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


Instance: Task-ProviderTasks-Glucosemeting-1-Van-Duinen
InstanceOf: http://medmij.nl/fhir/StructureDefinition/pt-Task
Usage: #example
* meta.tag
  * system = "http://medmij.nl/fhir/CodeSystem/information-standard"
  * code = #providertasks
* text
  * status = #empty
  * div = "<div xmlns='http://www.w3.org/1999/xhtml'>No human-readable text provided in this case.</div>"
* extension
  * url = $pt-digital-activity
  * valueReference = Reference(ActivityDefinition-ProviderTasks-Glucosemeting-Van-Duinen)
    * type = "ActivityDefinition"
* identifier
  * system = "http://medrie.nl/taskIdentifier"
  * value = "TASK-Glucose-1"
* basedOn = Reference(ServiceRequest-ProviderTasks-DigitalGroup-Diabetes-Van-Duinen) "Digitale zorgmodule Diabetes"
* status = #completed
* intent = #order
* priority = #routine
* description = "Deze meting helpt om inzicht te krijgen in de bloedsuikerspiegel."
* focus = Reference(ServiceRequest-ProviderTasks-Execution-Glucosemeting-Van-Duinen)
* for = Reference(Patient-ProviderTasks-Van-Duinen) "Tom van Duinen"
* executionPeriod
  * start = "2025-12-22T08:00:00+01:00"
  * end = "2025-12-22T23:59:00+01:00"
* authoredOn = "2025-12-22T08:00:00+01:00"
* lastModified = "2025-12-22T08:00:00+01:00"
* requester = Reference(PractitionerRole-ProviderTasks-De-Haard) "A. de Haard, Huisarts"
* owner = Reference(Patient-ProviderTasks-Van-Duinen) "Tom van Duinen"

Instance: Task-ProviderTasks-Glucosemeting-2-Van-Duinen
InstanceOf: http://medmij.nl/fhir/StructureDefinition/pt-Task
Usage: #example
* meta.tag
  * system = "http://medmij.nl/fhir/CodeSystem/information-standard"
  * code = #providertasks
* text
  * status = #empty
  * div = "<div xmlns='http://www.w3.org/1999/xhtml'>No human-readable text provided in this case.</div>"
* extension
  * url = $pt-digital-activity
  * valueReference = Reference(ActivityDefinition-ProviderTasks-Glucosemeting-Van-Duinen)
    * type = "ActivityDefinition"
* identifier
  * system = "http://medrie.nl/taskIdentifier"
  * value = "TASK-Glucose-2"
* basedOn = Reference(ServiceRequest-ProviderTasks-DigitalGroup-Diabetes-Van-Duinen) "Digitale zorgmodule Diabetes"
* status = #completed
* intent = #order
* priority = #routine
* description = "Deze meting helpt om inzicht te krijgen in de bloedsuikerspiegel."
* focus = Reference(ServiceRequest-ProviderTasks-Execution-Glucosemeting-Van-Duinen)
* for = Reference(Patient-ProviderTasks-Van-Duinen) "Tom van Duinen"
* executionPeriod
  * start = "2025-12-22T08:00:00+01:00"
  * end = "2025-12-22T23:59:00+01:00"
* authoredOn = "2025-12-22T08:00:00+01:00"
* lastModified = "2025-12-22T08:00:00+01:00"
* requester = Reference(PractitionerRole-ProviderTasks-De-Haard) "A. de Haard, Huisarts"
* owner = Reference(Patient-ProviderTasks-Van-Duinen) "Tom van Duinen"

Instance: Task-ProviderTasks-Glucosemeting-3-Van-Duinen
InstanceOf: http://medmij.nl/fhir/StructureDefinition/pt-Task
Usage: #example
* meta.tag
  * system = "http://medmij.nl/fhir/CodeSystem/information-standard"
  * code = #providertasks
* text
  * status = #empty
  * div = "<div xmlns='http://www.w3.org/1999/xhtml'>No human-readable text provided in this case.</div>"
* extension
  * url = $pt-digital-activity
  * valueReference = Reference(ActivityDefinition-ProviderTasks-Glucosemeting-Van-Duinen)
    * type = "ActivityDefinition"
* identifier
  * system = "http://medrie.nl/taskIdentifier"
  * value = "TASK-Glucose-3"
* basedOn = Reference(ServiceRequest-ProviderTasks-DigitalGroup-Diabetes-Van-Duinen) "Digitale zorgmodule Diabetes"
* status = #completed
* intent = #order
* priority = #routine
* description = "Deze meting helpt om inzicht te krijgen in de bloedsuikerspiegel."
* focus = Reference(ServiceRequest-ProviderTasks-Execution-Glucosemeting-Van-Duinen)
* for = Reference(Patient-ProviderTasks-Van-Duinen) "Tom van Duinen"
* executionPeriod
  * start = "2025-12-23T08:00:00+01:00"
  * end = "2025-12-23T23:59:00+01:00"
* authoredOn = "2025-12-22T08:00:00+01:00"
* lastModified = "2025-12-22T08:00:00+01:00"
* requester = Reference(PractitionerRole-ProviderTasks-De-Haard) "A. de Haard, Huisarts"
* owner = Reference(Patient-ProviderTasks-Van-Duinen) "Tom van Duinen"

Instance: Task-ProviderTasks-Glucosemeting-4-Van-Duinen
InstanceOf: http://medmij.nl/fhir/StructureDefinition/pt-Task
Usage: #example
* meta.tag
  * system = "http://medmij.nl/fhir/CodeSystem/information-standard"
  * code = #providertasks
* text
  * status = #empty
  * div = "<div xmlns='http://www.w3.org/1999/xhtml'>No human-readable text provided in this case.</div>"
* extension
  * url = $pt-digital-activity
  * valueReference = Reference(ActivityDefinition-ProviderTasks-Glucosemeting-Van-Duinen)
    * type = "ActivityDefinition"
* identifier
  * system = "http://medrie.nl/taskIdentifier"
  * value = "TASK-Glucose-4"
* basedOn = Reference(ServiceRequest-ProviderTasks-DigitalGroup-Diabetes-Van-Duinen) "Digitale zorgmodule Diabetes"
* status = #cancelled
* intent = #order
* priority = #routine
* description = "Deze meting helpt om inzicht te krijgen in de bloedsuikerspiegel."
* focus = Reference(ServiceRequest-ProviderTasks-Execution-Glucosemeting-Van-Duinen)
* for = Reference(Patient-ProviderTasks-Van-Duinen) "Tom van Duinen"
* executionPeriod
  * start = "2025-12-23T18:00:00+01:00"
  * end = "2025-12-23T23:59:00+01:00"
* authoredOn = "2025-12-22T08:00:00+01:00"
* lastModified = "2025-12-22T08:00:00+01:00"
* requester = Reference(PractitionerRole-ProviderTasks-De-Haard) "A. de Haard, Huisarts"
* owner = Reference(Patient-ProviderTasks-Van-Duinen) "Tom van Duinen"

Instance: Task-ProviderTasks-Glucosemeting-5-Van-Duinen
InstanceOf: http://medmij.nl/fhir/StructureDefinition/pt-Task
Usage: #example
* meta.tag
  * system = "http://medmij.nl/fhir/CodeSystem/information-standard"
  * code = #providertasks
* text
  * status = #empty
  * div = "<div xmlns='http://www.w3.org/1999/xhtml'>No human-readable text provided in this case.</div>"
* extension
  * url = $pt-digital-activity
  * valueReference = Reference(ActivityDefinition-ProviderTasks-Glucosemeting-Van-Duinen)
    * type = "ActivityDefinition"
* identifier
  * system = "http://medrie.nl/taskIdentifier"
  * value = "TASK-Glucose-5"
* basedOn = Reference(ServiceRequest-ProviderTasks-DigitalGroup-Diabetes-Van-Duinen) "Digitale zorgmodule Diabetes"
* status = #received
* intent = #order
* priority = #routine
* description = "Deze meting helpt om inzicht te krijgen in de bloedsuikerspiegel."
* focus = Reference(ServiceRequest-ProviderTasks-Execution-Glucosemeting-Van-Duinen)
* for = Reference(Patient-ProviderTasks-Van-Duinen) "Tom van Duinen"
* executionPeriod
  * start = "2025-12-24T08:00:00+01:00"
  * end = "2025-12-24T23:59:00+01:00"
* authoredOn = "2025-12-22T08:00:00+01:00"
* lastModified = "2025-12-22T08:00:00+01:00"
* requester = Reference(PractitionerRole-ProviderTasks-De-Haard) "A. de Haard, Huisarts"
* owner = Reference(Patient-ProviderTasks-Van-Duinen) "Tom van Duinen"

Instance: Task-ProviderTasks-Glucosemeting-6-Van-Duinen
InstanceOf: http://medmij.nl/fhir/StructureDefinition/pt-Task
Usage: #example
* meta.tag
  * system = "http://medmij.nl/fhir/CodeSystem/information-standard"
  * code = #providertasks
* text
  * status = #empty
  * div = "<div xmlns='http://www.w3.org/1999/xhtml'>No human-readable text provided in this case.</div>"
* extension
  * url = $pt-digital-activity
  * valueReference = Reference(ActivityDefinition-ProviderTasks-Glucosemeting-Van-Duinen)
    * type = "ActivityDefinition"
* identifier
  * system = "http://medrie.nl/taskIdentifier"
  * value = "TASK-Glucose-6"
* basedOn = Reference(ServiceRequest-ProviderTasks-DigitalGroup-Diabetes-Van-Duinen) "Digitale zorgmodule Diabetes"
* status = #received
* intent = #order
* priority = #routine
* description = "Deze meting helpt om inzicht te krijgen in de bloedsuikerspiegel."
* focus = Reference(ServiceRequest-ProviderTasks-Execution-Glucosemeting-Van-Duinen)
* for = Reference(Patient-ProviderTasks-Van-Duinen) "Tom van Duinen"
* executionPeriod
  * start = "2025-12-24T18:00:00+01:00"
  * end = "2025-12-24T23:59:00+01:00"
* authoredOn = "2025-12-22T08:00:00+01:00"
* lastModified = "2025-12-22T08:00:00+01:00"
* requester = Reference(PractitionerRole-ProviderTasks-De-Haard) "A. de Haard, Huisarts"
* owner = Reference(Patient-ProviderTasks-Van-Duinen) "Tom van Duinen"

Instance: Task-ProviderTasks-Glucosemeting-7-Van-Duinen
InstanceOf: http://medmij.nl/fhir/StructureDefinition/pt-Task
Usage: #example
* meta.tag
  * system = "http://medmij.nl/fhir/CodeSystem/information-standard"
  * code = #providertasks
* text
  * status = #empty
  * div = "<div xmlns='http://www.w3.org/1999/xhtml'>No human-readable text provided in this case.</div>"
* extension
  * url = $pt-digital-activity
  * valueReference = Reference(ActivityDefinition-ProviderTasks-Glucosemeting-Van-Duinen)
    * type = "ActivityDefinition"
* identifier
  * system = "http://medrie.nl/taskIdentifier"
  * value = "TASK-Glucose-7"
* basedOn = Reference(ServiceRequest-ProviderTasks-DigitalGroup-Diabetes-Van-Duinen) "Digitale zorgmodule Diabetes"
* status = #received
* intent = #order
* priority = #routine
* description = "Deze meting helpt om inzicht te krijgen in de bloedsuikerspiegel."
* focus = Reference(ServiceRequest-ProviderTasks-Execution-Glucosemeting-Van-Duinen)
* for = Reference(Patient-ProviderTasks-Van-Duinen) "Tom van Duinen"
* executionPeriod
  * start = "2025-12-25T08:00:00+01:00"
  * end = "2025-12-25T23:59:00+01:00"
* authoredOn = "2025-12-22T08:00:00+01:00"
* lastModified = "2025-12-22T08:00:00+01:00"
* requester = Reference(PractitionerRole-ProviderTasks-De-Haard) "A. de Haard, Huisarts"
* owner = Reference(Patient-ProviderTasks-Van-Duinen) "Tom van Duinen"

Instance: Task-ProviderTasks-Glucosemeting-8-Van-Duinen
InstanceOf: http://medmij.nl/fhir/StructureDefinition/pt-Task
Usage: #example
* meta.tag
  * system = "http://medmij.nl/fhir/CodeSystem/information-standard"
  * code = #providertasks
* text
  * status = #empty
  * div = "<div xmlns='http://www.w3.org/1999/xhtml'>No human-readable text provided in this case.</div>"
* extension
  * url = $pt-digital-activity
  * valueReference = Reference(ActivityDefinition-ProviderTasks-Glucosemeting-Van-Duinen)
    * type = "ActivityDefinition"
* identifier
  * system = "http://medrie.nl/taskIdentifier"
  * value = "TASK-Glucose-8"
* basedOn = Reference(ServiceRequest-ProviderTasks-DigitalGroup-Diabetes-Van-Duinen) "Digitale zorgmodule Diabetes"
* status = #received
* intent = #order
* priority = #routine
* description = "Deze meting helpt om inzicht te krijgen in de bloedsuikerspiegel."
* focus = Reference(ServiceRequest-ProviderTasks-Execution-Glucosemeting-Van-Duinen)
* for = Reference(Patient-ProviderTasks-Van-Duinen) "Tom van Duinen"
* executionPeriod
  * start = "2025-12-25T18:00:00+01:00"
  * end = "2025-12-25T23:59:00+01:00"
* authoredOn = "2025-12-22T08:00:00+01:00"
* lastModified = "2025-12-22T08:00:00+01:00"
* requester = Reference(PractitionerRole-ProviderTasks-De-Haard) "A. de Haard, Huisarts"
* owner = Reference(Patient-ProviderTasks-Van-Duinen) "Tom van Duinen"

Instance: Task-ProviderTasks-Glucosemeting-9-Van-Duinen
InstanceOf: http://medmij.nl/fhir/StructureDefinition/pt-Task
Usage: #example
* meta.tag
  * system = "http://medmij.nl/fhir/CodeSystem/information-standard"
  * code = #providertasks
* text
  * status = #empty
  * div = "<div xmlns='http://www.w3.org/1999/xhtml'>No human-readable text provided in this case.</div>"
* extension
  * url = $pt-digital-activity
  * valueReference = Reference(ActivityDefinition-ProviderTasks-Glucosemeting-Van-Duinen)
    * type = "ActivityDefinition"
* identifier
  * system = "http://medrie.nl/taskIdentifier"
  * value = "TASK-Glucose-9"
* basedOn = Reference(ServiceRequest-ProviderTasks-DigitalGroup-Diabetes-Van-Duinen) "Digitale zorgmodule Diabetes"
* status = #received
* intent = #order
* priority = #routine
* description = "Deze meting helpt om inzicht te krijgen in de bloedsuikerspiegel."
* focus = Reference(ServiceRequest-ProviderTasks-Execution-Glucosemeting-Van-Duinen)
* for = Reference(Patient-ProviderTasks-Van-Duinen) "Tom van Duinen"
* executionPeriod
  * start = "2025-12-26T08:00:00+01:00"
  * end = "2025-12-26T23:59:00+01:00"
* authoredOn = "2025-12-22T08:00:00+01:00"
* lastModified = "2025-12-22T08:00:00+01:00"
* requester = Reference(PractitionerRole-ProviderTasks-De-Haard) "A. de Haard, Huisarts"
* owner = Reference(Patient-ProviderTasks-Van-Duinen) "Tom van Duinen"

Instance: Task-ProviderTasks-Glucosemeting-10-Van-Duinen
InstanceOf: http://medmij.nl/fhir/StructureDefinition/pt-Task
Usage: #example
* meta.tag
  * system = "http://medmij.nl/fhir/CodeSystem/information-standard"
  * code = #providertasks
* text
  * status = #empty
  * div = "<div xmlns='http://www.w3.org/1999/xhtml'>No human-readable text provided in this case.</div>"
* extension
  * url = $pt-digital-activity
  * valueReference = Reference(ActivityDefinition-ProviderTasks-Glucosemeting-Van-Duinen)
    * type = "ActivityDefinition"
* identifier
  * system = "http://medrie.nl/taskIdentifier"
  * value = "TASK-Glucose-10"
* basedOn = Reference(ServiceRequest-ProviderTasks-DigitalGroup-Diabetes-Van-Duinen) "Digitale zorgmodule Diabetes"
* status = #received
* intent = #order
* priority = #routine
* description = "Deze meting helpt om inzicht te krijgen in de bloedsuikerspiegel."
* focus = Reference(ServiceRequest-ProviderTasks-Execution-Glucosemeting-Van-Duinen)
* for = Reference(Patient-ProviderTasks-Van-Duinen) "Tom van Duinen"
* executionPeriod
  * start = "2025-12-26T18:00:00+01:00"
  * end = "2025-12-26T23:59:00+01:00"
* authoredOn = "2025-12-22T08:00:00+01:00"
* lastModified = "2025-12-22T08:00:00+01:00"
* requester = Reference(PractitionerRole-ProviderTasks-De-Haard) "A. de Haard, Huisarts"
* owner = Reference(Patient-ProviderTasks-Van-Duinen) "Tom van Duinen"

Instance: Task-ProviderTasks-Glucosemeting-11-Van-Duinen
InstanceOf: http://medmij.nl/fhir/StructureDefinition/pt-Task
Usage: #example
* meta.tag
  * system = "http://medmij.nl/fhir/CodeSystem/information-standard"
  * code = #providertasks
* text
  * status = #empty
  * div = "<div xmlns='http://www.w3.org/1999/xhtml'>No human-readable text provided in this case.</div>"
* extension
  * url = $pt-digital-activity
  * valueReference = Reference(ActivityDefinition-ProviderTasks-Glucosemeting-Van-Duinen)
    * type = "ActivityDefinition"
* identifier
  * system = "http://medrie.nl/taskIdentifier"
  * value = "TASK-Glucose-11"
* basedOn = Reference(ServiceRequest-ProviderTasks-DigitalGroup-Diabetes-Van-Duinen) "Digitale zorgmodule Diabetes"
* status = #received
* intent = #order
* priority = #routine
* description = "Deze meting helpt om inzicht te krijgen in de bloedsuikerspiegel."
* focus = Reference(ServiceRequest-ProviderTasks-Execution-Glucosemeting-Van-Duinen)
* for = Reference(Patient-ProviderTasks-Van-Duinen) "Tom van Duinen"
* executionPeriod
  * start = "2025-12-27T08:00:00+01:00"
  * end = "2025-12-27T23:59:00+01:00"
* authoredOn = "2025-12-22T08:00:00+01:00"
* lastModified = "2025-12-22T08:00:00+01:00"
* requester = Reference(PractitionerRole-ProviderTasks-De-Haard) "A. de Haard, Huisarts"
* owner = Reference(Patient-ProviderTasks-Van-Duinen) "Tom van Duinen"

Instance: Task-ProviderTasks-Glucosemeting-12-Van-Duinen
InstanceOf: http://medmij.nl/fhir/StructureDefinition/pt-Task
Usage: #example
* meta.tag
  * system = "http://medmij.nl/fhir/CodeSystem/information-standard"
  * code = #providertasks
* text
  * status = #empty
  * div = "<div xmlns='http://www.w3.org/1999/xhtml'>No human-readable text provided in this case.</div>"
* extension
  * url = $pt-digital-activity
  * valueReference = Reference(ActivityDefinition-ProviderTasks-Glucosemeting-Van-Duinen)
    * type = "ActivityDefinition"
* identifier
  * system = "http://medrie.nl/taskIdentifier"
  * value = "TASK-Glucose-12"
* basedOn = Reference(ServiceRequest-ProviderTasks-DigitalGroup-Diabetes-Van-Duinen) "Digitale zorgmodule Diabetes"
* status = #received
* intent = #order
* priority = #routine
* description = "Deze meting helpt om inzicht te krijgen in de bloedsuikerspiegel."
* focus = Reference(ServiceRequest-ProviderTasks-Execution-Glucosemeting-Van-Duinen)
* for = Reference(Patient-ProviderTasks-Van-Duinen) "Tom van Duinen"
* executionPeriod
  * start = "2025-12-27T18:00:00+01:00"
  * end = "2025-12-27T23:59:00+01:00"
* authoredOn = "2025-12-22T08:00:00+01:00"
* lastModified = "2025-12-22T08:00:00+01:00"
* requester = Reference(PractitionerRole-ProviderTasks-De-Haard) "A. de Haard, Huisarts"
* owner = Reference(Patient-ProviderTasks-Van-Duinen) "Tom van Duinen"

Instance: Task-ProviderTasks-Glucosemeting-13-Van-Duinen
InstanceOf: http://medmij.nl/fhir/StructureDefinition/pt-Task
Usage: #example
* meta.tag
  * system = "http://medmij.nl/fhir/CodeSystem/information-standard"
  * code = #providertasks
* text
  * status = #empty
  * div = "<div xmlns='http://www.w3.org/1999/xhtml'>No human-readable text provided in this case.</div>"
* extension
  * url = $pt-digital-activity
  * valueReference = Reference(ActivityDefinition-ProviderTasks-Glucosemeting-Van-Duinen)
    * type = "ActivityDefinition"
* identifier
  * system = "http://medrie.nl/taskIdentifier"
  * value = "TASK-Glucose-13"
* basedOn = Reference(ServiceRequest-ProviderTasks-DigitalGroup-Diabetes-Van-Duinen) "Digitale zorgmodule Diabetes"
* status = #received
* intent = #order
* priority = #routine
* description = "Deze meting helpt om inzicht te krijgen in de bloedsuikerspiegel."
* focus = Reference(ServiceRequest-ProviderTasks-Execution-Glucosemeting-Van-Duinen)
* for = Reference(Patient-ProviderTasks-Van-Duinen) "Tom van Duinen"
* executionPeriod
  * start = "2025-12-28T08:00:00+01:00"
  * end = "2025-12-28T23:59:00+01:00"
* authoredOn = "2025-12-22T08:00:00+01:00"
* lastModified = "2025-12-22T08:00:00+01:00"
* requester = Reference(PractitionerRole-ProviderTasks-De-Haard) "A. de Haard, Huisarts"
* owner = Reference(Patient-ProviderTasks-Van-Duinen) "Tom van Duinen"

Instance: Task-ProviderTasks-Glucosemeting-14-Van-Duinen
InstanceOf: http://medmij.nl/fhir/StructureDefinition/pt-Task
Usage: #example
* meta.tag
  * system = "http://medmij.nl/fhir/CodeSystem/information-standard"
  * code = #providertasks
* text
  * status = #empty
  * div = "<div xmlns='http://www.w3.org/1999/xhtml'>No human-readable text provided in this case.</div>"
* extension
  * url = $pt-digital-activity
  * valueReference = Reference(ActivityDefinition-ProviderTasks-Glucosemeting-Van-Duinen)
    * type = "ActivityDefinition"
* identifier
  * system = "http://medrie.nl/taskIdentifier"
  * value = "TASK-Glucose-14"
* basedOn = Reference(ServiceRequest-ProviderTasks-DigitalGroup-Diabetes-Van-Duinen) "Digitale zorgmodule Diabetes"
* status = #received
* intent = #order
* priority = #routine
* description = "Deze meting helpt om inzicht te krijgen in de bloedsuikerspiegel."
* for = Reference(Patient-ProviderTasks-Van-Duinen) "Tom van Duinen"
* executionPeriod
  * start = "2025-12-28T18:00:00+01:00"
  * end = "2025-12-28T23:59:00+01:00"
* authoredOn = "2025-12-22T08:00:00+01:00"
* lastModified = "2025-12-22T08:00:00+01:00"
* requester = Reference(PractitionerRole-ProviderTasks-De-Haard) "A. de Haard, Huisarts"
* owner = Reference(Patient-ProviderTasks-Van-Duinen) "Tom van Duinen"

Instance: ActivityDefinition-ProviderTasks-Informatie-Diabetes-Van-Duinen
InstanceOf: http://medmij.nl/fhir/StructureDefinition/pt-DigitalActivity
Usage: #example
* text
  * status = #empty
  * div = "<div xmlns='http://www.w3.org/1999/xhtml'>No human-readable text provided in this case.</div>"
* extension
  * url = "http://medmij.nl/fhir/StructureDefinition/ext-Endpoint"
  * valueReference = Reference(Endpoint-ProviderTasks-HINQ)
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


Instance: Task-ProviderTasks-Informatie-Diabetes-Van-Duinen
InstanceOf: http://medmij.nl/fhir/StructureDefinition/pt-Task
Usage: #example
* meta.tag
  * system = "http://medmij.nl/fhir/CodeSystem/information-standard"
  * code = #providertasks
* text
  * status = #empty
  * div = "<div xmlns='http://www.w3.org/1999/xhtml'>No human-readable text provided in this case.</div>"
* extension
  * url = $pt-digital-activity
  * valueReference = Reference(ActivityDefinition-ProviderTasks-Informatie-Diabetes-Van-Duinen)
    * type = "ActivityDefinition"
* identifier
  * system = "http://medrie.nl/taskIdentifier"
  * value = "TASK-Informatie-diabetes-12345"
* basedOn = Reference(ServiceRequest-ProviderTasks-DigitalGroup-Diabetes-Van-Duinen) "Digitale zorgmodule Diabetes"
* status = #received
* intent = #order
* priority = #routine
* description = "Lees wat diabetes type 2 is en wat je zelf kunt doen"
* for = Reference(Patient-ProviderTasks-Van-Duinen) "Tom van Duinen"
* executionPeriod
  * start = "2025-12-22"
  * end = "2025-12-28"
* authoredOn = "2025-12-23T07:00:00+01:00"
* lastModified = "2025-12-23T07:00:00+01:00"
* requester = Reference(PractitionerRole-ProviderTasks-De-Haard) "A. de Haard, Huisarts"
* owner = Reference(Patient-ProviderTasks-Van-Duinen) "Tom van Duinen"

Instance: ActivityDefinition-ProviderTasks-Gezonder-Leven-Van-Duinen
InstanceOf: http://medmij.nl/fhir/StructureDefinition/pt-DigitalActivity
Usage: #example
* text
  * status = #empty
  * div = "<div xmlns='http://www.w3.org/1999/xhtml'>No human-readable text provided in this case.</div>"
* extension
  * url = "http://medmij.nl/fhir/StructureDefinition/ext-Endpoint"
  * valueReference = Reference(Endpoint-ProviderTasks-HINQ)
* identifier
  * system = "https://hing.zno.com/content/id"
  * value = "801e6797-cb52-4020-847a-7440a15b5998"
* url = "https://hing.zno.com/fhir/ActivityDefinition/39318a5e-889d-48a5-8812-e59247743a0c"
* version = "1.0.0"
* name = "InformatieGezonderLeven"
* title = "Gezonder gaan leven"
* status = #active
* publisher = "HinqZNO"
* description = "Leestips voor een gezondere leefstijl."

Instance: Task-ProviderTasks-Informatie-Gezonder-Leven-Van-Duinen
InstanceOf: http://medmij.nl/fhir/StructureDefinition/pt-Task
Usage: #example
* meta.tag
  * system = "http://medmij.nl/fhir/CodeSystem/information-standard"
  * code = #providertasks
* text
  * status = #empty
  * div = "<div xmlns='http://www.w3.org/1999/xhtml'>No human-readable text provided in this case.</div>"
* extension
  * url = $pt-digital-activity
  * valueReference = Reference(ActivityDefinition-ProviderTasks-Gezonder-Leven-Van-Duinen)
    * type = "ActivityDefinition"
* identifier
  * system = "http://medrie.nl/taskIdentifier"
  * value = "TASK-Informatie-Gezonderleven-6789"
* basedOn = Reference(ServiceRequest-ProviderTasks-DigitalGroup-Diabetes-Van-Duinen) "Digitale zorgmodule Diabetes"
* status = #requested
* intent = #order
* priority = #routine
* description = "Lees tips voor een gezonder leven: voeding, bewegen en volhouden"
* for = Reference(Patient-ProviderTasks-Van-Duinen) "Tom van Duinen"
* executionPeriod
  * start = "2025-12-22"
  * end = "2025-12-28"
* authoredOn = "2025-12-24T07:00:00+01:00"
* lastModified = "2025-12-24T07:00:00+01:00"
* requester = Reference(PractitionerRole-ProviderTasks-De-Haard) "A. de Haard, Huisarts"
* owner = Reference(Patient-ProviderTasks-Van-Duinen) "Tom van Duinen"


Instance: ActivityDefinition-ProviderTasks-Woonleefsituatie-Van-Duinen
InstanceOf: http://medmij.nl/fhir/StructureDefinition/pt-DigitalActivity
Usage: #example
* text
  * status = #empty
  * div = "<div xmlns='http://www.w3.org/1999/xhtml'>No human-readable text provided in this case.</div>"
* extension
  * url = "http://medmij.nl/fhir/StructureDefinition/ext-Endpoint"
  * valueReference = Reference(Endpoint-ProviderTasks-HINQ)
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


Instance: Task-ProviderTasks-Vragenlijst-WoonLeefsituatie-Van-Duinen
InstanceOf: http://medmij.nl/fhir/StructureDefinition/pt-Task
Usage: #example
* meta.tag
  * system = "http://medmij.nl/fhir/CodeSystem/information-standard"
  * code = #providertasks
* text
  * status = #empty
  * div = "<div xmlns='http://www.w3.org/1999/xhtml'>No human-readable text provided in this case.</div>"
* extension
  * url = $pt-digital-activity
  * valueReference = Reference(ActivityDefinition-ProviderTasks-Woonleefsituatie-Van-Duinen)
    * type = "ActivityDefinition"
* identifier
  * system = "http://medrie.nl/taskIdentifier"
  * value = "TASK-Vragenlijst-Woonsituatie-9642"
* basedOn = Reference(ServiceRequest-ProviderTasks-DigitalGroup-Diabetes-Van-Duinen) "Digitale zorgmodule Diabetes"
* status = #requested
* intent = #order
* priority = #routine
* description = "Beantwoord deze vragen over je woon/leefsituatie"
* for = Reference(Patient-ProviderTasks-Van-Duinen) "Tom van Duinen"
* executionPeriod
  * start = "2025-12-22"
  * end = "2025-12-28"
* authoredOn = "2025-12-23T18:00:00+01:00"
* lastModified = "2025-12-23T18:00:00+01:00"
* requester = Reference(PractitionerRole-ProviderTasks-De-Haard) "A. de Haard, Huisarts"
* owner = Reference(Patient-ProviderTasks-Van-Duinen) "Tom van Duinen"

Instance: Endpoint-ProviderTasks-HINQ
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
* managingOrganization = Reference(Organization-ProviderTasks-Huisartsenpraktijk-De-Haard)
* payloadType = $endpoint-payload-type#any
* address = "https://module.test.5im.nl/web/api/smartonfhir/launch"

Instance: Patient-ProviderTasks-Van-Duinen
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
  * given = "Tom"
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

Instance: PractitionerRole-ProviderTasks-De-Haard
InstanceOf: http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthProfessional-PractitionerRole
Usage: #example
* text
  * status = #empty
  * div = "<div xmlns='http://www.w3.org/1999/xhtml'>No human-readable text provided in this case.</div>"
* practitioner = Reference(Practitioner-ProviderTasks-De-Haard) "A. de Haard"
* organization = Reference(Organization-ProviderTasks-Huisartsenpraktijk-De-Haard) "Huisartstenpraktijk de Haard"
* specialty
  * coding = urn:oid:2.16.840.1.113883.2.4.6.7#0110 "Huisarts, apotheekhoudend"

Instance: Practitioner-ProviderTasks-De-Haard
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

Instance: Organization-ProviderTasks-Huisartsenpraktijk-De-Haard
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