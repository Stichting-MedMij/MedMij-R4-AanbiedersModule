Profile: PtEndpoint
Parent: Endpoint
Id: pt-Endpoint
Title: "pt Endpoint"
Description: "Technical FHIR REST endpoint of a source system (XIS), used by a Task to retrieve and update task data and the required context for the Provider Tasks use case."
* ^status = #draft
* insert PublisherAndContact
* ^purpose = "This Endpoint resource represents the Endpoint building block for patient use cases in the context of the information standard Provider Tasks (Aanbiedertaken)."
* extension contains ExtClientID named clientId 0..*
* status 1..1
  * ^short = "Status"
  * ^definition = "The operational status of the endpoint (e.g., active, suspended, error, off, entered-in-error)."
* connectionType from $koppeltaal-endpoint-connection-type-vs (extensible)
* managingOrganization only Reference(Organization or http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthcareProvider-Organization)
 