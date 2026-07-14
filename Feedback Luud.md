# Feedback Luud

> Status labels and action wording are retained from the source document.

## FHIR profiles

- The FHIR resources ‘ServiceRequestExecutionOrder’ and ‘ServiceRequestDigitalGroupPlan’ do not exist; this needs to be changed to ServiceRequest. **DONE**
- The profiles should be renamed to align with what they functionally represent: **DONE**
    - pt-ActivityDefinition → pt-Activity or pt-DigitalActivity (based on what is chosen in the Logical Model)
    - pt-ServiceRequestExecutionOrder → pt-ExecutionOrder
    - pt-ServiceRequestDigitalGroupPlan → pt-DigitalGroupPlan
- What are the functional counterparts of the ServiceRequestDigitalGroupPlan and Endpoint profiles? **DONE**
- Nice to have: add an overview of profiles and their relation with each other, similar to what is done for Pathology. **OPEN**
- Nice to have: add Mappings and Examples tabs to each FHIR profile. **DONE**
- Add a .title of the form ‘pt Task’ to each FHIR profile. **DONE**
- Change the .description of the FHIR profiles, as well as the .definition of the root element, to the .description of the corresponding Logical Model. If additional information needs to be added to the .description of the FHIR profile, add that in a separate paragraph. **DONE**
- Change the .purpose of the FHIR profiles to the form ‘This Task resource represents the Task building block for patient use cases in the context of the information standard Provider Tasks (Aanbiedertaken).’ **DONE**
- When constraining references, the target profile will be added next to the base resource (and not instead of the base resource), in line with open world modelling and the [Nictiz profiling guidelines](https://informatiestandaarden.nictiz.nl/wiki/FHIR:V1.0_FHIR_Profiling_Guidelines_R4). **DONE**
- The metadata on the elements (i.e. .short, .definition and .alias) is added very inconsistently; not all of these are filled, even when there is a clear mapping from the underlying Logical Model. Moreover, they sometimes do not align with the values of the corresponding Logical Model concepts. **DONE**
- Nice to have: sort the profiles alphabetically. **DONE**
- Change ‘ActivityDefinition (Module)’ in the index to simply the name of the corresponding profile. **DONE**
- Small textual changes: **DONE**
    - Provider Task standard → Provider Tasks standard
    - Provider task-specific → Provider tasks-specific
- Specific changes for the Task profile:
    - The profile is missing a criterium that distinguishes Tasks used within Provider Tasks from Tasks originating in another context. I would expect either .code or .meta.tag to be used for this purpose. I would advice to start a thread on Zulip to gather some feedback regarding this topic. Personally, using .meta.tag seems the best approach, as it is then simply used to add some non-clinical information. Moreover, it is possible to filter on this element, so the search request can be changed accordingly. **OPEN**
    - No guidance is present on the resource-origin extension, and there also isn’t any guidance on this extension in the technical design, so it is unclear how this should be used or how it is related to the functional model. Is it even necessary to be included in the profile? **DONE**
    - The instantiates extension is mapped to the ActivityDefinition concept in the Task Logical Model, which references the Activity Logical Model. However, the instantiates extension refers to the KT2_ActivityDefinition profile, while there also exists a ActivityDefinition profile authored by MedMij. This construction is inconsistent, especially because the Koppeltaal and MedMij profiles are incompatible (for instance, functional concepts have been mapped to .publisher and .timing in the MedMij profile, while these elements have cardinality 0..0 in the Koppeltaal profile). Hence the instantiates extension of Koppeltaal cannot be used; instead, within Provider Tasks a custom extension needs to be introduced that references the ActivityDefinition profile authored by MedMij. Note that if the Koppeltaal and Provider Tasks profiles would be compatible, the Koppeltaal extension can be used, but it makes sense to change the target profile to the MedMij one. **DONE**
    - Shouldn’t the instantiates extension have cardinality 1..\* (or even 1..1), based on the functional design? **OPEN DISCUSS WITH MICHAEL OR JELMER**
    - Why is the .identifier mandatory, but no corresponding concept has been added to the functional model? It’s better to add it there, and then add mappings and guidance in the profile afterwards. **DONE**
    - The element .basedOn is used to refer to the digital group plan. However, a mapping is added to pt-dataelement-3, which, according to the Logical Model, is actually a link to the execution order. Hence the elements .basedOn and .focus, and their corresponding Logical Model concepts, need to be revisited, and mapped properly to each other. **DONE**
    - Shouldn’t .basedOn have cardinality 1..\* (or even 1..1), based on the functional design? **OPEN DISCUSS WITH JELMER**
    - The functional design states multiple times that there is no task hierarchy. Why then is pt-Task added as a reference on .partOf? **DONE**
    - Is it possible to add a pattern or at least guidance on the mandatory element .intent? **OPEN DISCUSS WITH MICHAEL OR JELMER**
    - The .comment on .for is redundant and can be removed, since this is already evident from the target profile and the .definition. **DONE**
    - Consider to restrict the .requester to only Practitioner, PractitionerRole and nl-core-HealthProfessional.PractitionerRole, in line with the corresponding Logical Model concept. **DONE**
    - Change the metadata on .requester to those present in the Logical Model, and remove the current .definition. You could consider to move the current .definition to the .comment, but is it of added value to add a Koppeltaal-related comment in a Provider Tasks profile? **DONE**
    - Why is the .owner mandatory, but no corresponding concept has been added to the functional model? It’s better to add it there, and then add mappings and guidance in the profile afterwards. **DONE**
    - In the .comment on .owner, remove ‘For Koppeltaal: ‘, and change 'ProviderTasks’ to 'Provider Tasks’. More importantly, the .comment is not structured in a nice way: the information on Koppeltaal and Provider Tasks sandwiches the general guidance on HealthProfessional, but it makes more sense to keep the former information together at the top of the .comment. **DONE**
    - According to the technical design, only Tasks for which the Patient is the .owner are retrieved by the PHR. However, in the profile other types of owners are mentioned as well. How does this work in practice? For instance, what happens to Tasks that do not have the Patient as .owner and that have to be filled in by a caregiver or health professional? Where will these Tasks be tracked? Also see my comment on the technical design on the unfeasibility of this approach. **DONE**
- Specific changes for the ActivityDefinition profile:
    - Why is the .definition on the root different from the .definition of the corresponding Logical Model concept? **DONE**
    - No guidance is present on the resource-origin extension, and there also isn’t any guidance on this extension in the technical design, so it is unclear how this should be used or how it is related to the functional model. Is it even necessary to be included in the profile? **DONE**
    - The endpoint extension is mandatory, but there is no corresponding concept in the functional model. Does it make sense to add this? **DONE**
    - The endpoint extension refers to the Koppeltaal Endpoint profile, while there also has been introduced an Endpoint profile within Provider Tasks. How are these related? They are incompatible, so it doesn’t make sense to use the endpoint extension from Koppeltaal. **DONE**
    - No guidance is present on the publisherId extension, and there also isn’t any guidance on this extension in the technical design, so it is unclear how this should be used or how it is related to the functional model. Is it even necessary to be included in the profile? **DONE**
    - Some minor profiling has been done on .useContext and .usage, but there is no functional basis or further explanation in the technical design. **DONE**
    - Why is there no functional counterpart of the .topic element? **DONE**
- Specific changes for the Endpoint profile:
    - Add guidance on the mandatory .status element. **DONE**
    - It seems that changes in the Koppeltaal Endpoint profile have been adopted as much as possible. This is however, not the case for the .payloadType. What is the rationale behind this? **DONE**
    - Add some formatting of the .comment on the ClientID extension to make it more readable (for instance, by making the values italic, and using the code ‘font’ for parameters, e.g. launch parameter and smart_launch_context). Moreover, please remove ‘Translated with [DeepL AI Platform: Translation, Voice & API](http://deepl.com/) (free version)', and change ‘SmartOnFhir’ to 'SMART on FHIR’ (twice). **DONE**
    - In the .description and the root .definition of the ClientID extension, remove ‘from the Endpoint resource extension’. Also, change “audience” to audience, and ‘PGO’ to ‘PHR’. Do we also have a broadly used English translation of DVA? **DONE**
    - The metadata of the ClientID extension is not in line with the profiling guidelines: **DONE**
        - Change the .id to ‘ext-ClientID’.
        - Change the .name to ‘ExtClientID’.
        - Add a .title with value ‘ext ClientID’.
        - Consider to change the .url to ‘…/ext-Endpoint.ClientID’ in case there will be another ClientID in another data service with a different meaning. If this is indeed changed, the above metadata should change accordingly as well (i.e. ‘ext-Endpoint.ClientID’, ‘ExtEndpointClientID’ and ‘ext Endpoint.ClientID’, respectively).
- Specific changes for the ServiceRequestExecutionOrder profile:
    - No guidance is present on the resource-origin extension, and there also isn’t any guidance on this extension in the technical design, so it is unclear how this should be used or how it is related to the functional model. Is it even necessary to be included in the profile? **DONE**
    - Add guidance on the mandatory element .status. **DONE**
    - Consider to restrict the .subject to only the Patient resource and nl-core-Patient profile, since in the MedMij use case the other resource types do not make sense (note that this is a justified deviation from the open world modelling we adopt). **DONE**
    - Consider to restrict the .requester to only Practitioner, PractitionerRole and nl-core-HealthProfessional.PractitionerRole, in line with the corresponding Logical Model concept. **DONE**
    - Based on the possible cardinality change of the PatientInstruction concept in the corresponding Logical Model, the cardinality of .patientInstruction might need to be updated as well. **DONE**
- Specific changes for the ServiceRequestDigitalGroupPlan profile:
    - As noted before, add a corresponding Logical Model, and add mappings in the FHIR profile. **DONE**
    - No guidance is present on the resource-origin extension, and there also isn’t any guidance on this extension in the technical design, so it is unclear how this should be used or how it is related to the functional model. Is it even necessary to be included in the profile? **DONE**
    - Add guidance on the mandatory element .status. **DONE**
    - It is confusing to use the term ‘identifier’ on .code. Moreover, consider to remove the guidance on .code itself, since it overlaps with the guidance on .code.text. **DONE**
    - Only the first sentence should be kept on the .definition of .code.text; the other sentences are better suited as .comment. Moreover, change ‘MUST’ to ‘SHALL’, since the former is not used as conformance verb in FHIR. Moreover, the MUST statement is a bit vague. Does it mean that the .reference.display on Task.basedOn needs to be exactly the same as the ServiceRequest.code.text?
    - What is exactly meant by ‘Task group’ in the .definition of .code.text? **DONE**
    - Consider to restrict the .subject to only the Patient resource and nl-core-Patient profile, since in the MedMij use case the other resource types do not make sense (note that this is a justified deviation from the open world modelling we adopt). **DONE**

## Technical design

- The technical design as a whole feels very bloated. The same information is repeated multiple times in 2.2, 2.5 and 2.6. **DONE**
- Bring the introduction in line with other data services, i.e.: **DONE**
    - This technical design provides the technical specification of the Provider Tasks (Dutch: Aanbiedertaken) standard.

        This technical design is the technical counterpart of the [functional design](https://simplifier.net/guide/medmij-r4-dentalcare-ig/Home/Functional-Design/Functional-design?version=1.0.0-rc.1). The FHIR version used for this IG is R4 (4.0.1).

        Note that in addition to this design, the (technical) guidelines as specified in the [MedMij FHIR IG by Nictiz](https://informatiestandaarden.nictiz.nl/wiki/MedMij:IG:V1/FHIR_IG) apply.
- Since COW was used as the guiding framework, consider to add it as a dependency on the Dependencies page. Moreover, which version was used as base? **DONE**
- Section 2.2 is very bloated: **DONE**
    - Is section 2.2.1 really necessary? It makes sense to state that the Workflow specification has been used as framework by adding a link, but it seems like overkill to introduce the specific terms (Definitions, Request and Events), since these are not used in the technical design outside 2.2.1 and 2.2.2.
    - Remove the ‘Design rule’ from the third bullet in 2.2.2, as it is mentioned in 2.2.3.1 as well.
    - Most of the information in 2.2.3 is already present in 2.2.2 (with the exception of the third bullet regarding the instantiates extension), so these should be combined.
- Why is 2.2.3.1 a subsection of 2.2.3? **DONE**
- In 2.3 I would expect links to CapabilityStatements (compare with e.g. Image Availability or Pathology). **DONE**
- In the first sentence of 2.4, ‘typically through a PHR’ is added. Are there any use cases in scope that do not make use of a PHR? If not, the quoted text (or at least ‘typically’) should be removed. If use cases are considered in which no PHR is used, elaborate on those. **DONE**
- In 2.4 add a link to the ‘MedMij FHIR IG by Nictiz’, similar as what is done in other technical designs. **DONE**
- Section 2.5 is quite bloated: **DONE**
    - 2.5.2 is already explained in 2.6 through 2.8, so is redundant.
    - 2.5.3 belongs in the functional design, so should be removed.
- I don’t understand the structure of sections 2.5 through 2.8. Are 2.6 through 2.8 viewed as separate use cases within Provider Tasks, or is there just a single use case? In the latter case, please have a look at the [technical design of Image Availability](https://simplifier.net/guide/medmij-r4-image-availability-ig/Home/Technical-design?version=1.0.0-rc.2) for a better structure. **DONE**
- The first paragraph in 2.6 doesn’t make sense: it is stated that task data is requested using individual search interactions. However, in practice only the Tasks are retrieved by a search interaction. The ActivityDefinition and ServiceRequest are retrieved afterwards via individual read operations. It seems like this paragraph has been partly copied from an old version of the Dental Care IG (there this statement made sense, since there were several different CIMs/resources that were retrieved individually). I’d suggest to remove this paragraph altogether. Instead, add the following to 2.6.1: ‘The PHR executes an HTTP search conform the [FHIR specification](https://hl7.org/fhir/R4/search.html) against the Task endpoint of the XIS using the following URL:’ **DONE**
- The ‘Goal’ stated in 2.6.1 should be moved as introduction of this use case, i.e. to 2.6. **DONE**
- In 2.6.1 it is stated that the Tasks are retrieved by filtering on .owner. However, this seems to me as an unfeasible implementation: **DONE**
    - Firstly, according to the profile it is allowed to refer to other resource types on .owner in the context of Provider Tasks. But then this search request ensures that Tasks that are assigned to e.g. a caregiver or health professional, are not retrievable in the PHR. Is this taken into account?
    - Secondly, a categorisation of Tasks that are relevant for Provider Tasks is missing in this approach. Suppose another data service using the Task resource is introduced later on, then those Tasks could be mixed together with the Tasks relevant for Provider Tasks. Hence, a better approach would be to use .code or .meta.tag to indicate the fact a certain Task is used in the context of Provider Tasks. Since already existing search parameters exist for both of these elements, it is quite easy to update the search request accordingly. Personally, I think the .meta.tag is the best approach, but I would advise to check this on Zulip. Also see my comment on the Task profile.
- In 2.6.1.1 it is stated that ‘both the client and the server SHALL support the FHIR read interaction’. It should be a bit more specific which read interactions need to be supported, all of them or only reads on ActivityDefinition and ServiceRequest? Moreover, in other data services the principle is used that a XIS does not need to support the read interaction, provided that all references are always included in the response Bundle. Is there a reason Provider Tasks deviates from this approach? **DONE**
- In 2.6.2 it is stated that the response message also include the ServiceRequest and ActivityDefinition resources that are referenced from the Task resources. Why then, is it necessary for a XIS to support the read interaction (according to 2.6.1.1). This is also contradictory to the first bullet for the PHR in 2.2.3.1. Moreover, why aren’t these inclusions made explicit in the search request by adding _includes? For Task.basedOn and Task.focus this is easily done, since there exist core search parameters for these elements. For the instantiates extension it would be necessary to introduce a custom search parameter. **DONE**
- The enumeration in 2.6.2 seems a bit redundant, this information is already mentioned in other places within the technical design. **DONE**
- It is recommended to add an overview of all search parameters that need to be supported, especially if it is decided to add _includes to the search request. **DONE**
- Change the last sentence of 2.6.3 to ‘Moreover, the PHR MAY provide an upper bound to restrict the period:’. **DONE**
- In 2.7, start with the goal of the use case, and move the PATCH statement to 2.7.1. **DONE**
- In 2.7.1 it is mentioned that the PUT SHALL be supported by the source system. However, this is not further explained anywhere else in the technical design.
- In 2.7.1 it is stated that the source system SHALL support the PATCH (and PUT) interaction, but this also holds true for the module system, hence it’s better to make that explicit (as is done for instance in 2.6.1.1: 'both the client and the server SHALL support the FHIR read interaction'). **OPEN NEW TICKET**
- In 2.7.1.1 and 2.7.1.2, add hyperlinks to the respective specifications (i.e. [Fhirpatch - FHIR v4.0.1](http://hl7.org/fhir/R4/fhirpatch.html) and [RFC 6902: JavaScript Object Notation (JSON) Patch](https://datatracker.ietf.org/doc/html/rfc6902) , respectively). **DONE**
- Is it possible to give a more specific link to the Solution Design in 2.8? **DONE**
- The header of section 2.9 doesn’t make sense: this section doesn’t contain example queries, but provides an overview of the relevant requests that are in scope. And why is only the source system mentioned in the header, even though for instance the PATCH is done by the module system? **DONE**
- In section 2.9 the sentence ‘These queries and expected responses are based on the profiles listed in the [functional design](https://simplifier.net/guide/medmij-r4-provider-tasks-ig/Home/Functional-Design/Functional-design?version=1.0.0-alpha.1).’ seems incorrect. Profiles shouldn’t be listed in the functional design. Are the Logical Models meant, instead? If so, it is better to directly link to the Logical Models [page.](http://page.in/) **DONE**
- The translations in columns ‘CIM NL’ and ‘HCIM EN’ are not entirely correct. Please align these, also taking into account my other comments on the naming of Logical Models. **DONE**
- Nice to have: change the font of the Search URL column in the section 2.9 table so that only actual FHIR elements and requests are in ‘code’ font (for instance: ‘See Task (resolved via Task.basedOn)’). **DONE**
- Small textual changes: **DONE**
    - FHIR IG → Technical design (in the title)
    - Technical Design (TD) → technical design
    - TD version → technical design
    - Technical Design → technical design (2x)
    - Clinical Order Workflows → COW (only the second occurrence); alternatively, don’t introduce the abbreviation
    - fulfilment → fulfillment (since we use American English)
    - Both tables are missing a label.
    - Do not use the term ‘PGO’ in the technical design. Use (only) ‘PHR’ instead.
    - In the table in section 2.3, change the Role in exchange of the Healthcare provider to ‘Creates/maintains tasks and clinical orders’.
    - In 2.5.2: Module system → module system
    - Source System → source system (twice)
    - _lastUpdated *→* _lastUpdated
    - In 2.6.3, I’d remove ‘(based on meta.lastUpdated)’, and instead add a link to [Search - FHIR v4.0.1](https://hl7.org/fhir/R4/search.html) .
    - endpoint.address → Endpoint.address
    - In the ProviderTasks → In Provider Tasks,

## General findings

- In the package.json, a dependency on ‘koppeltaalv2.00’ is added. However, [the package released by Koppeltaal](https://simplifier.net/packages/Koppeltaalv2.00/0.15.0/~history) is called ‘Koppeltaalv2.00’ (with capital K). This needs to be updated, and probably explains why the ‘koppeltaalv2.00’ dependency within the Dependencies tab in Simplifier seems to be missing. **DONE**
- About 2 months before the 1.0.0-alpha.1 release of Provider Tasks version 0.16.2 of Koppeltaalv2.00 has been released. However, the Provider Tasks package has a dependency on version 0.15.0 of Koppeltaalv2.00. Is this intended? In general, it’s good practice to depend on the most recent versions of other packages, unless some backwards incompatible changes have been introduced (which shouldn’t be the case here, as the versions of Koppeltaalv2.00 differ only w.r.t. their minor). **DONE**
- There is a dependency on MedMij Core (because a Logical Model present therein is used within Provider Tasks), but the ‘why’ of this dependency is not explained anywhere in the IG. It makes sense to add this explanation at least in the functional design and/or on the Logical Models page (since the reason is currently completely functional of nature). Moreover the MedMij Core dependency needs to be made explicit on the Dependencies page.
- Consider to add the solution design to the IG (similar to Image Availability). Or at least add the solution design on the Dependencies page. **DONE**
- Both the functional and technical design seem to be partly generated by AI (indicated by for instance bold ‘keywords’, the infamous em dash and a lot of redundancy/repetitions). This needs to be finetuned, to make it more readable and align with other IGs. **DONE**

## Functional design

- The section on FHIR profiles in section 1.1.1 belongs in the technical design. Moreover, it is debatable whether the profiles of Provider Tasks and Koppeltaal have been harmonised as much as possible (and whether that’s even possible). For instance, the Task profiles in these projects are incompatible in a lot of ways (open versus closed world modelling), hence the notion of harmonisation might be too rosy. The same holds true for the first bullet in section 1.1.1.2. **DONE**
- At the end of section 1.1.1 a link to the IG of Koppeltaal is added. However, this link goes to the general page of IGs, and it is better to link to a specific version of the IG, namely that version that corresponds with the dependency on Koppeltaal within Provider Tasks. Unfortunately, the IGs published by Koppeltaal have not been scoped to a specific package, hence this needs to be discussed with them. **OPEN NEW TICKET**
- In 1.1.1, add the sentence ‘Merk op dat naast dit ontwerp ook de (functionele) eisen en richtlijnen beschreven in het door Nictiz gepubliceerde [Functioneel ontwerp](https://informatiestandaarden.nictiz.nl/wiki/MedMij:FO:V1/FunctioneelOntwerp) van toepassing zijn.’, or even add the more elaborate ‘Merk op dat naast dit ontwerp ook de (functionele) eisen en richtlijnen beschreven in de [MedMij R4 Core IG](https://simplifier.net/guide/medmij-r4-core-ig?version=1.0.1) en het door Nictiz gepubliceerde [Functioneel ontwerp](https://informatiestandaarden.nictiz.nl/wiki/MedMij:FO:V1/FunctioneelOntwerp) van toepassing zijn.’ if that makes sense. **DONE**
- In section 1.1.1.4 several FHIR resources are referred to between parentheses, but this is not relevant for the functional design. **DONE**
- I don’t fully understand what is meant by ‘de zorgopdracht in de rol van digitaal groepsplan, de zorgopdracht in de rol van uitvoeringsopdracht’. **DONE**
- In section 1.1.1.4 and 1.1.2.2.2 it is mentioned that the feedback of results (such as from answering a questionnaire) is out of scope for this version. Will this be added in a later version of this data service, or will it be part of another data service? If it’s already clear when this will be put in scope, it might be better to indicate that in the design (since this seems rather important to me). **DONE**
- The section hierarchy is incorrect: 1.1.2.3 is part of the use case ‘Aanbiedertaken’, hence should be a subsection of 1.1.2.2. Moreover, it can be renamed to simply ‘Procesbeschrijving’. Similarly, section 1.1.2.2.2 can be renamed to simply ‘Patiëntreis’. **DONE**
- In section 1.1.2.6 FHIR resources are mentioned, but this is out of scope for the functional design. Remove additional references to FHIR resources (those between parentheses), and change explicit mentions of FHIR resources to their functional counterpart (e.g. Task → taak, ActivityDefinition → digitale activiteit). **DONE**
- In section 1.1.2.7 consider to change the first sentence and the enumeration to simply ‘De dataset is uitgewerkt aan de hand van [Logical Models](https://simplifier.net/guide/medmij-r4-provider-tasks-ig/Home/Artifact-Index/Logical-Models?version=1.0.0-alpha.1).’. This ensures that this section cannot get outdated whenever new Logical Models are added or existing ones are removed. **DONE**
- Why is there no explicit Logical Model for ‘de zorgopdracht in de rol van digitaal groepsplan’? It’s better to be explicit than keep it implicit. Moreover ‘wordt gemodelleerd op basis van dezelfde resource (ServiceRequest)’ is not something that should be in the functional design, as this is a technical statement. **DONE**
- In section 1.1.2.8 the CIMs are mentioned; this term, however, is not used anywhere else in the functional design. **DONE**
- Based on section 1.1.2.5 and Table 3, the Patient performs a transaction within the module system (namely updating the status of the task), however in Table 1 it seems like the Patient is only a user of the PGO. Hence, it might be a good addition to indicate in Table 1 that the Patient also makes use of the module system. **DONE**
- The fourth transaction in Table 3 seems a bit weird to me, as the Patient does not explicitly update the status of the task (this is done implicitly by the module system itself whenever a patient starts or completes an activity). Consider to add a third role for the module system itself. **DONE**
- There is quite some redundancy in the functional design, for instance w.r.t. the statement that there is no task hierarchy (which is mentioned five times). Moreover, there is redundancy between the design principles and the process description. **DONE**
- Nice to have: add a diagram to show how the different functional building blocks are related to each other. **OPEN NEW TICKET**
- Small textual changes:
    - The functional design uses the English term ‘ProviderTasks’ three times; these should be removed (once) and changed to ‘Aanbiedertaken’ (twice). **DONE**
    - workflow-uitwisseling → workflowuitwisseling (it is actually unclear what is meant by ‘workflow-uitwisseling’; shouldn’t this sentence be changed to ‘Koppeltaal richt zich op gegevensuitwisseling en workflows tussen zorginformatiesystemen onderling’, as the workflow itself is not exchanged, but partly defines the process between the information systems, instead?) **DONE**
    - MedMij-afsprakenstelsel → MedMij Afsprakenstelsel **DONE**
    - patiënt-specifieke → patiëntspecifieke (10 times) **DONE**
    - In section 1.1.1.6 change the sentence to ‘… van de functionele ontwerpen binnen MedMij’, in line with section 1.1.1.3 and 1.1.1.5. **DONE**
    - Het doel is dat de patiënt in de PGO inzicht heeft in → Voor de patiënt is het doel om in de PGO inzicht te hebben in: **DONE**
    - patient journey → patiëntreis (in line with other functional designs) **DONE**
    - In section 1.1.2.2.2 remove the redundant subheaders (such as ‘Ontvangst’, ‘Takenlijst raadplegen’, …, ‘Terugkoppeling’) and format it as a single enumeration. **DONE**
    - In section 1.1.2.3.2 remove the redundant numbered headers (such as ‘1. Selectie digitale activiteit (module)’, …, ‘Uitvoering’, ‘Statusupdates’) and format it as a single enumeration. **DONE**
    - de taakomschrijving, status en het tijdschema → de taakomschrijving, de status en het tijdschema **DONE**
    - een hoofd-/subtaak hiërarchie → geen hiërarchische onderverdeling in hoofd- en subtaken (5x) **DONE**
    - uitgevoerd en/of afgerond → gestart en/of afgerond (since ‘uitgevoerd’ = ‘afgerond’ in this case, right?) **DONE**
    - de Persoon en de (Zorg)Aanbieder zoals te zien in onderstaande tabel → de *Patiënt* en de *Zorgaanbieder*, zoals te zien in onderstaande tabel **DONE**
    - Gebruiker van het bronsysteem → Gebruiker van het XIS **DONE**
    - Zowel de persoon als de (zorg)aanbieder → Zowel de patiënt als de zorgaanbieder **DONE**
    - (persoon) → (patiënt) (2x) **DONE**
    - Bronsysteem ((zorg)aanbieder) → XIS (zorgaanbieder) **DONE**
    - bronsysteem → XIS (multiple occurrences) **DONE**
    - TaakGegevensRaadplegend → TaakgegevensRaadplegend **DONE**
    - TaakGegevensBeschikbaarstellend → TaakgegevensBeschikbaarstellend **DONE**
    - Functioneel ontwerpprincipes → De volgende functionele ontwerpprincipes zijn gehanteerd binnen Aanbiedertaken: **DONE**
    - horen verwijzen → horen, verwijzen **DONE**
    - In section 1.1.2.6, put the explanation of each principle on a new line (e.g. by adding two spaces behind the principle header, or adding a break) **DONE**
    - duplicatie of inconsistentie tussen resources → duplicatie of inconsistentie
    - Tabel 3: Transactiegroep → Tabel 3: Transactiegroepen **DONE**

## Logical Models

- The first bullet is incorrectly copied from Pathology. Change ‘For each concept, an id is assigned by MedMij based on the corresponding element in the Mercurius dataset defined by Palga.’ to ‘For each concept, an id is assigned by MedMij.’ **DONE**
- The last bullet is incorrectly copied from Pathology. Remove the sentence between parentheses, as there is no Patient Logical Model within Provider Tasks. **DONE**
- Nice to have: add a Mappings tab to each Logical Model. **DONE**
- No OIDs have been added to the Logical Models. These need to be added to the [MedMij OID register](https://medmij.sharepoint.com/:x:/r/sites/StichtingMedMij/_layouts/15/Doc.aspx?sourcedoc=%7B1EB95810-549A-4D40-AC8F-3FF59371ED98%7D&file=Stichting%20MedMij%20OID-register.xlsx&action=default&mobileredirect=true) by mailing Bianca, and then to the Logical Models themselves (as an .identifier). **OPEN NEW TICKET**
- The .name of each Logical Model is not in line with our profiling guidelines. These should be PtLmTask instead of LmTask, and so on. **DONE**
- Since this is an alpha release, the .status of all Logical Models should be *draft*, not *active*. Only in the first release candidate release, the .status is set to *active*. **DONE**
- Change the .purpose of the Logical Models to the form ‘This LogicalModel represents the Task building block for patient use cases in the context of the information standard Provider Tasks (Aanbiedertaken).’ If the current .purpose contains information that is not yet present in .description, combine these two. **DONE**
- The .abstract should be set to *false*, in line with what is mentioned in the corresponding guidance. **DONE**
- The .short and .definition of each concept is currently the same, which is redundant (and moreover, the current values of .short are not that short. Change the .short of each element to a human-readable version of the concept name (i.e. with spaces and only a single capital letter), for instance ‘Execution period’ or ‘Based on’. **DONE**
- Nice to have: sort the Logical Models alphabetically. **DONE**
- Small textual changes:
    - datatype → data type (2x) **DONE**
    - datatypes → data types **DONE**
    - the functional model is represented by → the functional dataset and the underlying use cases are represented by **DONE**
- Specific changes for the Task Logical Model:
    - In the .description and root .definition, change ‘Task’ to ‘task’. Likewise for the .definition of the Requester concept. **DONE**
    - The name of the ActivityDefinition concept is not in line with its .alias (DigitaleActiviteit) and the Logical Model that is referenced (Activity). Make all of these consistent, by using either Activity/Activiteit or DigitalActivity/DigitaleActiviteit in all places. Moreover, based on the functional design, the cardinality should be changed to 1..1. **DONE**
    - Functionally, it is currently impossible to indicate which Tasks belong to the same digital group plan. This should be modelled explicitly by adding a new concept GroupPlan/DigitalGroupPlan with cardinality 1..1 that references a to be introduced Logical Model that corresponds to the digital group plan. **DONE**
    - BasedOn is the broad term present in the FHIR Task resource. Here, I recommend to make it more specific by naming it ExecutionOrder. The .alias should be changed accordingly. **DONE**
    - Shouldn’t Status be 1..1? Moreover remove the further explanation between parentheses, and add a proper ValueSet instead. **DONE**
    - Remove the further explanation between parentheses on Priority, and add a proper ValueSet instead. **DONE**
    - The second sentence of the .definition of Description seems to be more fitting for e.g. a display guideline, not for a functional model. **DONE**
    - I would remove ‘or role’ from the .definition of Requester, and change ‘person’ to ‘healthcare professional’. **DONE**
    - Is it necessary to add the Requester concept here, or is this functionally always the same healthcare professional as the one that is referenced from Requester in the ServiceRequest Logical Model? **DONE**
- Specific changes for the Activity Logical Model:
    - The name of the Logical Model, and the .short and .alias do not align with each other. Change all these to either Activity/Activiteit or DigitalActivity/DigitaleActiviteit (also see the second bullet for the Task Logical Model). **DONE**
    - Remove the further explanation between parentheses on Status, and add a proper ValueSet instead. **DONE**
    - No .alias has been added to Publisher. **DONE**
    - In the .definition of Timing, change ‘clinical order (e.g., ServiceRequest)’ to ‘execution order’. **DONE**
    - Does it make sense that no concepts are mandatory (i.e. 1..1)? **OPEN DISCUSS WITH JELMER. Changed title to 1..1**
- Specific changes for the ServiceRequest Logical Model:
    - Rename this Logical Model to ExecutionOrder, as it is more specific than ServiceRequest. Make changes on the root accordingly. **DONE**
    - In the .definition of PatientInstruction, change ‘Task(s)’ to ‘task(s)’. **DONE**
    - The functional design states ‘patiënt-specifieke uitvoeringsinstructies en/of het tijdschema’, however, in this Logical Model the PatientInstruction concept has been made mandatory. This is inconsistent. **DONE**
    - Consider to rename the Occurrence concept to Schedule (also see the fifth bullet for the Activity Logical Model). **DONE**

## Test material

- Extend the sentence ‘FHIR test material corresponding to the functional test material can be found on [GitHub](https://github.com/Stichting-MedMij/MedMij-R4-ProviderTasks/tree/main/examples).’ to ‘FHIR test material corresponding to the functional test material has been added in the Simplifier project, but can also be found on [GitHub](http://github.com/Stichting-MedMij/MedMij-R4-ProviderTasks/tree/main/examples).’ **DONE**
- The sentence ‘For mapping between metadata, functional dataset and FHIR, please refer to the [technical design](https://simplifier.net/guide/medmij-r4-provider-tasks-ig/Home/Technical-design?version=1.0.0-alpha.1).’ does not make much sense, as the section ‘Relating FHIR (profiles) to its functional counterpart’ is not present in the technical design (but it is in technical designs of other data services). Add this section in the technical design, and update the link accordingly by using an anchor. **DONE**
- Change the second bullet in 5.1.1 to ‘The Simplifier project and the examples folder on GitHub both contain the FHIR test resources.’. **DONE**
- The functional test material should be completely based on the underlying functional models, but that is not the case:
    - It is unclear which functional model for Patient has been used, as e.g. Deceased and Nationality are not present in the zib Patient, and there has not been introduced a Patient Logical Model specific for Provider Tasks. **OPEN NEW TICKET**
    - Technical elements, such as Identifier, Intent and AuthoredOn, have been added to the functional test material. If these are important on a functional level, the corresponding concepts should be added to the Logical Models as well. **OPEN NEW TICKET**
    - To what functional model does the Endpoint data relate? **DONE**
    - Additions like ‘qualifier ‘BR’’ and ‘(home)’ are actually technical values, and should not be part of the functional test material. **DONE**
- Why is not all Task-related test data formatted in the same way? For instance, compare 5.2.8.3 with 5.2.8.1 and 5.2.8.2. **OPEN NEW TICKET**
- Values of elements/concepts should not be formatted as a code, as this notation is reserved for technical elements, such as FHIR elements. For instance completed should be *completed* or ‘completed’. In the tables within the functional test material we do not use an italic font or quotation marks, and instead write just completed. **DONE**
- In 5.3.3 the formatting of the table seems incorrect; why is the last column completely empty? **DONE**
- For each BSN, a value of ‘masked (in identifier system '[Canonical - SIMPLIFIER.NET](http://fhir.nl/fhir/NamingSystem/bsn) )’ is specified. However, this is incorrect, as the value *masked* is not present in that identifier system. Instead, the actual BSN should be specified in the functional test material (since there actually is a certain value in practice), and then be conveyed via the data-absent-reason *masked* in the Patient resource. **OPEN NEW TiCKET**
