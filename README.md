# MedMij-R4-ProviderTasks
This repository contains HL7 FHIR R4 compliant conformance materials for MedMij R4 Tasks, Activity Definitions and Endpoints for the dataservice ProviderTasks. This dataservice will be used in the projects ‘AanbiederTaken’ and ‘Persoonsgerichte Hybride Netwerkzorg’. This project is currently in a pre-publication status and can therefore not be considered stable.

This IG builds upon the MedMij R4 Core IG. This is the generic layer defined by MedMij which forms a foundation for all data services that are exchanged in FHIR R4. It contains guidance and requirements on data service-overaching topics, such as granular exchange and Logical Models. Moreover, it might contain FHIR artifacts that are relevant for multiple data services. In particular, MedMij R4 Core contains granular, cross-domain data services that are reusable across care domains.

Please note that this guide is currently in its alpha phase. As we progress through the alpha phase, we are actively gathering feedback, identifying areas for improvement, and documenting lessons learned.

A new version of this guide will be released after the alpha phase is complete. The updated version will include additional insights, refinements, and comprehensive details based on everything we encountered during this phase.

For questions or feedback on the IG, please reach out to MedMij via info@medmij.nl.

## scripts/

Build helpers. Requires [SUSHI](https://github.com/FHIR/sushi) and Python on PATH.

Run [scripts/build-and-sort.ps1](scripts/build-and-sort.ps1) after changing anything under [fsh/](fsh/); it does three things:

1. Runs `sushi` in [fsh/](fsh/) to generate resources into `fsh/fsh-generated/resources`.
2. Moves each generated JSON to a top-level folder by resource type — `CapabilityStatements/`, `StructureDefinitions/`, `SearchParameter/`, everything else to `examples/`.
3. Regenerates derived IG content: [lm_to_plantuml.py](scripts/lm_to_plantuml.py) and [profiles_to_plantuml.py](scripts/profiles_to_plantuml.py) (diagrams), [add_page_toc.py](scripts/add_page_toc.py) (page tables of contents).

[make_put_bundles.py](scripts/make_put_bundles.py) is standalone — run it manually when you need PUT bundles of the examples.