Extension: ExtEndpointReference
Id: ext-Endpoint
Title: "ext Endpoint"
Description: "Reference to the Endpoint that provides the launchable digital activity."
* ^url = "http://medmij.nl/fhir/StructureDefinition/ext-Endpoint"
* ^status = #draft
* insert PublisherAndContact
* value[x] only Reference(PtEndpoint)
* ^context[0].type = #element
* ^context[0].expression = "ActivityDefinition"
