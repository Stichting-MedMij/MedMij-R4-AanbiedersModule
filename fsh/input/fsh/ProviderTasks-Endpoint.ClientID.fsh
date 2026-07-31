Extension: ExtEndpointClientID
Id: ext-Endpoint.ClientID
Title: "ext Endpoint.ClientID"
Description: "The client ID is used as an input parameter named audience in the token exchange request between PHR and the DVA authorisation server."
* ^url = "http://medmij.nl/fhir/StructureDefinition/ext-Endpoint.ClientID"
* ^status = #draft
* insert PublisherAndContact
* . ..1
  * ^definition = "The client ID is used as an input parameter named audience in the token exchange request between PHR and the DVA authorisation server."
  * ^comment = """
The purpose of client ID is to perform impersonation during token exchange, which results in a launch token of type: _urn:medmij:token-type:launch-code_ and a `smart_launch_context` being stored in the DVA authorisation server for that client ID.

The launch token is used again as the value for the `launch` parameter in the SMART on FHIR launch URL.

The module application that receives the SMART on FHIR launch URL requests a new access token with the same client ID, including the launch token as an additional parameter from the DVA authorisation server, which includes the `smart_launch_context` in the final token response if both the launch token and client ID match.
 """
* value[x] only string
* ^context[0].type = #element
* ^context[0].expression = "Endpoint"
