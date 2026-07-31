# {{page-title}}

## 1.0.0-alpha.2

| Component | Description | Ticket |
| --- | --- | --- |
| Dataset | Logical Models have been renamed to align with the functional building blocks: Activity → DigitalActivity, ServiceRequest → ExecutionOrder. Naming of Logical Models has been aligned with the profiling guidelines. | [TOOLBOX1-896](https://medmij.atlassian.net/browse/TOOLBOX1-896) |
| Dataset | Logical Models for DigitalGroupPlan and Endpoint have been added. | [TOOLBOX1-896](https://medmij.atlassian.net/browse/TOOLBOX1-896) |
| Dataset | Concepts Identifier, AuthoredOn, LastModified, Owner and GroupPlan have been added to the Task Logical Model. Concepts Identifier, Usage and Endpoint have been added or clarified on the DigitalActivity Logical Model. | [TOOLBOX1-896](https://medmij.atlassian.net/browse/TOOLBOX1-896) |
| Dataset | The `.status` of all Logical Models has been set to *draft*. Purposes, shorts, aliases and mappings have been aligned with the MedMij profiling guidelines. | [TOOLBOX1-896](https://medmij.atlassian.net/browse/TOOLBOX1-896) |
| Functional design | The functional design has been rewritten based on review feedback: reduced redundancy, clarified system roles (including the module system), and aligned naming and process description with the technical design. | [TOOLBOX1-896](https://medmij.atlassian.net/browse/TOOLBOX1-896) |
| Functional design | The display guideline has been updated. | [TOOLBOX1-896](https://medmij.atlassian.net/browse/TOOLBOX1-896) |
| Technical design | The technical design has been restructured into a single Provider Tasks use case with clearer request, response, launch and update sections. Redundant workflow explanation has been reduced. | [TOOLBOX1-896](https://medmij.atlassian.net/browse/TOOLBOX1-896) |
| Technical design | Task search guidance has been updated: Tasks in scope SHALL be filtered using `_tag=http://medmij.nl/fhir/CodeSystem/information-standard\|providertasks`. Guidance on resolving secondary resources and `_include` has been clarified. | [TOOLBOX1-896](https://medmij.atlassian.net/browse/TOOLBOX1-896) |
| Technical design | Guidance on updating `Task.status` by the module system (JSON Patch) has been clarified. The term PHR is used consistently instead of PGO. | [TOOLBOX1-896](https://medmij.atlassian.net/browse/TOOLBOX1-896) |
| Technical design | A section relating FHIR profiles to their functional counterpart has been added, including resource relationship guidance and an example sequence diagram. | [TOOLBOX1-896](https://medmij.atlassian.net/browse/TOOLBOX1-896) |
| Technical design | Links to CapabilityStatements have been added for the PHR, XIS and module system. | [TOOLBOX1-896](https://medmij.atlassian.net/browse/TOOLBOX1-896) |
| FHIR artifacts | CapabilityStatements have been reorganized per actor: `pt-PHR` (client), `pt-XIS` (server) and `pt-ModuleSystem` (client). The former `pt-Task-Retrieve` and `pt-Task-Serve` CapabilityStatements have been replaced. | [TOOLBOX1-896](https://medmij.atlassian.net/browse/TOOLBOX1-896) |
| FHIR artifacts | FHIR profiles have been renamed to align with the functional building blocks: `pt-ActivityDefinition` → `pt-DigitalActivity`, `pt-ServiceRequest-DigitalGroupPlan` → `pt-DigitalGroupPlan`, `pt-ServiceRequest-ExecutionOrder` → `pt-ExecutionOrder`. | [TOOLBOX1-896](https://medmij.atlassian.net/browse/TOOLBOX1-896) |
| FHIR artifacts | MedMij extensions `ext-DigitalActivity` and `ext-Endpoint` have been introduced. The Koppeltaal `instantiates` extension is no longer used. The ClientID extension has been renamed to `ext-ClientID`. | [TOOLBOX1-896](https://medmij.atlassian.net/browse/TOOLBOX1-896) |
| FHIR artifacts | On `pt-Task`, a mandatory `.meta.tag` slice for the Provider Tasks information standard has been added. The cardinality of `ext-DigitalActivity` has been set to `1..1`, `.basedOn` to `1..1` and `.status` to `1..1`. `.partOf` has been removed. `.requester` has been restricted to Practitioner / PractitionerRole. | [TOOLBOX1-896](https://medmij.atlassian.net/browse/TOOLBOX1-896) |
| FHIR artifacts | SearchParameter `pt-Task-digitalActivity` has been added to enable searching and `_include` on the digital activity referenced from Task. | [TOOLBOX1-896](https://medmij.atlassian.net/browse/TOOLBOX1-896) |
| FHIR artifacts | Titles, descriptions, purposes, metadata and mappings of profiles have been aligned with the Logical Models and MedMij profiling guidelines. | [TOOLBOX1-896](https://medmij.atlassian.net/browse/TOOLBOX1-896) |
| FHIR artifacts | For each Logical Model and FHIR profile, mappings have been added in the IG. For each FHIR profile, (links to) the corresponding examples have been added in the IG. | [TOOLBOX1-896](https://medmij.atlassian.net/browse/TOOLBOX1-896) |
| FHIR artifacts | The `Koppeltaalv2.00` dependency has been updated to version 0.16.2 (package name casing corrected). The `nl-core` and `zib2020` dependencies have been updated to 0.12.0-beta.4. | [TOOLBOX1-896](https://medmij.atlassian.net/browse/TOOLBOX1-896) |
| Test material | The structure and wording of the functional test material have been updated. | [TOOLBOX1-896](https://medmij.atlassian.net/browse/TOOLBOX1-896) |

## 1.0.0-alpha.1

Initial version, intended for a Proof of Concept (PoC).
