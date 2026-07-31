Instance: pt-Task-digitalActivity
InstanceOf: SearchParameter
Usage: #definition
* insert DefaultNarrativeInstance
* url = "http://medmij.nl/fhir/SearchParameter/Task-digitalActivity"
* name = "PtTaskDigitalActivity"
* status = #draft
* experimental = false
* date = "2026-07-13"
* insert PublisherAndContactInstance
* description = "Search Tasks based on the referenced digital activity (ActivityDefinition) they instantiate."
* purpose = "Enables clients and servers to find the Task(s) that are associated with a particular digital activity (ActivityDefinition), which is referenced from the Task via the ext-Task.DigitalActivity extension."
* code = #digital-activity
* base = #Task
* type = #reference
* target = #ActivityDefinition
* expression = "Task.extension('http://medmij.nl/fhir/StructureDefinition/ext-Task.DigitalActivity').valueReference"
