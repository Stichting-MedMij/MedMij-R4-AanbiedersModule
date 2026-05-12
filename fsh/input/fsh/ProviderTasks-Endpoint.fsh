Profile: PtEndpoint
Parent: Endpoint
Id: pt-Endpoint
Description: "This (FHIR) Endpoint profile represents the technical FHIR REST endpoint of a source system (XIS), used by a ProviderTask to retrieve and update task data and the required context for the ProviderTask use case."
* ^status = #draft
* insert PublisherAndContact
* insert Origin
* extension contains PtClientID named clientId 0..*
* connectionType from $koppeltaal-endpoint-connection-type-vs (extensible)
* managingOrganization only Reference(Organization or http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthcareProvider-Organization)