---

## topic: Weergaverichtlijn

# Weergaverichtlijn

## Inleiding

Dit is de weergaverichtlijn voor de gegevensdienst Aanbiedertaken (ProviderTasks).

De richtlijn bevat mock-ups die bedoeld zijn ter inspiratie. Persoonlijke gezondheidsomgevingen (PGO's) kunnen deze voorbeelden naar eigen inzicht visueel vormgeven, zolang de gebruiksvriendelijkheid behouden blijft.

## Doel

Deze richtlijn heeft als doel om duidelijke handvatten te bieden voor een patiëntvriendelijke en begrijpelijke weergave van aanbiedertaken in de PGO. De richtlijn ondersteunt ontwikkelaars en zorgverleners bij het:

- gebruiken van begrijpelijke en patiëntvriendelijke termen en toelichtingen;
- structureren en presenteren van een overzicht van gegevens op een manier die aansluit bij de informatiebehoefte van PGO-gebruikers.

De richtlijn geeft géén handvatten voor de vormgeving (kleur, vorm, lettertype, etc.) van gegevens.

## Scope

De scope van deze richtlijn bestaat uit de aanbiedertaak-gegevens die worden weergegeven in de PGO. Gegevens die via andere MedMij-gegevensdiensten verzameld worden in de PGO zijn hierin niet meegenomen.

## Inhoud richtlijn

Het inloggen en authenticeren bij de zorgaanbieder is niet opgenomen in deze richtlijn.
De gebruiker gaat in de PGO naar het overzicht Aanbiedertaken en/of overzicht Zorgaanbieder ‑ Aanbiedertaken waar de aanbiedertaken getoond worden.

### Overzichtsscherm aanbiedertaken

Er zijn twee weergaven gedefinieerd voor het overzicht van de aanbiedertaken:

- Scenario 1: Overzicht Aanbiedertaken (met alle aanbiedertaken van alle zorgaanbieders in één overzicht)
- Scenario 2: Overzicht Zorgaanbieder ‑ Aanbiedertaken (met alle aanbiedertaken van één zorgaanbieder in één overzicht). Dit scenario is optioneel, omdat het uitgangspunt is dat de taken van alle zorgaanbieders worden getoond.

Het scenario, hieronder uitgewerkt, geeft weer hoe een UX-design getoond kan worden. Een PGO is vrij om scenario 2 te ondersteunen. De richtlijn gaat ervan uit dat de PGO een responsief ontwerp ondersteunt.

In deze richtlijn zijn mock-ups opgenomen ter inspiratie. Daaronder is het Logical Model (LM) apart opgenomen, niet in een mock-up, maar in tabelvorm.

### Mock-ups overzichtsscherm aanbiedertaken

++Overzicht Aanbiedertaken++

In het Overzicht Aanbiedertaken heeft het overzichtsscherm één pagina waar de datavelden getoond worden, voor alle zorgaanbieders.

Het overzichtsscherm bestaat uit twee secties (deze mogen ook tabs zijn): een statussectie en een sectie met de afzonderlijke digitale activiteiten. De afzonderlijke digitale activiteiten worden gegroepeerd in drie groepen:

1. Te doen (`ready`, `requested`, `received`, `in-progress`)
2. Gereed (`completed`)
3. Gestopt (`failed`, `cancelled`)

Welke velden in het overzichtsscherm gebruikt worden, blijkt uit de onderstaande opsomming van de FHIR-elementen per resource:

- `Task.status`
- `Task.requester.practitionerRole.organization.name`
- `Task.groupIdentifier` (functioneel: een groepsnaam, bijvoorbeeld de naam van de digitale zorgmodule)
- `Task.description`
- `Task.executionPeriod.start`
- `Task.executionPeriod.end`
- `ActivityDefinition.title`

**Figuur 1: Voorbeeld Overzicht Aanbiedertaken (mock-up volgt)**

Het is aan de PGO om een melding in het takenscherm te tonen wanneer er voor een zorgaanbieder langer dan een door de PGO bepaalde periode geen taakgegevens zijn opgehaald.

Nb 1. In het overzichtsscherm worden alleen hoofdtaken of enkelvoudige taken getoond. Dat zijn taken waarbij `Task.partOf` geen waarde heeft. In het geval van een hoofdtaak worden vervolgens in het detailscherm de relevante subtaken getoond.

Nb 2. Indien er meerdere zorgaanbieders zijn waarbij in het verleden gegevens verzameld zijn en die zorgaanbieder staat op de ZAL met de gegevensdienst Aanbiedertaken, dan zal er voor die zorgaanbieders een ophaalactie moeten worden gedaan.

De acceptatiecriteria voor het overzichtsscherm zijn als volgt.


| Nr  | Acceptatiecriteria                                                                                                                                                                                                                               |
| --- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| 1   | Standaard worden alle gegevens van de geraadpleegde zorgaanbieder(s) overzichtelijk weergegeven, gesorteerd op datum. Het overzichtsscherm opent met het filter "te doen".                                                                       |
| 2   | Je kunt zoeken op (delen van) de gegevens of op informatie uit de andere datavelden in het overzichtsscherm. De gebruiker moet minimaal 3 karakters invoeren. Dit is met name relevant voor het tabblad met afgehandelde taken (historie).       |
| 3   | Voor de datavelden in het overzichtsscherm (met uitzondering van `Task.description`) is het mogelijk om te filteren op één of meerdere waarden.                                                                                                  |
| 4   | Voor het datumveld in het overzichtsscherm kun je een specifieke periode selecteren.                                                                                                                                                             |
| 5   | Alle datavelden in het overzichtsscherm (met uitzondering van `Task.description`) zijn sorteerbaar.                                                                                                                                              |
| 6   | De datavelden in het overzichtsscherm zijn begrijpelijk en gebruiksvriendelijk geformuleerd. Zie de {{pagelink: Weergaverichtlijn, text: Tabel met specificaties, anchor: TabelSpecificaties}} voor de aanbevolen termen per opgehaald dataveld. |
| 7   | De standaard sortering van de open taken is: eerst uit te voeren taak bovenaan. De standaard sortering van de afgeronde en gestopte taken is: meest recent uitgevoerde taak bovenaan.                                                            |


### Detailscherm aanbiedertaken

Dit detailscherm krijgt een PGO-gebruiker te zien na het selecteren van een specifieke regel in het overzichtsscherm. De in de mock-up weergegeven gegevens dienen uitsluitend ter demonstratie.

### Mock-up detailscherm aanbiedertaken

In het detailscherm zijn de volgende velden zichtbaar:

- `Task.status`
- `Task.requester.practitionerRole.organization.name`
- `Task.requester.practitionerRole.practitioner.name`
- `Task.executionPeriod.start`
- `Task.executionPeriod.end`
- `ActivityDefinition.title`
- `ServiceRequest.patientInstruction` (alleen indien er een patiëntspecifieke instructie bestaat)

**Figuur 2: Voorbeeld Detailscherm Aanbiedertaken (mock-up volgt)**

Nb 1. De actieknop heeft een betekenis afhankelijk van de status. **Start** voor nog uit te voeren taken en **Bekijken** voor klaar/gestopte taken.

Nb 2. Indien er sprake is van een repeterende taak, worden in het detailscherm alle beschikbare exemplaren getoond die voldoen aan het filtercriterium. Er is dan sprake van hoofd- en subtaken die middels `Task.partOf` aan elkaar gekoppeld zijn.

Nb 3. De patiëntinstructie is een specifieke instructie voor de patiënt. Deze instructie kan door de zorgverlener worden ingevoerd bij het klaarzetten van de digitale activiteit voor de patiënt. Algemene instructies horen in de module zichtbaar te zijn en zijn daarom geen onderdeel van deze weergaverichtlijn. De patiëntinstructie is niet altijd aanwezig.

### Starten/Launchen van een aanbiedertaak

Bij het starten van een taak moet de patiënt geïnformeerd worden dat het vervolg van de taak in de omgeving van de zorgaanbieder draait.

### Aanbiedertaakgegevens

Hieronder wordt een voorbeeld in tabelvorm gegeven van het overzichts- en detailscherm voor een hoofdtaak met onderliggende digitale activiteiten.

++Overzichtsscherm++


| Titel                  | Status        | Periode                   | Zorgorganisatie             |
| ---------------------- | ------------- | ------------------------- | --------------------------- |
| Gezonder gaan leven    | Aangevraagd   | 22-12-2025 t/m 28-12-2025 | Huisartsenpraktijk de Haard |
| Bloedglucose monitoren | In uitvoering | 15-12-2025 t/m 22-12-2025 | Huisartsenpraktijk de Haard |


++Detailscherm++


| Geselecteerde regel: Gezonder gaan leven |                                                       |
| ---------------------------------------- | ----------------------------------------------------- |
| Titel                                    | Gezonder gaan leven                                   |
| Status                                   | Aangevraagd                                           |
| Periode                                  | 22-12-2025 t/m 28-12-2025                             |
| Zorgverlener                             | A. de Haard                                           |
| Zorgorganisatie                          | Huisartsenpraktijk de Haard                           |
| Patiëntinstructie                        | (optionele specifieke instructie van de zorgverlener) |
| Actieknop                                | Start                                                 |


++Onderliggende digitale activiteiten (subtaken)++


| Titel digitale activiteit             | Beschrijving                          | Periode van uitvoer       | Behandelcontext | Zorgorganisatie             |
| ------------------------------------- | ------------------------------------- | ------------------------- | --------------- | --------------------------- |
| Bloedglucosemeting                    | 1 week 2x per dag bloedglucosemeting  | 22-12-2025 t/m 28-12-2025 | Diabetes        | Huisartsenpraktijk de Haard |
| Gezonder gaan leven                   | Leestips voor een gezondere leefstijl | 22-12-2025 t/m 28-12-2025 | Diabetes        | Huisartsenpraktijk de Haard |
| Vragenlijst over de woon-leefsituatie | Vul de vragenlijst in                 | 22-12-2025 t/m 28-12-2025 | Diabetes        | Huisartsenpraktijk de Haard |


  


##  Tabel met specificaties

In de tabellen met specificaties staan de gegevens uit de gegevensdienst Verzamelen Aanbiedertaken (ProviderTasks), die relevant zijn voor deze weergaverichtlijn, weergegeven.
De prioriteit van de te tonen datavelden wordt vastgesteld volgens de MoSCoW-methodiek. Datavelden die niet in de specificatietabel voorkomen, moeten worden beschouwd als datavelden met de letter W.

  



| Prioriteit    | Omschrijving                                                                                                                   |
| ------------- | ------------------------------------------------------------------------------------------------------------------------------ |
| M(ust have)   | Nodig voor de basisfunctionaliteit van de toepassing en moet worden geïmplementeerd om het proces succesvol te laten verlopen. |
| S(hould have) | Belangrijke functionaliteit die niet vereist is, maar die voordelen biedt voor gebruikers en de algehele gebruikservaring.     |
| C(ould have)  | Gewenste functionaliteit die waarde toevoegt, maar minder kritisch is en indien nodig kan worden uitgesteld.                   |
| W(on't have)  | Functionaliteiten die nu buiten scope zijn maar mogelijk in de toekomst worden overwogen.                                      |


  


Toelichting op de kolom "Waar tonen in PGO":


| Code | Betekenis                                                                     |
| ---- | ----------------------------------------------------------------------------- |
| a    | In overzicht én als detailgegeven                                             |
| b    | Alleen als detailgegeven                                                      |
| c    | Niet tonen                                                                    |
| d    | Niet tonen, wel noodzakelijk voor de launch (verwijzing naar solution design) |


  








### Taak (Task)

Verwijzing: [LogicalModel Task](https://simplifier.net/medmij-r4-provider-module/lmtask)


| Naam data-item                           | Type data-item  | Id                                         | Voorbeeld                                                                                                                          | Waar tonen in PGO (a/b/c/d) | Opmerkingen                                                                                                                                                                                                   | Weergavetekst in de PGO  | Gebruikersvriendelijke toelichting                                                                                 | Prioriteit (MoSCoW) |
| ---------------------------------------- | --------------- | ------------------------------------------ | ---------------------------------------------------------------------------------------------------------------------------------- | --------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------ | ------------------------------------------------------------------------------------------------------------------ | ------------------- |
| **Taak**                                 | **Rootconcept** | pt-lm-Task                                 |                                                                                                                                    |                             |                                                                                                                                                                                                               | Taak                     |                                                                                                                    |                     |
| Instantiates::ActivityDefinition         | Reference       | pt-lm-Task.Instantiates.ActivityDefinition | ProviderModule-ActivityDefinition-Vragenlijst-WoonLeefsituatie                                                                     | c                           | Verwijzing naar de digitale activiteit (LM ActivityDefinition).                                                                                                                                               |                          |                                                                                                                    | M                   |
| Identifier                               | Item            | pt-lm-Task.Identifier                      | system: "http://medrie.nl/taskIdentifier" value: "TASK-Vragenlijst-Woonsituatie-9642"                                              | b / c                       | Business identifier is verplicht (uniek binnen of over systemen heen).                                                                                                                                        |                          |                                                                                                                    | M                   |
| GroupIdentifier                          | Item            | pt-lm-Task.GroupIdentifier                 | system: "https://medrie.nl/fhir/identifiers/task-group" value: "module-diabetes-2025" display/text: "Digitale zorgmodule Diabetes" | a                           | Wordt gebruikt om gerelateerde taken (bijv. taken binnen één digitale zorgmodule) te groeperen en te filteren in het overzicht.                                                                               | Zorgmodule of Groep      | De zorgmodule of het programma waar deze taak toe behoort.                                                         | M                   |
| BasedOn::ServiceRequest                  | Reference       | pt-lm-Task.BasedOn                         | ServiceRequest/ProviderModule-ServiceRequest-Glucosemeting                                                                         | c                           | De zorgopdracht waar de taak op gebaseerd is. Discussiepunt MedMij.                                                                                                                                           |                          |                                                                                                                    | C                   |
| PartOf::Task                             | Reference       | pt-lm-Task.PartOf                          | Task/ProviderModule-MainTask-Meetopdracht-Glucosemeting                                                                            | c                           | Verwijzing naar een hoofdtaak. Gebruikt om subtaken (bijv. losse meetmomenten) te koppelen aan een hoofdtaak. In het overzichtsscherm worden alleen hoofdtaken of enkelvoudige taken (zonder partOf) getoond. |                          |                                                                                                                    | M                   |
| Status                                   | Item            | pt-lm-Task.Status                          | requested                                                                                                                          | a                           | Bepaalt in welke groep de taak in het overzichtsscherm valt: Te doen (ready, requested, received, in-progress), Gereed (completed) of Gestopt (failed, cancelled).                                            | Status                   | Patiëntvriendelijke vertaling van de statuscode (bijv. "Aangevraagd", "In uitvoering", "Afgerond", "Geannuleerd"). | M                   |
| Intent                                   | Item            | pt-lm-Task.Intent                          | order                                                                                                                              | c                           | Voor patiëntgerichte activiteiten doorgaans 'order'.                                                                                                                                                          |                          |                                                                                                                    | C                   |
| Priority                                 | Item            | pt-lm-Task.Priority                        | routine                                                                                                                            | c                           |                                                                                                                                                                                                               |                          |                                                                                                                    | C                   |
| Description                              | Item            | pt-lm-Task.Description                     | Vul de vragenlijst in over je woon-/leefsituatie                                                                                   | a                           | Korte, voor de patiënt leesbare omschrijving van de taak. Niet sorteerbaar of filterbaar.                                                                                                                     | Omschrijving             |                                                                                                                    | M                   |
| For::Patient                             | Reference       | pt-lm-Task.For                             | Tom van Duinen                                                                                                                     | c                           | De patiënt voor wie de taak bedoeld is. Wordt normaal gesproken niet getoond in de PGO (eigen account).                                                                                                       |                          |                                                                                                                    | W                   |
| ExecutionPeriod                          | Item            | pt-lm-Task.ExecutionPeriod                 | 2025-12-22 tot en met 2025-12-28                                                                                                   | a                           | Tijdvenster waarin de taak uitgevoerd moet/mag worden (start en eind).                                                                                                                                        | Periode van uitvoer      |                                                                                                                    | M                   |
| AuthoredOn                               | Item            | pt-lm-Task.AuthoredOn                      | 2025-12-23T18:00:00+01:00                                                                                                          | c                           | Datum/tijd waarop de taak is aangemaakt.                                                                                                                                                                      |                          |                                                                                                                    | C                   |
| LastModified                             | Item            | pt-lm-Task.LastModified                    | 2025-12-23T18:00:00+01:00                                                                                                          | c                           | Datum/tijd van de laatste wijziging (bijv. statuswijziging).                                                                                                                                                  |                          |                                                                                                                    | C                   |
| Requester::PractitionerRole.Practitioner | Reference       | pt-lm-Task.Requester                       | A. de Haard, huisarts                                                                                                              | b                           | Zowel de naam als het specialisme tonen.                                                                                                                                                                      | Aanvragende zorgverlener |                                                                                                                    | S                   |
| Requester::PractitionerRole.Organization | Reference       | pt-lm-Task.Requester                       | Huisartsenpraktijk de Haard                                                                                                        | a                           | Liefst geen afkortingen.                                                                                                                                                                                      | Zorgorganisatie          |                                                                                                                    | M                   |
| Owner::Patient                           | Reference       | pt-lm-Task.Owner                           | Tom van Duinen                                                                                                                     | c                           | Uitvoerder van de taak. In de huidige scope altijd de patiënt zelf.                                                                                                                                           | Uitvoerder               |                                                                                                                    | W                   |
| Restriction.Repetitions                  | Item            | pt-lm-Task.Restriction.Repetitions         | (nog geen voorbeeld)                                                                                                               | c                           | Aantal keer dat de taak herhaald moet worden.                                                                                                                                                                 |                          |                                                                                                                    | C                   |
| Restriction.Period                       | Item            | pt-lm-Task.Restriction.Period              | (nog geen voorbeeld)                                                                                                               | c                           | Periode waarin de restrictie van toepassing is.                                                                                                                                                               |                          |                                                                                                                    | C                   |
| LastUpdated                              | Item            | (niet in LM)                               |                                                                                                                                    | c                           | Niet in het LM, maar wel relevant. Betreft de `lastUpdated` aan de bron en kan PGO-zijdig gebruikt worden voor incrementele synchronisatie (max(_lastUpdated)).                                               |                          |                                                                                                                    | C                   |


### Digitale activiteit (ActivityDefinition)

Verwijzing: [LogicalModel ActivityDefinition](https://simplifier.net/medmij-r4-provider-module/lmactivitydefinition)


| Naam data-item          | Type data-item  | Id                                      | Voorbeeld                                              | Waar tonen in PGO (a/b/c/d) | Opmerkingen                                                                                 | Weergavetekst in de PGO | Gebruikersvriendelijke toelichting | Prioriteit (MoSCoW) |
| ----------------------- | --------------- | --------------------------------------- | ------------------------------------------------------ | --------------------------- | ------------------------------------------------------------------------------------------- | ----------------------- | ---------------------------------- | ------------------- |
| **Digitale Activiteit** | **Rootconcept** | pt-lm-ActivityDefinition                |                                                        |                             | Herbruikbare definitie van een te starten digitale (eHealth) activiteit.                    | Activiteit              |                                    |                     |
| ModuleEndpoint          | Reference       | pt-lm-ActivityDefinition.ModuleEndpoint | Endpoint/ProviderModule-Endpoint-Module                | d                           | Endpoint waar de activiteit gestart wordt. Niet tonen, wel noodzakelijk voor de launch.     |                         |                                    | M                   |
| Identifier              | Item            | pt-lm-ActivityDefinition.Identifier     |                                                        | c                           | Business identifier van de ActivityDefinition.                                              |                         |                                    | C                   |
| Version                 | Item            | pt-lm-ActivityDefinition.Version        | 1.0.0                                                  | c                           | Versie van de gepubliceerde activiteit.                                                     |                         |                                    | C                   |
| Name                    | Item            | pt-lm-ActivityDefinition.Name           | VragenlijstWoonLeefsituatie                            | c                           | Computer-friendly naam.                                                                     |                         |                                    | W                   |
| Title                   | Item            | pt-lm-ActivityDefinition.Title          | Vragenlijst over de woon-leefsituatie                  | a                           | Mens-leesbare titel die in het overzicht en detail wordt getoond.                           | Activiteit (titel)      |                                    | M                   |
| Status                  | Item            | pt-lm-ActivityDefinition.Status         | active                                                 | c                           | Status van de definitie (bijv. draft, active, retired).                                     |                         |                                    | C                   |
| Publisher               | Item            | pt-lm-ActivityDefinition.Publisher      | HinqZNO                                                | c                           | Organisatie die verantwoordelijk is voor de publicatie van de activiteit (moduleaanbieder). |                         |                                    | C                   |
| Description             | Item            | pt-lm-ActivityDefinition.Description    | Vragenlijst beschrijving voor patiënt en zorgaanbieder | c                           | Beschrijving (markdown). Niet patiëntspecifiek.                                             |                         |                                    | C                   |
| Usage                   | Item            | pt-lm-ActivityDefinition.Usage          |                                                        | c                           | Bedoeld voor de zorgverlener bij het selecteren/toewijzen.                                  |                         |                                    | W                   |
| Timing                  | Item            | pt-lm-ActivityDefinition.Timing         | 7d, 2x per dag (optioneel)                             | c                           | Aanbevolen timing op definitieniveau. Patiëntspecifieke timing hoort bij de ServiceRequest. |                         |                                    | C                   |


### Zorgopdracht (ServiceRequest)

Verwijzing: [LogicalModel ServiceRequest](https://simplifier.net/medmij-r4-provider-module/lmservicerequest)

Voor de ServiceRequest hebben we twee varianten:

**Variant 1 — Groeperende zorgopdracht.** De zorgverlener vraagt een set aan digitale interventies aan (bijv. een digitale zorgmodule). De ServiceRequest dient hier momenteel geen ander doel dan het groeperen van de taken. Workflow compliant.


| Naam data-item             | Type data-item  | Id                               | Voorbeeld                                                                           | Waar tonen in PGO (a/b/c/d) | Opmerkingen                                                   | Weergavetekst in de PGO | Gebruikersvriendelijke toelichting | Prioriteit (MoSCoW) |
| -------------------------- | --------------- | -------------------------------- | ----------------------------------------------------------------------------------- | --------------------------- | ------------------------------------------------------------- | ----------------------- | ---------------------------------- | ------------------- |
| **ServiceRequest (groep)** | **Rootconcept** | pt-lm-ServiceRequest             |                                                                                     |                             | Groeperende zorgopdracht voor een digitale zorgmodule.        |                         |                                    |                     |
| Identifier                 | Item            | pt-lm-ServiceRequest.Identifier  | system: "https://medrie.nl/fhir/identifiers/SR-group" value: "module-diabetes-2025" | c                           | Mogelijk nodig voor sortering/groepering aan PGO-zijde.       |                         |                                    | C                   |
| Code (text)                | Item            | (FHIR: ServiceRequest.code.text) | "Digitale zorgmodule Diabetes"                                                      | a                           | Wordt in het overzicht getoond via `Task.basedOn.display`.    | Zorgmodule              |                                    | M                   |
| Status                     | Item            | pt-lm-ServiceRequest.Status      | active                                                                              | c                           |                                                               |                         |                                    | C                   |
| Intent                     | Item            | pt-lm-ServiceRequest.Intent      | order                                                                               | c                           |                                                               |                         |                                    | C                   |
| Subject                    | Reference       | pt-lm-ServiceRequest.Subject     | De patiënt                                                                          | c                           |                                                               |                         |                                    | W                   |
| Requester                  | Reference       | pt-lm-ServiceRequest.Requester   | A. de Haard, huisarts                                                               | c                           | Aanvragende zorgverlener wordt al getoond via Task.requester. |                         |                                    | C                   |
| AuthoredOn                 | Item            | pt-lm-ServiceRequest.AuthoredOn  | 2025-12-23T18:00:00+01:00                                                           | c                           |                                                               |                         |                                    | C                   |


**Variant 2 — Patiëntspecifieke zorgopdracht.** Wordt alleen gebruikt als er voor een taak in de module een patiëntspecifieke instructie of een afwijkende timing moet worden vastgelegd.


| Naam data-item                        | Type data-item  | Id                                      | Voorbeeld                                                          | Waar tonen in PGO (a/b/c/d) | Opmerkingen                                                                                | Weergavetekst in de PGO | Gebruikersvriendelijke toelichting | Prioriteit (MoSCoW) |
| ------------------------------------- | --------------- | --------------------------------------- | ------------------------------------------------------------------ | --------------------------- | ------------------------------------------------------------------------------------------ | ----------------------- | ---------------------------------- | ------------------- |
| **ServiceRequest (patiëntspecifiek)** | **Rootconcept** | pt-lm-ServiceRequest                    |                                                                    | b                           | Patiëntspecifieke zorgopdracht.                                                            |                         |                                    |                     |
| Identifier                            | Item            | pt-lm-ServiceRequest.Identifier         |                                                                    | c                           |                                                                                            |                         |                                    | C                   |
| Status                                | Item            | pt-lm-ServiceRequest.Status             | active                                                             | c                           |                                                                                            |                         |                                    | C                   |
| Intent                                | Item            | pt-lm-ServiceRequest.Intent             | order                                                              | c                           |                                                                                            |                         |                                    | C                   |
| Subject                               | Reference       | pt-lm-ServiceRequest.Subject            | De patiënt                                                         | c                           |                                                                                            |                         |                                    | W                   |
| patientInstruction                    | Item            | pt-lm-ServiceRequest.patientInstruction | "Specifieke instructie voor patiënt X, alleen 's avonds gebruiken" | b                           | Optioneel. Specifieke instructie voor de patiënt, alleen tonen indien aanwezig.            | Patiëntinstructie       |                                    | M                   |
| Occurrence                            | Item            | pt-lm-ServiceRequest.Occurrence         | 7d, 2x per dag                                                     | c                           | Optioneel. Patiëntspecifieke timing (kan afwijken van de timing in de ActivityDefinition). |                         |                                    | C                   |
| Requester                             | Reference       | pt-lm-ServiceRequest.Requester          | A. de Haard, huisarts                                              | c                           |                                                                                            |                         |                                    | C                   |
| AuthoredOn                            | Item            | pt-lm-ServiceRequest.AuthoredOn         | 2025-12-23T18:00:00+01:00                                          | c                           |                                                                                            |                         |                                    | C                   |


### Endpoint

Verwijzing: [LogicalModel Endpoint](https://simplifier.net/medmij-r4-provider-module/lmenpoint)

De entiteit Endpoint is wel in gebruik, maar de gegevens worden niet getoond in de PGO. De gegevens zijn nodig voor de launch van de digitale activiteit.


| Naam data-item       | Type data-item  | Id                                  | Voorbeeld                                                          | Waar tonen in PGO (a/b/c/d) | Opmerkingen                                              | Weergavetekst in de PGO | Gebruikersvriendelijke toelichting | Prioriteit (MoSCoW) |
| -------------------- | --------------- | ----------------------------------- | ------------------------------------------------------------------ | --------------------------- | -------------------------------------------------------- | ----------------------- | ---------------------------------- | ------------------- |
| **Endpoint**         | **Rootconcept** | pt-lm-Endpoint                      |                                                                    | d                           | Niet tonen, wel noodzakelijk voor de launch.             |                         |                                    | M                   |
| ClientId             | Item            | pt-lm-Endpoint.ClientId             | dvaaanbiedersmodulesweb                                            | d                           | Client identifier ('audience') in de DVA token exchange. |                         |                                    | M                   |
| managingOrganization | Reference       | pt-lm-Endpoint.managingOrganization | Organization/ProviderModule-Organization-Huisartsenpraktijk-Medrie | d                           | Organisatie die het endpoint beheert.                    |                         |                                    | M                   |
| Address              | Item            | pt-lm-Endpoint.Adress               | https://module.test.5im.nl/web/api/smartonfhir/launch              | d                           | FHIR resource endpoint voor de launch.                   |                         |                                    | M                   |


### Lokale gegevens aan PGO-zijde


| Naam data-item    | Type data-item | Id       | Voorbeeld                 | Waar tonen in PGO (a/b/c/d) | Opmerkingen                                                                                                          | Weergavetekst in de PGO | Gebruikersvriendelijke toelichting | Prioriteit (MoSCoW) |
| ----------------- | -------------- | -------- | ------------------------- | --------------------------- | -------------------------------------------------------------------------------------------------------------------- | ----------------------- | ---------------------------------- | ------------------- |
| Laatste_ophaal_ZA | Item           | (lokaal) | 2000-01-01T00:00:00+01:00 | a                           | Initiële datum of `max(_lastUpdated)`. Wordt gebruikt om incrementeel taakgegevens op te halen bij de zorgaanbieder. | Laatst opgehaald        |                                    | M                   |


### Aandachtspunten

**Deduplicatie.** Voor de taak gebeurt deduplicatie op basis van een business identifier. Voor gerelateerde resources (bijvoorbeeld een gekoppelde ActivityDefinition) is het wenselijk dat ook deze een unieke business identifier krijgen, om verweesde objecten in de PGO te voorkomen.

**Weergave duplicaten.** In tegenstelling tot bijvoorbeeld Beelden willen we voor taken voorkomen dat er duplicaten bestaan. Tonen in groepen is hier daarom niet wenselijk.

**Status `draft` → `cancelled` (Draft2cancel).** Taken met status `cancelled` worden uitgewisseld en moeten in een separaat tabblad worden getoond. Omdat de aanname is dat Koppeltaal-taken status `draft` kunnen hebben (taken die de patiënt kan ophalen), kan via `Task.statusReason` worden aangegeven dat een taak voorheen in `draft` stond. Deze taken kunnen client-side worden weggelaten.