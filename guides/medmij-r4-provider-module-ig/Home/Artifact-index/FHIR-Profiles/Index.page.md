---
topic: FHIRProfilesIndex
---

# FHIR profiles
## Provider task-specific profiles
The following FHIR profiles have been introduced for the Provider Task standard:

| CIM (concept) | FHIR resource | FHIR profile |
| --- | --- | --- |
| {{pagelink: LogicalModelsIndex, text: Task, anchor: ptlmTask}} | Task | {{pagelink: FHIRProfilesIndex, text: pt-Task, anchor: ptTask}} |
| {{pagelink: LogicalModelsIndex, text: ActivityDefinition, anchor: ptlmActivityDefinition}} | ActivityDefinition | {{pagelink: FHIRProfilesIndex, text: pt-ActivityDefinition, anchor: ptActivityDefinition}} |
| {{pagelink: LogicalModelsIndex, text: ServiceRequest, anchor: ptlmServiceRequest}} | ServiceRequestExecutionOrder | {{pagelink: FHIRProfilesIndex, text: pt-ServiceRequestExecutionOrder, anchor: ptServiceRequestExecutionOrder}} |
|  | ServiceRequestDigitalGroupPlan | {{pagelink: FHIRProfilesIndex, text: pt-ServiceRequestDigitalGroupPlan, anchor: ptServiceRequestDigitalGroupPlan}} |
|  | Endpoint | {{pagelink: FHIRProfilesIndex, text: pt-Endpoint, anchor: ptEndpoint}} |

**Table 1: Relevant Provider task-specific profiles**

Note the following:
- The [Nictiz Profiling Guidelines for FHIR R4](https://informatiestandaarden.nictiz.nl/wiki/FHIR:V1.0_FHIR_Profiling_Guidelines_R4) have been used as guidelines for creating the profiles.
- The (element) descriptions present in the profiles are taken from the respective Logical Model the mapped concept originates from.
- The ['open world' modeling](https://informatiestandaarden.nictiz.nl/wiki/FHIR:V1.0_FHIR_Profiling_Guidelines_R4#Open_vs._closed_world_modeling) approach is adopted as much as possible. Notable exceptions are cardinalities that have been restricted based on the functional dataset of the MedMij use case, such as several minimum cardinalities.

## Other profiles
FHIR R4 conformance resources developed by Nictiz (based on zib publication 2020) from the [nl-core 0.12.0-beta.4 package](https://simplifier.net/packages/nictiz.fhir.nl.r4.nl-core/0.12.0-beta.4) are used and referenced where possible. In particular, the zibs and corresponding nl-core profiles collected in the table below are used.

| Zib | FHIR resource | FHIR profile |
| --- | --- | --- |
| [Patient](https://zibs.nl/wiki/Patient-v3.2(2020EN)) | Patient | [nl-core-Patient](https://simplifier.net/packages/nictiz.fhir.nl.r4.zib2020/0.12.0-labtrial.1/files/3219724) |
| [HealthProfessional](https://zibs.nl/wiki/HealthProfessional-v3.5(2020EN)) | PractitionerRole <br/> Practitioner | [nl-core-HealthProfessional-PractitionerRole](https://simplifier.net/resolve?canonical=http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthProfessional-PractitionerRole&scope=nictiz.fhir.nl.r4.nl-core@0.12.0-beta.4) <br/> [nl-core-HealthProfessional-Practitioner](https://simplifier.net/resolve?canonical=http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthProfessional-Practitioner&scope=nictiz.fhir.nl.r4.nl-core@0.12.0-beta.4) |
| [HealthcareProvider](https://zibs.nl/wiki/HealthcareProvider-v3.4(2020EN)) | Location <br/> Organization | [nl-core-HealthcareProvider](https://simplifier.net/resolve?canonical=http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthcareProvider&scope=nictiz.fhir.nl.r4.nl-core@0.12.0-beta.4) <br/> [nl-core-HealthcareProvider-Organization](https://simplifier.net/resolve?canonical=http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthcareProvider-Organization&scope=nictiz.fhir.nl.r4.nl-core@0.12.0-beta.4) |

**Table 2: Relevant nl-core profiles**

Note the following:
- Each occurrence of the zib HealthProfessional is normally represented by two FHIR resources: a PractitionerRole resource (instance of nl-core-HealthProfessional-PractitionerRole) and a Practitioner resource (instance of nl-core-HealthProfessional-Practitioner). The Practitioner resource is referenced from the PractitionerRole instance. For this reason, sending systems should fill the reference to the PractitionerRole instance where relevant, and not the Practitioner resource. Receiving systems can then retrieve the reference to the Practitioner resource from that PractitionerRole instance.
In rare circumstances, there is only a Practitioner instance, in which case it is that instance which will be referenced instead. However, since this should be the exception, the nl-core-HealthProfessional-Practitioner profile is never explicitly mentioned as a target profile.
This is in line with the [Nictiz Profiling Guidelines for FHIR R4](https://informatiestandaarden.nictiz.nl/wiki/FHIR:V1.0_FHIR_Profiling_Guidelines_R4#Referencing_zib_HealthProfessional).