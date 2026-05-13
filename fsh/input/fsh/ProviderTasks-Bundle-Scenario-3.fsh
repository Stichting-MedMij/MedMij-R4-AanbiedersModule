// Bundle with FHIR test instances in FSH format for ProviderTasks test scenario 3
Instance: ProviderTasks-ServiceRequestExecution-Saturatiemeting
InstanceOf: http://medmij.nl/fhir/StructureDefinition/pt-ServiceRequest-ExecutionOrder
Usage: #example
* text
  * status = #empty
  * div = "<div xmlns='http://www.w3.org/1999/xhtml'>No human-readable text provided in this case.</div>"
* identifier
  * system = "http://hing.zno.com/servicerequest/id"
  * value = "2025-11344555"
* status = #active
* intent = #order
* subject = Reference(ProviderTasks-Patient-Van-Dijk) "Sanne van Dijk"
* occurrenceTiming.repeat
  * boundsPeriod.start = "2026-01-05"
  * boundsPeriod.end = "2026-01-11"
  * period = 1
  * periodUnit = #d
  * frequency = 1
  * frequencyMax = 1
* requester = Reference(ProviderTasks-PractitionerRole-Van-Rijn) "M. van Rijn, huisarts"
* patientInstruction = "Meet 7 dagen, 1 keer per dag, uw saturatie."

Instance: ProviderTasks-ServiceRequestDigitalGroup-COPD
InstanceOf: http://medmij.nl/fhir/StructureDefinition/pt-ServiceRequest-DigitalGroupPlan
Usage: #example
* text
  * status = #empty
  * div = "<div xmlns='http://www.w3.org/1999/xhtml'>No human-readable text provided in this case.</div>"
* identifier
  * system = "http://hing.zno.com/servicerequest/id"
  * value = "2025-33344555"
* status = #active
* intent = #plan
* code.text = "Digitale zorgmodule COPD"
* subject = Reference(ProviderTasks-Patient-Van-Dijk) "Sanne van Dijk"
* requester = Reference(ProviderTasks-PractitionerRole-Van-Rijn) "M. van Rijn, huisarts"

Instance: ProviderTasks-ActivityDefinition-Meetopdracht-Saturatiemeting
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
  * value = "a1b1eaa4-ba6b-41dc-b98c-7b1d72c335b5"
* url = "https://hing.zno.com/fhir/ActivityDefinition/bf5569bf-22b8-449d-90a2-be35503da37d"
* version = "1.0.0"
* name = "MeetopdachtSaturatiemeting"
* title = "Saturatiemeting"
* status = #active
* publisher = "HinqZNO"
* description = "Saturatiemeting volgens NHG protocol. 1 week, 1x per dag"
* timingTiming.repeat
  * boundsDuration.value = 7
  * boundsDuration.system = "http://unitsofmeasure.org"
  * boundsDuration.code = #d
  * boundsDuration.unit = "day"
  * frequency = 1
  * period = 1
  * periodUnit = #d

Instance: ProviderTasks-Task-Meetopdracht-Saturatiemeting-1
InstanceOf: http://medmij.nl/fhir/StructureDefinition/pt-Task
Usage: #example
* text
  * status = #empty
  * div = "<div xmlns='http://www.w3.org/1999/xhtml'>No human-readable text provided in this case.</div>"
* extension
  * url = $koppeltaal-instantiates
  * valueReference = Reference(ProviderTasks-ActivityDefinition-Meetopdracht-Saturatiemeting)
    * type = "ActivityDefinition"
* basedOn = Reference(ProviderTasks-ServiceRequestDigitalGroup-COPD) "Digitale zorgmodule COPD"
* identifier
  * system = "https://hing.zno.com/taskIdentifier"
  * value = "TASK-Saturatie-1"
* status = #received
* intent = #order
* priority = #routine
* description = "Je meet saturatie om te kijken hoeveel zuurstof er in je bloed zit. Dit zegt iets over hoe goed je longen en bloedsomloop functioneren."
* focus = Reference(ProviderTasks-ServiceRequestExecution-Saturatiemeting)
* for = Reference(ProviderTasks-Patient-Van-Dijk) "Sanne van Dijk"
* executionPeriod
  * start = "2026-01-05"
  * end = "2026-01-05"
* authoredOn = "2026-01-05T08:00:00+01:00"
* lastModified = "2026-01-05T08:00:00+01:00"
* requester = Reference(ProviderTasks-PractitionerRole-Van-Rijn) "M. van Rijn, huisarts"
* owner = Reference(ProviderTasks-Patient-Van-Dijk) "Sanne van Dijk"

Instance: ProviderTasks-Task-Meetopdracht-Saturatiemeting-2
InstanceOf: http://medmij.nl/fhir/StructureDefinition/pt-Task
Usage: #example
* text
  * status = #empty
  * div = "<div xmlns='http://www.w3.org/1999/xhtml'>No human-readable text provided in this case.</div>"
* extension
  * url = $koppeltaal-instantiates
  * valueReference = Reference(ProviderTasks-ActivityDefinition-Meetopdracht-Saturatiemeting)
    * type = "ActivityDefinition"
* basedOn = Reference(ProviderTasks-ServiceRequestDigitalGroup-COPD) "Digitale zorgmodule COPD"
* identifier
  * system = "https://hing.zno.com/taskIdentifier"
  * value = "TASK-Saturatie-2"
* status = #received
* intent = #order
* priority = #routine
* description = "Je meet saturatie om te kijken hoeveel zuurstof er in je bloed zit. Dit zegt iets over hoe goed je longen en bloedsomloop functioneren."
* focus = Reference(ProviderTasks-ServiceRequestExecution-Saturatiemeting)
* for = Reference(ProviderTasks-Patient-Van-Dijk) "Sanne van Dijk"
* executionPeriod
  * start = "2026-01-06"
  * end = "2026-01-06"
* authoredOn = "2026-01-05T08:00:00+01:00"
* lastModified = "2026-01-05T08:00:00+01:00"
* requester = Reference(ProviderTasks-PractitionerRole-Van-Rijn) "M. van Rijn, huisarts"
* owner = Reference(ProviderTasks-Patient-Van-Dijk) "Sanne van Dijk"

Instance: ProviderTasks-Task-Meetopdracht-Saturatiemeting-3
InstanceOf: http://medmij.nl/fhir/StructureDefinition/pt-Task
Usage: #example
* text
  * status = #empty
  * div = "<div xmlns='http://www.w3.org/1999/xhtml'>No human-readable text provided in this case.</div>"
* extension
  * url = $koppeltaal-instantiates
  * valueReference = Reference(ProviderTasks-ActivityDefinition-Meetopdracht-Saturatiemeting)
    * type = "ActivityDefinition"
* basedOn = Reference(ProviderTasks-ServiceRequestDigitalGroup-COPD) "Digitale zorgmodule COPD"
* identifier
  * system = "https://hing.zno.com/taskIdentifier"
  * value = "TASK-Saturatie-3"
* status = #received
* intent = #order
* priority = #routine
* description = "Je meet saturatie om te kijken hoeveel zuurstof er in je bloed zit. Dit zegt iets over hoe goed je longen en bloedsomloop functioneren."
* focus = Reference(ProviderTasks-ServiceRequestExecution-Saturatiemeting)
* for = Reference(ProviderTasks-Patient-Van-Dijk) "Sanne van Dijk"
* executionPeriod
  * start = "2026-01-07"
  * end = "2026-01-07"
* authoredOn = "2026-01-05T08:00:00+01:00"
* lastModified = "2026-01-05T08:00:00+01:00"
* requester = Reference(ProviderTasks-PractitionerRole-Van-Rijn) "M. van Rijn, huisarts"
* owner = Reference(ProviderTasks-Patient-Van-Dijk) "Sanne van Dijk"

Instance: ProviderTasks-Task-Meetopdracht-Saturatiemeting-4
InstanceOf: http://medmij.nl/fhir/StructureDefinition/pt-Task
Usage: #example
* text
  * status = #empty
  * div = "<div xmlns='http://www.w3.org/1999/xhtml'>No human-readable text provided in this case.</div>"
* extension
  * url = $koppeltaal-instantiates
  * valueReference = Reference(ProviderTasks-ActivityDefinition-Meetopdracht-Saturatiemeting)
    * type = "ActivityDefinition"
* basedOn = Reference(ProviderTasks-ServiceRequestDigitalGroup-COPD) "Digitale zorgmodule COPD"
* identifier
  * system = "https://hing.zno.com/taskIdentifier"
  * value = "TASK-Saturatie-4"
* status = #received
* intent = #order
* priority = #routine
* description = "Je meet saturatie om te kijken hoeveel zuurstof er in je bloed zit. Dit zegt iets over hoe goed je longen en bloedsomloop functioneren."
* for = Reference(ProviderTasks-Patient-Van-Dijk) "Sanne van Dijk"
* focus = Reference(ProviderTasks-ServiceRequestExecution-Saturatiemeting)
* executionPeriod
  * start = "2026-01-08"
  * end = "2026-01-08"
* authoredOn = "2026-01-05T08:00:00+01:00"
* lastModified = "2026-01-05T08:00:00+01:00"
* requester = Reference(ProviderTasks-PractitionerRole-Van-Rijn) "M. van Rijn, huisarts"
* owner = Reference(ProviderTasks-Patient-Van-Dijk) "Sanne van Dijk"

Instance: ProviderTasks-Task-Meetopdracht-Saturatiemeting-5
InstanceOf: http://medmij.nl/fhir/StructureDefinition/pt-Task
Usage: #example
* text
  * status = #empty
  * div = "<div xmlns='http://www.w3.org/1999/xhtml'>No human-readable text provided in this case.</div>"
* extension
  * url = $koppeltaal-instantiates
  * valueReference = Reference(ProviderTasks-ActivityDefinition-Meetopdracht-Saturatiemeting)
    * type = "ActivityDefinition"
* basedOn = Reference(ProviderTasks-ServiceRequestDigitalGroup-COPD) "Digitale zorgmodule COPD"
* identifier
  * system = "https://hing.zno.com/taskIdentifier"
  * value = "TASK-Saturatie-5"
* status = #received
* intent = #order
* priority = #routine
* description = "Je meet saturatie om te kijken hoeveel zuurstof er in je bloed zit. Dit zegt iets over hoe goed je longen en bloedsomloop functioneren."
* for = Reference(ProviderTasks-Patient-Van-Dijk) "Sanne van Dijk"
* focus = Reference(ProviderTasks-ServiceRequestExecution-Saturatiemeting)
* executionPeriod
  * start = "2026-01-09"
  * end = "2026-01-09"
* authoredOn = "2026-01-05T08:00:00+01:00"
* lastModified = "2026-01-05T08:00:00+01:00"
* requester = Reference(ProviderTasks-PractitionerRole-Van-Rijn) "M. van Rijn, huisarts"
* owner = Reference(ProviderTasks-Patient-Van-Dijk) "Sanne van Dijk"

Instance: ProviderTasks-Task-Meetopdracht-Saturatiemeting-6
InstanceOf: http://medmij.nl/fhir/StructureDefinition/pt-Task
Usage: #example
* text
  * status = #empty
  * div = "<div xmlns='http://www.w3.org/1999/xhtml'>No human-readable text provided in this case.</div>"
* extension
  * url = $koppeltaal-instantiates
  * valueReference = Reference(ProviderTasks-ActivityDefinition-Meetopdracht-Saturatiemeting)
    * type = "ActivityDefinition"
* basedOn = Reference(ProviderTasks-ServiceRequestDigitalGroup-COPD) "Digitale zorgmodule COPD"
* identifier
  * system = "https://hing.zno.com/taskIdentifier"
  * value = "TASK-Saturatie-6"
* status = #received
* intent = #order
* priority = #routine
* description = "Je meet saturatie om te kijken hoeveel zuurstof er in je bloed zit. Dit zegt iets over hoe goed je longen en bloedsomloop functioneren."
* for = Reference(ProviderTasks-Patient-Van-Dijk) "Sanne van Dijk"
* focus = Reference(ProviderTasks-ServiceRequestExecution-Saturatiemeting)
* executionPeriod
  * start = "2026-01-10"
  * end = "2026-01-10"
* authoredOn = "2026-01-05T08:00:00+01:00"
* lastModified = "2026-01-05T08:00:00+01:00"
* requester = Reference(ProviderTasks-PractitionerRole-Van-Rijn) "M. van Rijn, huisarts"
* owner = Reference(ProviderTasks-Patient-Van-Dijk) "Sanne van Dijk"

Instance: ProviderTasks-Task-Meetopdracht-Saturatiemeting-7
InstanceOf: http://medmij.nl/fhir/StructureDefinition/pt-Task
Usage: #example
* text
  * status = #empty
  * div = "<div xmlns='http://www.w3.org/1999/xhtml'>No human-readable text provided in this case.</div>"
* extension
  * url = $koppeltaal-instantiates
  * valueReference = Reference(ProviderTasks-ActivityDefinition-Meetopdracht-Saturatiemeting)
    * type = "ActivityDefinition"
* basedOn = Reference(ProviderTasks-ServiceRequestDigitalGroup-COPD) "Digitale zorgmodule COPD"
* identifier
  * system = "https://hing.zno.com/taskIdentifier"
  * value = "TASK-Saturatie-7"
* status = #received
* intent = #order
* priority = #routine
* description = "Je meet saturatie om te kijken hoeveel zuurstof er in je bloed zit. Dit zegt iets over hoe goed je longen en bloedsomloop functioneren."
* for = Reference(ProviderTasks-Patient-Van-Dijk) "Sanne van Dijk"
* focus = Reference(ProviderTasks-ServiceRequestExecution-Saturatiemeting)
* executionPeriod
  * start = "2026-01-11"
  * end = "2026-01-11"
* authoredOn = "2026-01-05T08:00:00+01:00"
* lastModified = "2026-01-05T08:00:00+01:00"
* requester = Reference(ProviderTasks-PractitionerRole-Van-Rijn) "M. van Rijn, huisarts"
* owner = Reference(ProviderTasks-Patient-Van-Dijk) "Sanne van Dijk"


Instance: ProviderTasks-ActivityDefinition-Informatie-Leven-COPD
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
  * value = "ba7471c5-6b5c-4ac6-83c4-512d195cc9d8"
* url = "https://hing.zno.com/fhir/ActivityDefinition/3b13c173-d788-4ca6-8264-973abb4b95ce"
* version = "1.0.0"
* name = "InformatieLevenMetCOPD"
* title = "Informatie over leven met COPD"
* status = #active
* publisher = "HinqZNO"
* description = "Informatieve module voor patiënt: leven met COPD, inclusief inhalatiegebruik, energieverdeling, beweging en omgaan met benauwdheid."


Instance: ProviderTasks-Task-Informatie-leven-COPD
InstanceOf: http://medmij.nl/fhir/StructureDefinition/pt-Task
Usage: #example
* text
  * status = #empty
  * div = "<div xmlns='http://www.w3.org/1999/xhtml'>No human-readable text provided in this case.</div>"
* extension
  * url = $koppeltaal-instantiates
  * valueReference = Reference(ProviderTasks-ActivityDefinition-Informatie-Leven-COPD)
    * type = "ActivityDefinition"
* basedOn = Reference(ProviderTasks-ServiceRequestDigitalGroup-COPD) "Digitale zorgmodule COPD"
* identifier
  * system = "https://hing.zno.com/taskIdentifier"
  * value = "TASK-1673834"
* status = #received
* intent = #order
* priority = #routine
* description = "Lees de praktische tips om met COPD te leven."
* for = Reference(ProviderTasks-Patient-Van-Dijk) "Sanne van Dijk"
* executionPeriod
  * start = "2026-01-05"
  * end = "2026-01-11"
* authoredOn = "2026-01-05T07:00:00+01:00"
* lastModified = "2026-01-05T07:00:00+01:00"
* requester = Reference(ProviderTasks-PractitionerRole-Van-Rijn) "M. van Rijn, huisarts"
* owner = Reference(ProviderTasks-Patient-Van-Dijk) "Sanne van Dijk"


Instance: ProviderTasks-ActivityDefinition-Informatie-Inhalatiemedicatie
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
  * value = "3a8ab931-6106-4df8-ba62-28882f6bfe5f"
* url = "https://hing.zno.com/fhir/ActivityDefinition/d98a2329-4e69-4334-9c01-01230e3d444e"
* version = "1.0.0"
* name = "InstructieInhalatiemedicatie"
* title = "Instructiemodule inhalatiemedicatie"
* status = #active
* publisher = "HinqZNO"
* description = "Instructiemodule inhalatiemedicatie: juiste inhalatietechniek, therapietrouw en praktische adviezen (inclusief controlepunten en veelgemaakte fouten)."

Instance: ProviderTasks-Task-Informatie-Informatie-Inhalatiemedicatie
InstanceOf: http://medmij.nl/fhir/StructureDefinition/pt-Task
Usage: #example
* text
  * status = #empty
  * div = "<div xmlns='http://www.w3.org/1999/xhtml'>No human-readable text provided in this case.</div>"
* extension
  * url = $koppeltaal-instantiates
  * valueReference = Reference(ProviderTasks-ActivityDefinition-Informatie-Inhalatiemedicatie)
    * type = "ActivityDefinition"
* basedOn = Reference(ProviderTasks-ServiceRequestDigitalGroup-COPD) "Digitale zorgmodule COPD"
* identifier
  * system = "https://hing.zno.com/taskIdentifier"
  * value = "TASK-983823471"
* status = #requested
* intent = #order
* priority = #routine
* description = "Lees hoe je inhalatiemedicatie thuis goed gebruikt."
* for = Reference(ProviderTasks-Patient-Van-Dijk) "Sanne van Dijk"
* executionPeriod
  * start = "2026-01-05"
  * end = "2026-01-11"
* authoredOn = "2026-01-05T07:00:00+01:00"
* lastModified = "2026-01-05T07:00:00+01:00"
* requester = Reference(ProviderTasks-PractitionerRole-Van-Rijn) "M. van Rijn, huisarts"
* owner = Reference(ProviderTasks-Patient-Van-Dijk) "Sanne van Dijk"


Instance: ProviderTasks-ActivityDefinition-Vragenlijst-Wat-Bereiken
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
  * value = "669734ff-2c72-4758-b6ac-786a4c8474b4"
* url = "https://hing.zno.com/fhir/ActivityDefinition/4df11d7e-3439-4ec7-b912-871f048a3f47"
* version = "1.0.0"
* name = "VragenlijstWatWiltUBereiken?"
* title = "Vragenlijst: Wat wilt u bereiken?"
* status = #active
* publisher = "HinqZNO"
* description = "Vragenlijst Wat wilt u bereiken? om patiëntdoelen en prioriteiten in kaart te brengen als basis voor gezamenlijke besluitvorming en het behandel-/zelfmanagementplan."


Instance: ProviderTasks-Task-Vragenlijst-Wat-Bereiken
InstanceOf: http://medmij.nl/fhir/StructureDefinition/pt-Task
Usage: #example
* text
  * status = #empty
  * div = "<div xmlns='http://www.w3.org/1999/xhtml'>No human-readable text provided in this case.</div>"
* extension
  * url = $koppeltaal-instantiates
  * valueReference = Reference(ProviderTasks-ActivityDefinition-Vragenlijst-Wat-Bereiken)
    * type = "ActivityDefinition"
* basedOn = Reference(ProviderTasks-ServiceRequestDigitalGroup-COPD) "Digitale zorgmodule COPD"
* identifier
  * system = "https://hing.zno.com/taskIdentifier"
  * value = "TASK-74745858"
* status = #requested
* intent = #order
* priority = #routine
* description = "Beantwoord deze vragen over wat je belangrijk vindt en wat je wilt bereiken met je behandeling of begeleiding."
* for = Reference(ProviderTasks-Patient-Van-Dijk) "Sanne van Dijk"
* executionPeriod
  * start = "2026-01-05"
  * end = "2026-01-11"
* authoredOn = "2026-01-05T18:00:00+01:00"
* lastModified = "2026-01-05T18:00:00+01:00"
* requester = Reference(ProviderTasks-PractitionerRole-Van-Rijn) "M. van Rijn, Huisarts"
* owner = Reference(ProviderTasks-Patient-Van-Dijk) "Sanne van Dijk"

Instance: ProviderTasks-Patient-Van-Dijk
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
  * text = "Sanne van Dijk"
  * family = "van Dijk"
    * extension[http://hl7.org/fhir/StructureDefinition/humanname-own-prefix].valueString = "van"
    * extension[http://hl7.org/fhir/StructureDefinition/humanname-own-name].valueString = "Dijk"
  * given = "Sanne"
    * extension[http://hl7.org/fhir/StructureDefinition/iso21090-EN-qualifier].valueCode = #BR
* name[1]
  * use = #usual
  * given = "Sanne"
* telecom[0]
  * system = #phone
    * extension[http://nictiz.nl/fhir/StructureDefinition/ext-CodeSpecification].valueCodeableConcept = http://terminology.hl7.org/CodeSystem/v3-AddressUse#MC "mobile contact"
  * value = "+31655501234"
* telecom[1]
  * system = #email
  * value = "sanne.vandijk@voorbeeldmail.nl"
  * use = #home
* gender = #female
  * extension[http://nictiz.nl/fhir/StructureDefinition/ext-CodeSpecification].valueCodeableConcept.coding = http://terminology.hl7.org/CodeSystem/v3-AdministrativeGender#F "Female"
* birthDate = "1984-03-14"
* deceasedBoolean = false
* address
  * extension[http://nictiz.nl/fhir/StructureDefinition/ext-AddressInformation.AddressType].valueCodeableConcept = http://terminology.hl7.org/CodeSystem/v3-AddressUse#HP "primary home"
  * use = #home
  * type = #both
  * line = "Prinsengracht 263"
    * extension[http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-streetName].valueString = "Prinsengracht"
    * extension[http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-houseNumber].valueString = "263"
  * city = "Amsterdam"
  * postalCode = "1016 GV"
  * country = "Nederland"
    * extension[http://nictiz.nl/fhir/StructureDefinition/ext-CodeSpecification].valueCodeableConcept = urn:iso:std:iso:3166#NL "Netherlands"

Instance: ProviderTasks-PractitionerRole-Van-Rijn
InstanceOf: http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthProfessional-PractitionerRole
Usage: #example
* text
  * status = #empty
  * div = "<div xmlns='http://www.w3.org/1999/xhtml'>No human-readable text provided in this case.</div>"
* practitioner = Reference(ProviderTasks-Practitioner-Van-Rijn) "M. van Rijn"
* organization = Reference(ProviderTasks-Organization-Huisartsenpraktijk-De-Haard) "Huisartstenpraktijk de Haard"
* specialty
  * coding = urn:oid:2.16.840.1.113883.2.4.6.7#0110 "Huisarts, apotheekhoudend"

Instance: ProviderTasks-Practitioner-Van-Rijn
InstanceOf: http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthProfessional-Practitioner
Usage: #example
* text
  * status = #empty
  * div = "<div xmlns='http://www.w3.org/1999/xhtml'>No human-readable text provided in this case.</div>"
* identifier
  * system = "http://fhir.nl/fhir/NamingSystem/big"
  * value = "19078234"
* name
  * use = #official
  * text = "M. van Rijn"
  * family = "van Rijn"
    * extension[http://hl7.org/fhir/StructureDefinition/humanname-own-prefix].valueString = "van"
    * extension[http://hl7.org/fhir/StructureDefinition/humanname-own-name].valueString = "Rijn"
  * given[0] = "M."
    * extension[http://hl7.org/fhir/StructureDefinition/iso21090-EN-qualifier].valueCode = #IN
* telecom[0]
  * system = #phone
  * value = "+31655506789"
  * use = #work
* telecom[1]
  * system = #email
  * value = "m.vanrijn@huisartspraktijk-example.nl"
  * use = #work
