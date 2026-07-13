Instance: pt-Task-digitalActivity
InstanceOf: SearchParameter
Usage: #definition
* insert DefaultNarrative
* url = "http://medmij.nl/fhir/SearchParameter/Task-digitalActivity"
* name = "PtTaskDigitalActivity"
* status = #draft
* experimental = false
* date = "2026-07-13"
* insert PublisherAndContact
* description = "Search Tasks based on the referenced digital activity (ActivityDefinition) they instantiate."
* purpose = "Enables clients and servers to find the Task(s) that are associated with a particular DigitalActivity (ActivityDefinition), which is referenced from the Task via the ext-DigitalActivity extension."
* code = #digitalActivity
* base = #Task
* type = #reference
* target = #ActivityDefinition
* expression = "Task.extension('http://medmij.nl/fhir/StructureDefinition/ext-DigitalActivity').value"
