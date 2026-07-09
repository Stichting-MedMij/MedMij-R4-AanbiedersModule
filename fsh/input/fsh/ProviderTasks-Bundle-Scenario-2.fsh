// Bundle with FHIR test instances in FSH format for ProviderTasks test scenario 2
Instance: ProviderTasks-ServiceRequestExecution-Bloeddrukmeting
InstanceOf: http://medmij.nl/fhir/StructureDefinition/pt-ExecutionOrder
Usage: #example
* text
  * status = #empty
  * div = "<div xmlns='http://www.w3.org/1999/xhtml'>No human-readable text provided in this case.</div>"
* identifier
  * system = "http://medrie/servicerequest/id"
  * value = "2025-999999"
* status = #active
* intent = #order
* subject = Reference(ProviderTasks-Patient-De-Groot) "Koos de Groot"
* occurrenceTiming.repeat
  * boundsPeriod.start = "2025-12-22"
  * boundsPeriod.end = "2025-12-28"
  * period = 1
  * periodUnit = #d
  * frequency = 2
  * frequencyMax = 2
* requester = Reference(ProviderTasks-PractitionerRole-De-Jong) "L. de Jong, Huisarts"
* patientInstruction = "Meet 7 dagen, 2 keer per dag, uw bloeddruk: nuchter vóór het ontbijt en vóór het avondeten."

Instance: ProviderTasks-ServiceRequestDigitalGroup-CVRM
InstanceOf: http://medmij.nl/fhir/StructureDefinition/pt-DigitalGroupPlan
Usage: #example
* text
  * status = #empty
  * div = "<div xmlns='http://www.w3.org/1999/xhtml'>No human-readable text provided in this case.</div>"
* identifier
  * system = "http://medrie/servicerequest/id"
  * value = "2025-1111999"
* status = #active
* intent = #plan
* code.text = "Digitale zorgmodule CVRM"
* subject = Reference(ProviderTasks-Patient-De-Groot) "Koos de Groot"
* requester = Reference(ProviderTasks-PractitionerRole-De-Haard) "A. de Haard, Huisarts"

Instance: ProviderTasks-ActivityDefinition-Meetopdracht-Bloeddrukmeting
InstanceOf: http://medmij.nl/fhir/StructureDefinition/pt-DigitalActivity
Usage: #example
* text
  * status = #empty
  * div = "<div xmlns='http://www.w3.org/1999/xhtml'>No human-readable text provided in this case.</div>"
* extension
  * url = "http://medmij.nl/fhir/StructureDefinition/ext-Endpoint"
  * valueReference = Reference(ProviderTasks-Endpoint-Minddistrict)
* identifier
  * system = "https://ns.minddistrict.com/content/id"
  * value = "481365c2-a85c-49cc-bb74-d6d8a6a53b46"
* url = "https://ns.minddistrict.com/fhir/ActivityDefinition/ed5ea36a-ef8e-417e-827e-8a130287d44d"
* version = "1.0.0"
* name = "MeetopdachtBloeddrukmeting"
* title = "Bloeddrukmeting"
* status = #active
* publisher = "Minddistrict"
* description = "Bloeddrukmeting volgens NHG protocol. 1 week, 2x per dag, 's ochtends en 's avonds"
* timingTiming.repeat
  * boundsDuration.value = 7
  * boundsDuration.system = "http://unitsofmeasure.org"
  * boundsDuration.code = #d
  * boundsDuration.unit = "day"
  * frequency = 1
  * period = 1
  * periodUnit = #d

Instance: ProviderTasks-Task-Meetopdracht-Bloeddrukmeting-1
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
  * valueReference = Reference(ProviderTasks-ActivityDefinition-Meetopdracht-Bloeddrukmeting)
    * type = "ActivityDefinition"
* basedOn = Reference(ProviderTasks-ServiceRequestDigitalGroup-CVRM) "Digitale zorgmodule CVRM"
* identifier
  * system = "http://medrie.nl/taskIdentifier"
  * value = "TASK-Bloeddruk-1"
* status = #received
* intent = #order
* priority = #routine
* description = "Je meet de bloeddruk om te controleren hoe goed het hart en de bloedvaten werken."
* focus = Reference(ProviderTasks-ServiceRequestExecution-Bloeddrukmeting)
* for = Reference(ProviderTasks-Patient-De-Groot) "Koos de Groot"
* executionPeriod
  * start = "2025-12-22"
  * end = "2025-12-22"
* authoredOn = "2025-12-22T08:00:00+01:00"
* lastModified = "2025-12-22T08:00:00+01:00"
* requester = Reference(ProviderTasks-PractitionerRole-De-Jong) "L. de Jong, Huisarts"
* owner = Reference(ProviderTasks-Patient-De-Groot) "Koos de Groot"

Instance: ProviderTasks-Task-Meetopdracht-Bloeddrukmeting-2
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
  * valueReference = Reference(ProviderTasks-ActivityDefinition-Meetopdracht-Bloeddrukmeting)
    * type = "ActivityDefinition"
* basedOn = Reference(ProviderTasks-ServiceRequestDigitalGroup-CVRM) "Digitale zorgmodule CVRM"
* identifier
  * system = "http://medrie.nl/taskIdentifier"
  * value = "TASK-Bloeddruk-2"
* status = #received
* intent = #order
* priority = #routine
* description = "Je meet de bloeddruk om te controleren hoe goed het hart en de bloedvaten werken."
* focus = Reference(ProviderTasks-ServiceRequestExecution-Bloeddrukmeting)
* for = Reference(ProviderTasks-Patient-De-Groot) "Koos de Groot"
* executionPeriod
  * start = "2025-12-22"
  * end = "2025-12-22"
* authoredOn = "2025-12-22T08:00:00+01:00"
* lastModified = "2025-12-22T08:00:00+01:00"
* requester = Reference(ProviderTasks-PractitionerRole-De-Jong) "L. de Jong, Huisarts"
* owner = Reference(ProviderTasks-Patient-De-Groot) "Koos de Groot"

Instance: ProviderTasks-Task-Meetopdracht-Bloeddrukmeting-3
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
  * valueReference = Reference(ProviderTasks-ActivityDefinition-Meetopdracht-Bloeddrukmeting)
    * type = "ActivityDefinition"
* basedOn = Reference(ProviderTasks-ServiceRequestDigitalGroup-CVRM) "Digitale zorgmodule CVRM"
* identifier
  * system = "http://medrie.nl/taskIdentifier"
  * value = "TASK-Bloeddruk-3"
* status = #received
* intent = #order
* priority = #routine
* description = "Je meet de bloeddruk om te controleren hoe goed het hart en de bloedvaten werken."
* focus = Reference(ProviderTasks-ServiceRequestExecution-Bloeddrukmeting)
* for = Reference(ProviderTasks-Patient-De-Groot) "Koos de Groot"
* executionPeriod
  * start = "2025-12-23"
  * end = "2025-12-23"
* authoredOn = "2025-12-22T08:00:00+01:00"
* lastModified = "2025-12-22T08:00:00+01:00"
* requester = Reference(ProviderTasks-PractitionerRole-De-Jong) "L. de Jong, Huisarts"
* owner = Reference(ProviderTasks-Patient-De-Groot) "Koos de Groot"

Instance: ProviderTasks-Task-Meetopdracht-Bloeddrukmeting-4
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
  * valueReference = Reference(ProviderTasks-ActivityDefinition-Meetopdracht-Bloeddrukmeting)
    * type = "ActivityDefinition"
* basedOn = Reference(ProviderTasks-ServiceRequestDigitalGroup-CVRM) "Digitale zorgmodule CVRM"
* identifier
  * system = "http://medrie.nl/taskIdentifier"
  * value = "TASK-Bloeddruk-4"
* status = #received
* intent = #order
* priority = #routine
* description = "Je meet de bloeddruk om te controleren hoe goed het hart en de bloedvaten werken."
* focus = Reference(ProviderTasks-ServiceRequestExecution-Bloeddrukmeting)
* for = Reference(ProviderTasks-Patient-De-Groot) "Koos de Groot"
* executionPeriod
  * start = "2025-12-23"
  * end = "2025-12-23"
* authoredOn = "2025-12-22T08:00:00+01:00"
* lastModified = "2025-12-22T08:00:00+01:00"
* requester = Reference(ProviderTasks-PractitionerRole-De-Jong) "L. de Jong, Huisarts"
* owner = Reference(ProviderTasks-Patient-De-Groot) "Koos de Groot"

Instance: ProviderTasks-Task-Meetopdracht-Bloeddrukmeting-5
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
  * valueReference = Reference(ProviderTasks-ActivityDefinition-Meetopdracht-Bloeddrukmeting)
    * type = "ActivityDefinition"
* basedOn = Reference(ProviderTasks-ServiceRequestDigitalGroup-CVRM) "Digitale zorgmodule CVRM"
* identifier
  * system = "http://medrie.nl/taskIdentifier"
  * value = "TASK-Bloeddruk-5"
* status = #received
* intent = #order
* priority = #routine
* description = "Je meet de bloeddruk om te controleren hoe goed het hart en de bloedvaten werken."
* focus = Reference(ProviderTasks-ServiceRequestExecution-Bloeddrukmeting)
* for = Reference(ProviderTasks-Patient-De-Groot) "Koos de Groot"
* executionPeriod
  * start = "2025-12-24"
  * end = "2025-12-24"
* authoredOn = "2025-12-22T08:00:00+01:00"
* lastModified = "2025-12-22T08:00:00+01:00"
* requester = Reference(ProviderTasks-PractitionerRole-De-Jong) "L. de Jong, Huisarts"
* owner = Reference(ProviderTasks-Patient-De-Groot) "Koos de Groot"

Instance: ProviderTasks-Task-Meetopdracht-Bloeddrukmeting-6
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
  * valueReference = Reference(ProviderTasks-ActivityDefinition-Meetopdracht-Bloeddrukmeting)
    * type = "ActivityDefinition"
* basedOn = Reference(ProviderTasks-ServiceRequestDigitalGroup-CVRM) "Digitale zorgmodule CVRM"
* identifier
  * system = "http://medrie.nl/taskIdentifier"
  * value = "TASK-Bloeddruk-6"
* status = #received
* intent = #order
* priority = #routine
* description = "Je meet de bloeddruk om te controleren hoe goed het hart en de bloedvaten werken."
* focus = Reference(ProviderTasks-ServiceRequestExecution-Bloeddrukmeting)
* for = Reference(ProviderTasks-Patient-De-Groot) "Koos de Groot"
* executionPeriod
  * start = "2025-12-24"
  * end = "2025-12-24"
* authoredOn = "2025-12-22T08:00:00+01:00"
* lastModified = "2025-12-22T08:00:00+01:00"
* requester = Reference(ProviderTasks-PractitionerRole-De-Jong) "L. de Jong, Huisarts"
* owner = Reference(ProviderTasks-Patient-De-Groot) "Koos de Groot"

Instance: ProviderTasks-Task-Meetopdracht-Bloeddrukmeting-7
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
  * valueReference = Reference(ProviderTasks-ActivityDefinition-Meetopdracht-Bloeddrukmeting)
    * type = "ActivityDefinition"
* basedOn = Reference(ProviderTasks-ServiceRequestDigitalGroup-CVRM) "Digitale zorgmodule CVRM"
* identifier
  * system = "http://medrie.nl/taskIdentifier"
  * value = "TASK-Bloeddruk-7"
* status = #received
* intent = #order
* priority = #routine
* description = "Je meet de bloeddruk om te controleren hoe goed het hart en de bloedvaten werken."
* focus = Reference(ProviderTasks-ServiceRequestExecution-Bloeddrukmeting)
* for = Reference(ProviderTasks-Patient-De-Groot) "Koos de Groot"
* executionPeriod
  * start = "2025-12-25"
  * end = "2025-12-25"
* authoredOn = "2025-12-22T08:00:00+01:00"
* lastModified = "2025-12-22T08:00:00+01:00"
* requester = Reference(ProviderTasks-PractitionerRole-De-Jong) "L. de Jong, Huisarts"
* owner = Reference(ProviderTasks-Patient-De-Groot) "Koos de Groot"

Instance: ProviderTasks-Task-Meetopdracht-Bloeddrukmeting-8
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
  * valueReference = Reference(ProviderTasks-ActivityDefinition-Meetopdracht-Bloeddrukmeting)
    * type = "ActivityDefinition"
* basedOn = Reference(ProviderTasks-ServiceRequestDigitalGroup-CVRM) "Digitale zorgmodule CVRM"
* identifier
  * system = "http://medrie.nl/taskIdentifier"
  * value = "TASK-Bloeddruk-8"
* status = #received
* intent = #order
* priority = #routine
* description = "Je meet de bloeddruk om te controleren hoe goed het hart en de bloedvaten werken."
* focus = Reference(ProviderTasks-ServiceRequestExecution-Bloeddrukmeting)
* for = Reference(ProviderTasks-Patient-De-Groot) "Koos de Groot"
* executionPeriod
  * start = "2025-12-25"
  * end = "2025-12-25"
* authoredOn = "2025-12-22T08:00:00+01:00"
* lastModified = "2025-12-22T08:00:00+01:00"
* requester = Reference(ProviderTasks-PractitionerRole-De-Jong) "L. de Jong, Huisarts"
* owner = Reference(ProviderTasks-Patient-De-Groot) "Koos de Groot"

Instance: ProviderTasks-Task-Meetopdracht-Bloeddrukmeting-9
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
  * valueReference = Reference(ProviderTasks-ActivityDefinition-Meetopdracht-Bloeddrukmeting)
    * type = "ActivityDefinition"
* basedOn = Reference(ProviderTasks-ServiceRequestDigitalGroup-CVRM) "Digitale zorgmodule CVRM"
* identifier
  * system = "http://medrie.nl/taskIdentifier"
  * value = "TASK-Bloeddruk-9"
* status = #received
* intent = #order
* priority = #routine
* description = "Je meet de bloeddruk om te controleren hoe goed het hart en de bloedvaten werken."
* focus = Reference(ProviderTasks-ServiceRequestExecution-Bloeddrukmeting)
* for = Reference(ProviderTasks-Patient-De-Groot) "Koos de Groot"
* executionPeriod
  * start = "2025-12-26"
  * end = "2025-12-26"
* authoredOn = "2025-12-22T08:00:00+01:00"
* lastModified = "2025-12-22T08:00:00+01:00"
* requester = Reference(ProviderTasks-PractitionerRole-De-Jong) "L. de Jong, Huisarts"
* owner = Reference(ProviderTasks-Patient-De-Groot) "Koos de Groot"

Instance: ProviderTasks-Task-Meetopdracht-Bloeddrukmeting-10
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
  * valueReference = Reference(ProviderTasks-ActivityDefinition-Meetopdracht-Bloeddrukmeting)
    * type = "ActivityDefinition"
* basedOn = Reference(ProviderTasks-ServiceRequestDigitalGroup-CVRM) "Digitale zorgmodule CVRM"
* identifier
  * system = "http://medrie.nl/taskIdentifier"
  * value = "TASK-Bloeddruk-10"
* status = #received
* intent = #order
* priority = #routine
* description = "Je meet de bloeddruk om te controleren hoe goed het hart en de bloedvaten werken."
* focus = Reference(ProviderTasks-ServiceRequestExecution-Bloeddrukmeting)
* for = Reference(ProviderTasks-Patient-De-Groot) "Koos de Groot"
* executionPeriod
  * start = "2025-12-26"
  * end = "2025-12-26"
* authoredOn = "2025-12-22T08:00:00+01:00"
* lastModified = "2025-12-22T08:00:00+01:00"
* requester = Reference(ProviderTasks-PractitionerRole-De-Jong) "L. de Jong, Huisarts"
* owner = Reference(ProviderTasks-Patient-De-Groot) "Koos de Groot"

Instance: ProviderTasks-Task-Meetopdracht-Bloeddrukmeting-11
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
  * valueReference = Reference(ProviderTasks-ActivityDefinition-Meetopdracht-Bloeddrukmeting)
    * type = "ActivityDefinition"
* basedOn = Reference(ProviderTasks-ServiceRequestDigitalGroup-CVRM) "Digitale zorgmodule CVRM"
* identifier
  * system = "http://medrie.nl/taskIdentifier"
  * value = "TASK-Bloeddruk-11"
* status = #received
* intent = #order
* priority = #routine
* description = "Je meet de bloeddruk om te controleren hoe goed het hart en de bloedvaten werken."
* focus = Reference(ProviderTasks-ServiceRequestExecution-Bloeddrukmeting)
* for = Reference(ProviderTasks-Patient-De-Groot) "Koos de Groot"
* executionPeriod
  * start = "2025-12-27"
  * end = "2025-12-27"
* authoredOn = "2025-12-22T08:00:00+01:00"
* lastModified = "2025-12-22T08:00:00+01:00"
* requester = Reference(ProviderTasks-PractitionerRole-De-Jong) "L. de Jong, Huisarts"
* owner = Reference(ProviderTasks-Patient-De-Groot) "Koos de Groot"

Instance: ProviderTasks-Task-Meetopdracht-Bloeddrukmeting-12
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
  * valueReference = Reference(ProviderTasks-ActivityDefinition-Meetopdracht-Bloeddrukmeting)
    * type = "ActivityDefinition"
* basedOn = Reference(ProviderTasks-ServiceRequestDigitalGroup-CVRM) "Digitale zorgmodule CVRM"
* identifier
  * system = "http://medrie.nl/taskIdentifier"
  * value = "TASK-Bloeddruk-12"
* status = #received
* intent = #order
* priority = #routine
* description = "Je meet de bloeddruk om te controleren hoe goed het hart en de bloedvaten werken."
* focus = Reference(ProviderTasks-ServiceRequestExecution-Bloeddrukmeting)
* for = Reference(ProviderTasks-Patient-De-Groot) "Koos de Groot"
* executionPeriod
  * start = "2025-12-27"
  * end = "2025-12-27"
* authoredOn = "2025-12-22T08:00:00+01:00"
* lastModified = "2025-12-22T08:00:00+01:00"
* requester = Reference(ProviderTasks-PractitionerRole-De-Jong) "L. de Jong, Huisarts"
* owner = Reference(ProviderTasks-Patient-De-Groot) "Koos de Groot"

Instance: ProviderTasks-Task-Meetopdracht-Bloeddrukmeting-13
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
  * valueReference = Reference(ProviderTasks-ActivityDefinition-Meetopdracht-Bloeddrukmeting)
    * type = "ActivityDefinition"
* basedOn = Reference(ProviderTasks-ServiceRequestDigitalGroup-CVRM) "Digitale zorgmodule CVRM"
* identifier
  * system = "http://medrie.nl/taskIdentifier"
  * value = "TASK-Bloeddruk-13"
* status = #received
* intent = #order
* priority = #routine
* description = "Je meet de bloeddruk om te controleren hoe goed het hart en de bloedvaten werken."
* focus = Reference(ProviderTasks-ServiceRequestExecution-Bloeddrukmeting)
* for = Reference(ProviderTasks-Patient-De-Groot) "Koos de Groot"
* executionPeriod
  * start = "2025-12-28"
  * end = "2025-12-28"
* authoredOn = "2025-12-22T08:00:00+01:00"
* lastModified = "2025-12-22T08:00:00+01:00"
* requester = Reference(ProviderTasks-PractitionerRole-De-Jong) "L. de Jong, Huisarts"
* owner = Reference(ProviderTasks-Patient-De-Groot) "Koos de Groot"

Instance: ProviderTasks-Task-Meetopdracht-Bloeddrukmeting-14
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
  * valueReference = Reference(ProviderTasks-ActivityDefinition-Meetopdracht-Bloeddrukmeting)
    * type = "ActivityDefinition"
* basedOn = Reference(ProviderTasks-ServiceRequestDigitalGroup-CVRM) "Digitale zorgmodule CVRM"
* identifier
  * system = "http://medrie.nl/taskIdentifier"
  * value = "TASK-Bloeddruk-14"
* status = #received
* intent = #order
* priority = #routine
* description = "Je meet de bloeddruk om te controleren hoe goed het hart en de bloedvaten werken."
* focus = Reference(ProviderTasks-ServiceRequestExecution-Bloeddrukmeting)
* for = Reference(ProviderTasks-Patient-De-Groot) "Koos de Groot"
* executionPeriod
  * start = "2025-12-28"
  * end = "2025-12-28"
* authoredOn = "2025-12-22T08:00:00+01:00"
* lastModified = "2025-12-22T08:00:00+01:00"
* requester = Reference(ProviderTasks-PractitionerRole-De-Jong) "L. de Jong, Huisarts"
* owner = Reference(ProviderTasks-Patient-De-Groot) "Koos de Groot"

Instance: ProviderTasks-ActivityDefinition-Informatie-Cholesterol
InstanceOf: http://medmij.nl/fhir/StructureDefinition/pt-DigitalActivity
Usage: #example
* text
  * status = #empty
  * div = "<div xmlns='http://www.w3.org/1999/xhtml'>No human-readable text provided in this case.</div>"
* extension
  * url = "http://medmij.nl/fhir/StructureDefinition/ext-Endpoint"
  * valueReference = Reference(ProviderTasks-Endpoint-Minddistrict)
* identifier
  * system = "https://ns.minddistrict.com/content/id"
  * value = "c45485ee-8a42-466b-97ba-ac6537b0bf89"
* url = "https://ns.minddistrict.com/fhir/ActivityDefinition/f0d9b485-f282-4870-a5f6-a5ea41465239"
* version = "1.0.0"
* name = "InformatieCholesterol"
* title = "Wat is cholesterol en wat zijn de risico's?"
* status = #active
* publisher = "Minddistrict"
* description = "Voorlichtingsmodule cholesterol: uitlegmateriaal over wat cholesterol is, cardiovasculaire risico’s en leefstijl-/behandelopties ter ondersteuning van CVRM en gezamenlijke besluitvorming."

Instance: ProviderTasks-Task-Informatie-Cholesterol
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
  * valueReference = Reference(ProviderTasks-ActivityDefinition-Informatie-Cholesterol)
    * type = "ActivityDefinition"
* basedOn = Reference(ProviderTasks-ServiceRequestDigitalGroup-CVRM) "Digitale zorgmodule CVRM"
* identifier
  * system = "http://medrie.nl/taskIdentifier"
  * value = "TASK-Informatie-Cholesterol-1"
* status = #received
* intent = #order
* priority = #routine
* description = "Lees wat cholesterol is, welke risico’s erbij horen en wat je kunt doen met leefstijl en/of medicijnen."
* for = Reference(ProviderTasks-Patient-De-Groot) "Koos de Groot"
* executionPeriod
  * start = "2025-12-22"
  * end = "2025-12-28"
* authoredOn = "2025-12-23T07:00:00+01:00"
* lastModified = "2025-12-23T07:00:00+01:00"
* requester = Reference(ProviderTasks-PractitionerRole-De-Jong) "L. de Jong, Huisarts"
* owner = Reference(ProviderTasks-Patient-De-Groot) "Koos de Groot"


Instance: ProviderTasks-ActivityDefinition-Informatie-Thuismeting
InstanceOf: http://medmij.nl/fhir/StructureDefinition/pt-DigitalActivity
Usage: #example
* text
  * status = #empty
  * div = "<div xmlns='http://www.w3.org/1999/xhtml'>No human-readable text provided in this case.</div>"
* extension
  * url = "http://medmij.nl/fhir/StructureDefinition/ext-Endpoint"
  * valueReference = Reference(ProviderTasks-Endpoint-Minddistrict)
* identifier
  * system = "https://ns.minddistrict.com/content/id"
  * value = "7e5633b6-2cf2-49bf-8f1c-e105c8b82b22"
* url = "https://ns.minddistrict.com/fhir/ActivityDefinition/708f713b-8f32-43e3-b7dc-749462cc4d49"
* version = "1.0.0"
* name = "InformatieBloeddrukmeten"
* title = "Informatie over thuis bloeddruk meten"
* status = #active
* publisher = "Minddistrict"
* description = "Instructiemodule thuismetingen bloeddruk: patiëntinstructie voor correcte meetmethode (rust, houding, manchet, meetmomenten) en registratie, ter verbetering van betrouwbaarheid van thuismetingen"

Instance: ProviderTasks-Task-Informatie-Thuis-Bloeddrukmeten
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
  * valueReference = Reference(ProviderTasks-ActivityDefinition-Informatie-Thuismeting)
    * type = "ActivityDefinition"
* basedOn = Reference(ProviderTasks-ServiceRequestDigitalGroup-CVRM) "Digitale zorgmodule CVRM"
* identifier
  * system = "http://medrie.nl/taskIdentifier"
  * value = "TASK-Informatie-Bloeddruk-1"
* status = #requested
* intent = #order
* priority = #routine
* description = "Lees deze informatie over hoe je thuis je bloeddruk kan meten."
* for = Reference(ProviderTasks-Patient-De-Groot) "Koos de Groot"
* executionPeriod
  * start = "2025-12-22"
  * end = "2025-12-28"
* authoredOn = "2025-12-24T07:00:00+01:00"
* lastModified = "2025-12-24T07:00:00+01:00"
* requester = Reference(ProviderTasks-PractitionerRole-De-Jong) "L. de Jong, Huisarts"
* owner = Reference(ProviderTasks-Patient-De-Groot) "Koos de Groot"


Instance: ProviderTasks-ActivityDefinition-Vragenlijst-Uw-Situatie
InstanceOf: http://medmij.nl/fhir/StructureDefinition/pt-DigitalActivity
Usage: #example
* text
  * status = #empty
  * div = "<div xmlns='http://www.w3.org/1999/xhtml'>No human-readable text provided in this case.</div>"
* extension[0]
  * url = "http://medmij.nl/fhir/StructureDefinition/ext-Endpoint"
  * valueReference = Reference(ProviderTasks-Endpoint-Minddistrict)
* identifier
  * system = "https://ns.minddistrict.com/content/id"
  * value = "c4bd168d-963c-4360-86fa-39d4b6e08d83"
* url = "https://ns.minddistrict.com/fhir/ActivityDefinition/b6e103fc-2695-48fd-a0d7-6abe7cb5bbac"
* version = "1.0.0"
* name = "VragenlijstHartVaatziekten"
* title = "Vragenlijst over uw situatie op gebied van hart- en vaatziekten"
* status = #active
* publisher = "Minddistrict"
* description = "Vragenlijst ‘Uw situatie’ om relevante klachten, leefstijl en risicofactoren rond hart- en vaatziekten te inventariseren als basis voor behandelafspraken."

Instance: ProviderTasks-Task-Vragenlijst-Uw-Situatie
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
  * valueReference = Reference(ProviderTasks-ActivityDefinition-Vragenlijst-Uw-Situatie)
    * type = "ActivityDefinition"
* basedOn = Reference(ProviderTasks-ServiceRequestDigitalGroup-CVRM) "Digitale zorgmodule CVRM"
* identifier
  * system = "http://medrie.nl/taskIdentifier"
  * value = "TASK-Informatie-Situatie-1"
* status = #failed
* intent = #order
* priority = #routine
* description = "Beantwoord deze vragen over jouw situatie rondom hart- en vaatziekten."
* for = Reference(ProviderTasks-Patient-De-Groot) "Koos de Groot"
* executionPeriod
  * start = "2025-12-22"
  * end = "2025-12-28"
* authoredOn = "2025-12-23T18:00:00+01:00"
* lastModified = "2025-12-23T18:00:00+01:00"
* requester = Reference(ProviderTasks-PractitionerRole-De-Jong) "L. de Jong, Huisarts"
* owner = Reference(ProviderTasks-Patient-De-Groot) "Koos de Groot"

Instance: ProviderTasks-Endpoint-Minddistrict
InstanceOf: http://medmij.nl/fhir/StructureDefinition/pt-Endpoint
Usage: #example
* text
  * status = #empty
  * div = "<div xmlns='http://www.w3.org/1999/xhtml'>No human-readable text provided in this case.</div>"
* extension
  * url = $client-id
  * valueString = "dvaAanbiedertaken"
* status = #active
* connectionType = http://terminology.hl7.org/CodeSystem/endpoint-connection-type#hl7-fhir-rest
* managingOrganization = Reference(ProviderTasks-Organization-Huisartsenpraktijk-De-Haard)
* payloadType = $endpoint-payload-type#any
* address = "https://aanbiedermodule.example.org/web/api/smartonfhir/launch?iss=resourceserver.example.dva.nl"

Instance: ProviderTasks-Patient-De-Groot
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
  * text = "Koos de Groot"
  * family = "de Groot"
    * extension[http://hl7.org/fhir/StructureDefinition/humanname-own-prefix].valueString = "de"
    * extension[http://hl7.org/fhir/StructureDefinition/humanname-own-name].valueString = "Groot"
  * given = "Koos"
    * extension[http://hl7.org/fhir/StructureDefinition/iso21090-EN-qualifier].valueCode = #BR
* name[1]
  * use = #usual
  * given = "Koos"
* telecom[0]
  * system = #phone
    * extension[http://nictiz.nl/fhir/StructureDefinition/ext-CodeSpecification].valueCodeableConcept = http://terminology.hl7.org/CodeSystem/v3-AddressUse#MC "mobile contact"
  * value = "+31612345611"
* telecom[1]
  * system = #email
  * value = "koosdegrootn@koos.com"
  * use = #home
* gender = #male
  * extension[http://nictiz.nl/fhir/StructureDefinition/ext-CodeSpecification].valueCodeableConcept.coding = http://terminology.hl7.org/CodeSystem/v3-AdministrativeGender#M "Male"
* birthDate = "1972-09-20"
* deceasedBoolean = false
* address
  * extension[http://nictiz.nl/fhir/StructureDefinition/ext-AddressInformation.AddressType].valueCodeableConcept = http://terminology.hl7.org/CodeSystem/v3-AddressUse#HP "primary home"
  * use = #home
  * type = #both
  * line = "Spui 70"
    * extension[http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-streetName].valueString = "Spui"
    * extension[http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-houseNumber].valueString = "70"
  * city = "Den Haag"
  * postalCode = "2511 BT"
  * country = "Nederland"
    * extension[http://nictiz.nl/fhir/StructureDefinition/ext-CodeSpecification].valueCodeableConcept = urn:iso:std:iso:3166#NL "Netherlands"

Instance: ProviderTasks-PractitionerRole-De-Jong
InstanceOf: http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthProfessional-PractitionerRole
Usage: #example
* text
  * status = #empty
  * div = "<div xmlns='http://www.w3.org/1999/xhtml'>No human-readable text provided in this case.</div>"
* practitioner = Reference(ProviderTasks-Practitioner-De-Jong) "L. de Jong"
* organization = Reference(ProviderTasks-Organization-Huisartsenpraktijk-De-Haard) "Huisartstenpraktijk de Haard"
* specialty
  * coding = urn:oid:2.16.840.1.113883.2.4.6.7#0110 "Huisarts, apotheekhoudend"

Instance: ProviderTasks-Practitioner-De-Jong
InstanceOf: http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthProfessional-Practitioner
Usage: #example
* text
  * status = #empty
  * div = "<div xmlns='http://www.w3.org/1999/xhtml'>No human-readable text provided in this case.</div>"
* identifier
  * system = "http://fhir.nl/fhir/NamingSystem/big"
  * value = "28910456"
* name
  * use = #official
  * text = "L. de Jong"
  * family = "de Jong"
    * extension[http://hl7.org/fhir/StructureDefinition/humanname-own-prefix].valueString = "de"
    * extension[http://hl7.org/fhir/StructureDefinition/humanname-own-name].valueString = "Jong"
  * given[0] = "L."
    * extension[http://hl7.org/fhir/StructureDefinition/iso21090-EN-qualifier].valueCode = #IN
* telecom[0]
  * system = #phone
  * value = "+31655504321"
  * use = #work
* telecom[1]
  * system = #email
  * value = "l.dejong@huisartspraktijk-example.nl"
  * use = #work
