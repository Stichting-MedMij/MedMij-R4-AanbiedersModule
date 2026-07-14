---
topic: FO
---

# Functioneel ontwerp

## Algemeen

Dit functioneel ontwerp beschrijft hoe een zorgaanbieder patiëntspecifieke digitale activiteiten als taken beschikbaar stelt aan een patiënt via een Persoonlijke Gezondheidsomgeving (PGO). De patiënt raadpleegt de taken in de PGO en start de bijbehorende digitale activiteit in een extern modulesysteem. In dit ontwerp gebruiken we de term 'patiënt' om de persoon aan te duiden, maar hier kan ook 'cliënt' of 'burger' gelezen worden.

Aanbiedertaken valt binnen het MedMij-domein: de zorgaanbieder zet digitale activiteiten uit en de patiënt raadpleegt en start deze via een PGO. Koppeltaal richt zich op gegevensuitwisseling tussen zorginformatiesystemen onderling (EPD's, behandel-/patiëntportalen, eHealth-modules) in de context van een behandeling. Beide projecten wisselen taken en digitale activiteiten uit; Aanbiedertaken doet dat tussen zorgaanbieder en patiënt, Koppeltaal tussen zorginformatiesystemen. Deze Implementation Guide is specifiek voor Aanbiedertaken. Voor Koppeltaal is een aparte Implementation Guide beschikbaar via [Simplifier](https://simplifier.net/packages/Koppeltaalv2.00/0.16.2).

Merk op dat naast dit ontwerp ook de (functionele) eisen en richtlijnen beschreven in de [MedMij R4 Core IG](https://simplifier.net/guide/medmij-r4-core-ig?version=1.0.1) en het door Nictiz gepubliceerde [Functioneel ontwerp](https://informatiestandaarden.nictiz.nl/wiki/MedMij:FO:V1/FunctioneelOntwerp) van toepassing zijn.

### Doelgroep

De doelgroep voor deze pagina wijkt niet af van de [algemene doelgroep](https://informatiestandaarden.nictiz.nl/wiki/MedMij:FO:V1/FunctioneelOntwerp#Doelgroep) van de functionele ontwerpen binnen MedMij.

### Kaders en uitgangspunten

- De uitwisseling vindt plaats binnen het MedMij Afsprakenstelsel (authenticatie, autorisatie, logging, enz.).
- De zorgaanbieder initieert één of meerdere digitale activiteiten voor een patiënt.
- De patiënt ziet de taken in de PGO als takenlijst en kan vanuit de PGO een extern modulesysteem starten om een taak uit te voeren. De takenlijst bevat openstaande taken en kan daarnaast ook afgeronde taken tonen.
- Digitale activiteiten kunnen verschillende typen hebben, zoals informatie bekijken, een vragenlijst invullen of thuismetingen uitvoeren.

### Richtlijn en proces

Dit ontwerp is conform specificaties genoemd in [de algemene inleiding](https://informatiestandaarden.nictiz.nl/wiki/MedMij:V2020.01/Ontwerpen#Richtlijn) van de functionele ontwerpen binnen MedMij.

### Reikwijdte

De reikwijdte van dit ontwerp is:

- de functionele beschrijving voor het beschikbaar stellen van patiëntspecifieke digitale activiteiten (taken) door de zorgaanbieder via Aanbiedertaken;
- de functionele dataset (Logical Models) voor deze uitwisseling, inclusief de relaties tussen digitale activiteit, digitaal groepsplan, uitvoeringsopdracht en taak;
- het bijwerken van de status van een taak vanuit het modulesysteem naar het XIS.

Buiten scope:

- het uitwisselen van inhoudelijke resultaten die ontstaan bij het uitvoeren van een digitale activiteit (zoals meetwaarden of vragenlijstantwoorden).

### Infrastructuur

Geen nadere specificatie, anders dan genoemd in [de algemene inleiding](https://informatiestandaarden.nictiz.nl/wiki/MedMij:FO:V1/FunctioneelOntwerp#Infrastructuur) van de functionele ontwerpen binnen MedMij.

### Geografische reikwijdte

Geen nadere specificatie, anders dan genoemd in [de algemene inleiding](https://informatiestandaarden.nictiz.nl/wiki/MedMij:FO:V1/FunctioneelOntwerp#Geografische_reikwijdte) van de functionele ontwerpen binnen MedMij.

### Kwalificatie en testen

Op dit moment wordt de usecase uit dit ontwerp getoetst in een Proof of Concept (PoC). Later volgt meer informatie over kwalificatie.

In de alpha-testfase vindt geïsoleerd testen plaats met behulp van MedMij-simulatoren. Deze simulatoren simuleren de relevante systeemrollen (PGO en XIS) en ondersteunen leveranciers bij het functioneel en technisch valideren van de uitwisseling.

De simulatoren voeren geautomatiseerde validaties uit om te bepalen of een leverancier implementeert conform de geldende specificaties, waaronder de afspraken zoals beschreven in deze IG (en de van toepassing zijnde MedMij-richtlijnen). De uitkomsten van deze validaties geven inzicht in conformiteit en eventuele afwijkingen, en vormen input voor door te voeren correcties voordat vervolgtesten (bijv. ketentesten) plaatsvinden.

## Usecases

### Algemeen

Een usecase beschrijft een praktijksituatie waarin informatie-uitwisseling plaatsvindt tussen actoren (mensen, systemen) via transacties (welke informatie wordt wanneer uitgewisseld). In dit ontwerp is de usecase 'Aanbiedertaken' in scope.

### Usecase: Aanbiedertaken

#### Doel en relevantie

Het doel is dat patiënten in de PGO taken zien die de zorgaanbieder heeft aangevraagd, en dat zorgaanbieders digitale activiteiten kunnen uitzetten en de voortgang kunnen volgen via statusinformatie.

Voor de patiënt is het doel om in de PGO inzicht te hebben in:

- welke digitale activiteiten de zorgaanbieder heeft aangevraagd;
- de bijbehorende taken, inclusief planning en actuele status;
- wat er van de patiënt wordt verwacht (omschrijving en eventuele instructies).

Voor de zorgaanbieder:

- het uitzetten van digitale activiteiten voor een patiënt;
- het volgen van voortgang via statusinformatie op taakniveau.

#### Patiëntreis

Koos (54) heeft diabetes type 2. Zijn huisarts wil dat hij thuis zijn bloeddruk meet: 2× per dag gedurende 7 dagen. Koos ontvangt een e-mail dat er een nieuwe taak klaarstaat in zijn PGO.

Hij opent de PGO en raadpleegt de takenlijst. Onder het groepslabel 'Diabetes' ziet hij de taak 'Meet je bloeddruk' met de taakomschrijving, de status en het tijdschema voor uitvoering. Hij start de activiteit en de externe applicatie opent met de juiste context en Koos voert de metingen uit.

Na afloop keert Koos terug naar de PGO. In de takenlijst ziet Koos dat de taak op 'in uitvoering' of 'afgerond' staat.

#### Procesbeschrijving

##### Preproces

- De patiënt beschikt over een PGO dat aan de MedMij-eisen voldoet.
- De patiënt heeft toestemming gegeven voor het elektronisch uitwisselen van gegevens tussen het betreffende XIS en de eigen PGO.
- De patiënt is bekend in het XIS en er is een behandelrelatie.

##### Proces

- De zorgaanbieder selecteert een digitale activiteit die past bij het zorgproces (bijv. CVRM, diabetes of COPD).
- Het XIS maakt per digitale activiteit één taak aan en stelt deze beschikbaar aan de patiënt. Wanneer meerdere digitale activiteiten in samenhang worden aangevraagd (bijv. binnen één digitale zorgmodule), worden de bijbehorende taken gegroepeerd via een gedeeld digitaal groepsplan. Per taak worden vastgelegd:
  - een koppeling naar de digitale activiteit waarop de taak is gebaseerd;
  - het gedeelde digitaal groepsplan waaraan de taak is gekoppeld voor groepering;
  - patiëntspecifieke uitvoeringsinstructies en/of het tijdschema voor de uitvoering, vastgelegd in een uitvoeringsopdracht die aan de taak is gekoppeld. Een uitvoeringsopdracht is optioneel, maar verplicht wanneer er een (herhalend) tijdschema geldt (bijv. '2× per dag gedurende 7 dagen').
- De patiënt wordt geïnformeerd (bijv. per e-mail) dat er een nieuwe taak klaarstaat in de PGO.
- De patiënt raadpleegt de takenlijst in de PGO. De patiënt kan taken filteren (bijv. per zorgmodule) op basis van contextinformatie.
- De patiënt start de digitale activiteit vanuit de PGO (launch naar het modulesysteem) en voert de activiteit uit in de externe applicatie.
- Het modulesysteem werkt de status van de individuele taak bij in het XIS (bijv. naar 'in uitvoering' of 'afgerond'). De patiënt kan op elk moment de takenlijst opnieuw ophalen.

##### Postproces

- De patiënt heeft één of meerdere taken gestart en/of afgerond.
- Het modulesysteem heeft de taakstatus bijgewerkt in het XIS.
- De zorgaanbieder kan de voortgang volgen via de bijgewerkte status van taken.

#### Bedrijfsrollen

Deze usecase onderscheidt twee bedrijfsrollen, namelijk de Patiënt en de Zorgaanbieder, zoals te zien in onderstaande tabel.

| Bedrijfsrol (actor) | Beschrijving |
| --- | --- |
| Patiënt | Gebruiker van de PGO en het modulesysteem |
| Zorgaanbieder | Gebruiker van het XIS |

**Tabel 1: Bedrijfsrollen**

#### Informatieoverdracht

Zowel de patiënt als de zorgaanbieder maken gebruik van een informatiesysteem:

- PGO (patiënt)
- XIS (zorgaanbieder)
- Modulesysteem (patiënt)

##### Systemen en systeemrollen

Deze systemen kennen ieder verschillende systeemrollen, die het uitwisselen van gegevens tussen deze systemen mogelijk maken.

| Systeem | Naam systeemrol | Systeemrolcode | Omschrijving |
| --- | --- | --- | --- |
| PGO | TaakgegevensRaadplegend | PT-TGR-1.0.0-alpha.1 | Raadplegen taken bij de zorgaanbieder |
| XIS | TaakgegevensBeschikbaarstellend | PT-TGB-1.0.0-alpha.1 | Beschikbaar stellen taken aan de patiënt en verwerken van statusupdates |
| Modulesysteem | DigitaleActiviteitUitvoerder | PA-DAU-1.0.0-alpha.1 | Levert de digitale activiteit, ondersteunt de uitvoering en koppelt de taakstatus terug naar het XIS |

**Tabel 2: Systeemrollen**

#### Transacties en transactiegroepen

Het uitwisselen van gegevens tussen de verschillende systeemrollen gebeurt op basis van transacties. Een verzameling van transacties (bijvoorbeeld een vraag- en antwoordbericht) vormt een transactiegroep. Voor de technische specificaties, zie het {{pagelink: TO, text: technisch ontwerp}}.

| Transactiegroep | Transactie | Systeemrolcode | Systeem | Bedrijfsrol |
| --- | --- | --- | --- | --- |
| Verzamelen Taakgegevens (PULL) | Beschikbaar stellen Taken | PT-TGB-1.0.0-alpha.1 | XIS | Zorgaanbieder |
| Verzamelen Taakgegevens (PULL) | Raadplegen Taken | PT-TGR-1.0.0-alpha.1 | PGO | Patiënt |
| Digitale activiteit uitvoeren (LAUNCH) | Launch naar digitale activiteit | PA-DAU-1.0.0-alpha.1 | Modulesysteem | Patiënt |
| Bijwerken Taakstatus (UPDATE) | Bijwerken Taakstatus | PA-DAU-1.0.0-alpha.1 | Modulesysteem | Modulesysteem |
| Bijwerken Taakstatus (UPDATE) | Verwerken Taakstatus | PT-TGB-1.0.0-alpha.1 | XIS | Zorgaanbieder |

**Tabel 3: Transactiegroepen**

#### Functionele bouwstenen

De dataset voor Aanbiedertaken bestaat uit de volgende bouwstenen:

**Digitale activiteit**  
Herbruikbare definitie van een digitale activiteit (bijv. 'Thuismetingen bloeddruk'). De digitale activiteit beschrijft wat de activiteit inhoudt en hoe deze in algemene zin wordt gebruikt. Wanneer de activiteit launchbaar is, verwijst de digitale activiteit naar één of meerdere endpoints met technische toegangs- en launchdetails.

**Digitaal groepsplan**  
Patiëntspecifieke aanvraag waarmee een digitaal groepsplan of zorgmodule voor de patiënt wordt geïnitieerd. Alle taken die binnen hetzelfde groepsplan horen, verwijzen naar hetzelfde digitaal groepsplan. De naam van het groepsplan wordt gebruikt als groepslabel in de takenlijst van de PGO.

**Uitvoeringsopdracht**  
Patiëntspecifieke uitvoeringsopdracht voor één digitale activiteit, met patiëntspecifieke instructies en het tijdschema voor uitvoering. De uitvoeringsopdracht is optioneel, maar verplicht wanneer er een (herhalend) tijdschema geldt. PGO's lezen het tijdschema dat aan de patiënt wordt getoond uitsluitend uit de uitvoeringsopdracht. Hiermee is er één eenduidige bron voor het tijdschema en wordt duplicatie of inconsistentie voorkomen.

**Taak**  
Het item dat de patiënt in de PGO ziet en waarop voortgang wordt bijgehouden (openstaand, in uitvoering, afgerond). Elke taak staat voor één digitale activiteit. Er is geen hiërarchische onderverdeling in hoofd- en subtaken; taken die bij elkaar horen worden gegroepeerd via het gedeelde digitaal groepsplan. Statusupdates worden per individuele taak toegepast.

#### Dataset

De dataset is uitgewerkt aan de hand van Logical Models:

- LogicalModel {{pagelink: LogicalModelsIndex, text: Digitale activiteit, anchor: ptlmDigitalActivity}}
- LogicalModel {{pagelink: LogicalModelsIndex, text: Digitaal groepsplan, anchor: ptlmDigitalGroupPlan}}
- LogicalModel {{pagelink: LogicalModelsIndex, text: Endpoint, anchor: ptlmEndpoint}}
- LogicalModel {{pagelink: LogicalModelsIndex, text: Uitvoeringsopdracht, anchor: ptlmExecutionOrder}}
- LogicalModel {{pagelink: LogicalModelsIndex, text: Taak, anchor: ptlmTask}}
