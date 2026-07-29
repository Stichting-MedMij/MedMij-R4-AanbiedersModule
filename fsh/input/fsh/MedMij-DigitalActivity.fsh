Extension: ExtDigitalActivity
Id: ext-DigitalActivity
Title: "ext DigitalActivity"
Description: "Reference to the digital activity definition associated with this task."
* ^url = "http://medmij.nl/fhir/StructureDefinition/ext-DigitalActivity"
* ^status = #draft
* insert PublisherAndContact
* value[x] only Reference(PtDigitalActivity)
* ^context[0].type = #element
* ^context[0].expression = "Task"
