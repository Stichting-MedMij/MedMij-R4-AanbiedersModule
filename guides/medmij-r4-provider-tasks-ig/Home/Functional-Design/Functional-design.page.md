---
topic: FO
---

# Functioneel ontwerp

## Algemeen
Aanbiedertaken (ProviderTasks) beschrijft de uitwisseling waarmee een zorgaanbieder patiënt-specifieke digitale activiteiten als taken beschikbaar stelt aan een patiënt, zodat de patiënt deze kan uitvoeren via een Persoonlijke Gezondheidsomgeving (PGO) of een andere eHealth-module.

ProviderTasks en Koppeltaal zijn als afzonderlijke projecten ingericht omdat ze ieder een eigen domein, doelgroep en afsprakenkader bedienen:

- **Aanbiedertaken** valt binnen het MedMij-domein en betreft de uitwisseling tussen zorgaanbieder en patiënt: de zorgaanbieder zet digitale activiteiten uit, de patiënt raadpleegt en start deze via een PGO.
- **Koppeltaal** richt zich op gegevens- en workflow-uitwisseling tussen zorginformatiesystemen onderling, onder andere EPD’s, behandel-/patiëntportalen en eHealth-modules, in de context van een behandeling.

In de kern beogen beide projecten echter hetzelfde: het ondersteunen van digitale zorg door het uitwisselen van taken en het kunnen uitvoeren van digitale activiteiten in de context van een behandeling. Het naast elkaar bestaan van twee projecten weerspiegelt dus niet twee verschillende doelen, maar twee verschillende contexten waarin dat doel wordt gerealiseerd.

Omdat beide projecten FHIR gebruiken om vergelijkbare workflowconcepten (zoals taken en digitale activiteiten) uit te wisselen, is een belangrijk onderdeel van zowel ProviderTasks als Koppeltaal het harmoniseren van de FHIR-profielen. Het doel hiervan is dat dezelfde (of zoveel mogelijk overlappende) profielen herbruikbaar zijn en consistent toegepast kunnen worden in beide projecten.

Deze Implementation Guide is specifiek voor Aanbiedertaken. Voor Koppeltaal is een aparte Implementation Guide beschikbaar via [Simplifier](https://simplifier.net/Koppeltaalv2.0/~guides).

### Doelgroep
De doelgroep voor deze pagina wijkt niet af van de [algemene doelgroep](https://informatiestandaarden.nictiz.nl/wiki/MedMij:FO:V1/FunctioneelOntwerp#Doelgroep) van de functionele ontwerpen binnen MedMij.


### Uitgangspunten
- De uitwisseling is gebaseerd op het MedMij-afsprakenstelsel en op (geharmoniseerde) FHIR-profielen die worden toegepast binnen Aanbiedertaken en Koppeltaal.
- De zorgaanbieder initieert één of meerdere digitale activiteiten voor een patiënt.
- De patiënt ziet de taken in de PGO als takenlijst en kan vanuit de PGO een externe module/applicatie starten om een taak uit te voeren. De takenlijst bevat openstaande taken en kan daarnaast ook afgeronde taken tonen.
- Digitale activiteiten kunnen verschillende typen hebben, zoals informatie bekijken, een vragenlijst invullen of thuismetingen uitvoeren.


### Richtlijn en proces
Dit ontwerp is conform specificaties genoemd in [de algemene inleiding](https://informatiestandaarden.nictiz.nl/wiki/MedMij:V2020.01/Ontwerpen#Richtlijn) van de functionele ontwerpen binnen MedMij.


### Reikwijdte
De reikwijdte van dit ontwerp beslaat:
- de functionele beschrijving van het uitwisselen van patiënt-specifieke digitale activiteiten (taken) die door de zorgaanbieder worden aangevraagd en via Aanbiedertaken beschikbaar worden gesteld;
- de bijbehorende dataset (Logical Models) die nodig is voor deze uitwisseling, inclusief de relaties tussen de digitale activiteit (ActivityDefinition), de zorgopdracht in de rol van digitaal groepsplan (ServiceRequest – DigitalGroupPlan), de zorgopdracht in de rol van uitvoeringsopdracht (ServiceRequest – ExecutionOrder) en de taak (Task);
- het bijwerken van de status van een taak vanuit het modulesysteem naar het bronsysteem.

Buiten scope van deze versie:
- het uitwisselen van inhoudelijke resultaten die ontstaan bij het uitvoeren van een digitale activiteit (zoals Observation, Procedure of QuestionnaireResponse).


### Infrastructuur
Geen nadere specificatie, anders dan genoemd in [de algemene inleiding](https://informatiestandaarden.nictiz.nl/wiki/MedMij:FO:V1/FunctioneelOntwerp#Infrastructuur) van de functionele ontwerpen binnen MedMij.


### Geografische reikwijdte
Geen nadere specificatie, anders dan genoemd in [de algemene inleiding](https://informatiestandaarden.nictiz.nl/wiki/MedMij:FO:V1/FunctioneelOntwerp#Geografische_reikwijdte) van de MedMij functionele ontwerpen.


### Kwalificatie en testen
Op dit moment wordt de usecase uit dit ontwerp getoetst in een Proof of Concept (PoC). Later volgt meer informatie over kwalificatie.

In de alpha-testfase vindt geïsoleerd testen plaats met behulp van MedMij-simulatoren. Deze simulatoren simuleren de relevante systeemrollen (PGO en XIS) en ondersteunen leveranciers bij het zowel functioneel als technisch valideren van de uitwisseling.

De simulatoren voeren geautomatiseerde validaties uit om te bepalen of een leverancier implementeert conform de geldende specificaties, waaronder de afspraken en profielen zoals beschreven in deze IG (en de van toepassing zijnde MedMij-richtlijnen). De uitkomsten van deze validaties geven inzicht in conformiteit en eventuele afwijkingen, en vormen input voor door te voeren correcties voordat vervolgtesten (bijv. ketentesten) plaatsvinden.

## Usecases

### Algemeen
Binnen Aanbiedertaken stelt de zorgaanbieder patiënt-specifieke digitale activiteiten beschikbaar aan de patiënt via de PGO. Een digitale activiteit kan bijvoorbeeld bestaan uit het lezen van informatie, het invullen van een vragenlijst of het uitvoeren van thuismetingen.

Het proces is als volgt:
- De zorgaanbieder selecteert een passende digitale activiteit (module) voor het zorgproces.
- De zorgaanbieder vraagt deze activiteit aan voor een specifieke patiënt.
- Het bronsysteem maakt vervolgens één of meerdere taken aan die in de PGO zichtbaar worden.
- De patiënt ontvangt en raadpleegt deze taken in de PGO en kan de activiteit uitvoeren (bijvoorbeeld door een externe module te starten).


### Usecase: Aanbiedertaken

#### Doel en relevantie uitwisselen taken
Het doel is dat de patiënt in de PGO inzicht heeft in:
- welke digitale activiteiten door de zorgaanbieder zijn aangevraagd;
- welke taken daarbij horen, inclusief planning en actuele status/voortgang;
- wat er van de patiënt wordt verwacht (omschrijving en eventuele instructies).

Voor de zorgaanbieder is het doel:
- het betrouwbaar kunnen uitzetten van digitale activiteiten;
- het volgen van voortgang (op hoofdlijnen) via statusinformatie.


#### Patient journey Aanbiedertaken
De patient journey beschrijft momenten waarop de patiënt inzicht kan of wil hebben in de digitale activiteiten:

Ontvangst:
- De patiënt ontvangt een melding (via mail) dat er een digitale activiteit klaarstaat: “Meet je bloeddruk 2× per dag gedurende 7 dagen”.

Takenlijst raadplegen:
- De patiënt opent de PGO en raadpleegt de takenlijst. Per taak ziet de patiënt de taakomschrijving, status en het tijdschema voor uitvoering (inclusief eventuele herhalingen, zoals afgeleid uit de uitvoeringsopdracht).

Starten van de activiteit:
- De patiënt start de digitale activiteit vanuit de PGO, door een externe module/applicatie te openen (“Start module”). Hiermee wordt de uitvoering van de activiteit gestart in een externe applicatie met de juiste context.

Uitvoering:
- De patiënt voert één of meerdere taken uit in de externe module/applicatie.

Terugkoppeling:
- Na het uitvoeren van de digitale activiteit gaat de patiënt terug naar de PGO. De status van de taak wordt bijgewerkt in het bronsysteem, zodat de voortgang en afronding zichtbaar zijn in de takenlijst. Statusupdates worden per individuele taak doorgevoerd; er is geen hoofd-/subtaak hiërarchie. Het terugkoppelen van inhoudelijke resultaten (zoals de beantwoording van een vragenlijst) valt in deze versie buiten scope. De focus ligt op de taken en de workflow zelf.



### Procesbeschrijving Aanbiedertaken

#### Precondities
- De patiënt beschikt over een PGO die voldoet aan de MedMij-eisen.
- De patiënt heeft toestemming gegeven voor elektronische uitwisseling van gegevens tussen zorgaanbieder en PGO.
- De patiënt is bekend in het bronsysteem en er is een behandelrelatie.
 

#### Proces
1. Selectie digitale activiteit (module):
- Zorgaanbieder selecteert een digitale activiteit die past bij het zorgproces (bijv. CVRM/diabetes/COPD). 

2. Aanmaken en beschikbaar stellen van taken:
- Het bronsysteem maakt per digitale activiteit één taak aan en stelt deze beschikbaar aan de patiënt. Wanneer meerdere digitale activiteiten in samenhang worden aangevraagd (bijv. binnen één digitale zorgmodule), worden de bijbehorende taken gegroepeerd via een gedeelde zorgopdracht in de rol van digitaal groepsplan. Per taak worden de volgende relaties en gegevens vastgelegd:
	- een koppeling naar de digitale activiteit (ActivityDefinition) waarop de taak gebaseerd is;
	- de gedeelde zorgopdracht (digitaal groepsplan) waaraan de taak is gekoppeld voor groepering;
	- patiënt-specifieke uitvoeringsinstructies en/of het tijdschema voor de uitvoering van de activiteit, vastgelegd in een zorgopdracht in de rol van uitvoeringsopdracht (ServiceRequest – ExecutionOrder), die aan de taak is gekoppeld. Een uitvoeringsopdracht is in principe optioneel, maar verplicht aanwezig wanneer er een (herhalend) tijdschema voor de activiteit geldt (bijv. "2× per dag gedurende 7 dagen").

Er is geen hoofd-/subtaak hiërarchie tussen taken: elke taak vertegenwoordigt één digitale activiteit. Taken die bij elkaar horen, worden uitsluitend gegroepeerd via de gedeelde zorgopdracht (digitaal groepsplan).

3. Patiënt informeren:
- De patiënt wordt geïnformeerd (bijv. per e-mail) dat er een nieuwe taak klaarstaat in de PGO.

4. Raadplegen door patiënt:
- De patiënt raadpleegt de takenlijst in de PGO. De patiënt kan taken filteren (bijv. per “zorgmodule”) op basis van contextinformatie.

5. Uitvoering:
- De patiënt start de digitale activiteit vanuit de PGO (launch naar de module/applicatie) en voert de activiteit uit in de externe applicatie. 

6. Statusupdates:
- De status van de individuele taak wordt door het modulesysteem bijgewerkt in het bronsysteem (bijv. naar 'in uitvoering' of 'afgerond'), zodat voortgang en afronding zichtbaar zijn in de takenlijst voor de zorgaanbieder en patiënt. Statusupdates worden per taak toegepast; er is geen hoofd-/subtaak hiërarchie. De patiënt kan op elk moment de takenlijst opnieuw ophalen.

#### Postconditie
- De patiënt heeft één of meerdere taken uitgevoerd en/of afgerond.
- De externe applicatie heeft de status bijgewerkt.
- De zorgaanbieder kan (op hoofdlijnen) de voortgang volgen via de (bijgewerkte) status van taken.

### Bedrijfsrollen
Deze usecase onderscheidt twee bedrijfsrollen, namelijk de Persoon en de (Zorg)Aanbieder zoals te zien in onderstaande tabel.

| Bedrijfsrol (actor) | Beschrijving bedrijfsrol |
| --- | --- |
| Patiënt | Gebruiker van de PGO |
| Zorgaanbieder | Gebruiker van het bronsysteem |

**Tabel 1: Bedrijfsrollen**

### Informatieoverdracht
Zowel de persoon als de (zorg)aanbieder maken ieder gebruik van een informatiesysteem:
- PGO (persoon)
- Bronsysteem ((zorg)aanbieder)
- Modulesysteem (persoon)

#### Systemen en systeemrollen
Deze systemen kennen ieder verschillende systeemrollen.

| Systeem | Naam systeemrol | Systeemrolcode | Omschrijving |
| --- | --- | --- | --- |
| PGO | TaakGegevensRaadplegend | PT-TGR-1.0.0-alpha.1 | Raadplegen taken bij de zorgaanbieder |
| XIS | TaakGegevensBeschikbaarstellend | PT-TGB-1.0.0-alpha.1 | Beschikbaar stellen taken aan de patiënt en verwerken van statusupdates van taken |
| Modulesysteem | DigitaleActiviteitUitvoerder | PA-DAU-1.0.0-alpha.1 | Levert de digitale activiteit, ondersteunt de uitvoering/afronding ervan, en koppelt de taakstatus terug naar het bronsysteem |

**Tabel 2: Systeemrollen**

### Ontwerp uitwisselen taken
Functioneel ontwerpprincipes

**Digitale activiteit als herbruikbare definitie**
De ActivityDefinition beschrijft de digitale activiteit als een generieke, herbruikbare definitie: wat de activiteit inhoudt en hoe deze in algemene zin uitgevoerd of gebruikt wordt (bijv. “Thuismetingen bloeddruk”). Wanneer de activiteit launchbaar is, verwijst de digitale activiteit naar één of meerdere endpoints met de technische toegangs-/launchdetails.

**Zorgopdracht in twee rollen**
Binnen Aanbiedertaken wordt de zorgopdracht in twee onderscheidende rollen gebruikt:

- *Zorgopdracht – digitaal groepsplan:* de patiënt-specifieke aanvraag waarmee een digitaal groepsplan/zorgmodule voor de patiënt wordt geïnitieerd. Deze zorgopdracht fungeert als groepering: alle taken die binnen hetzelfde groepsplan horen verwijzen naar dezelfde zorgopdracht. De naam van het digitaal groepsplan wordt in deze zorgopdracht vastgelegd en gebruikt als groepslabel in de takenlijst van de PGO.
- *Zorgopdracht – uitvoeringsopdracht:* de patiënt-specifieke uitvoeringsopdracht voor één digitale activiteit, met patiënt-specifieke instructies en het tijdschema voor de uitvoering. Een uitvoeringsopdracht wordt aan de bijbehorende taak gekoppeld. De uitvoeringsopdracht is in principe optioneel en alleen nodig wanneer er patiënt-specifieke uitvoeringsdetails zijn, maar verplicht aanwezig wanneer er een (herhalend) tijdschema voor de activiteit geldt.

**Taak als uitvoerbaar item voor de patiënt**
De Task is het item dat de patiënt in de PGO ziet en waarop de voortgang wordt bijgehouden (openstaand, in uitvoering, afgerond). Elke taak vertegenwoordigt één digitale activiteit en verwijst:

- naar de digitale activiteit (ActivityDefinition) die uitgevoerd of gestart moet worden;
- naar de gedeelde zorgopdracht (digitaal groepsplan) voor groepering met andere taken binnen hetzelfde groepsplan;
- (optioneel; verplicht bij een (herhalend) tijdschema) naar een zorgopdracht (uitvoeringsopdracht) wanneer er patiënt-specifieke uitvoeringsdetails zijn.

**Tijdschema in de uitvoeringsopdracht**
Het tijdschema beschrijft de uitvoering van een digitale activiteit gedurende een bepaalde periode of in een herhalend patroon (bijv. "2× per dag gedurende 7 dagen"). De digitale activiteit (ActivityDefinition) kan generieke timing-informatie op moduleniveau bevatten als referentie voor de zorgaanbieder, maar het patiënt-specifieke tijdschema komt altijd uit de uitvoeringsopdracht. PGO's lezen het tijdschema dat aan de patiënt getoond wordt, inclusief eventuele herhalingen, uitsluitend uit de uitvoeringsopdracht. Hiermee is er één eenduidige bron voor het tijdschema en wordt duplicatie of inconsistentie tussen resources voorkomen.

**Eén taak per digitale activiteit, geen hoofd-/subtaak hiërarchie**
Elke digitale activiteit voor de patiënt wordt gemodelleerd als één taak. Er bestaat geen hoofd-/subtaak hiërarchie tussen taken. Wanneer meerdere activiteiten bij elkaar horen, worden deze niet als subtaken gemodelleerd maar gegroepeerd via de gedeelde zorgopdracht (digitaal groepsplan). Statusupdates worden per individuele taak toegepast.

**Groepering voor overzicht en filtering**
Taken die bij elkaar horen (bijv. binnen één digitale zorgmodule zoals CVRM of Diabetes) verwijzen allemaal naar dezelfde zorgopdracht (digitaal groepsplan). PGO’s gebruiken deze gedeelde verwijzing om bij elkaar horende taken overzichtelijk onder dezelfde groep te presenteren en te filteren. De groepsnaam in de PGO is gelijk aan de naam van het digitaal groepsplan zoals vastgelegd in de bijbehorende zorgopdracht.

### Dataset
De dataset wordt beschreven in de bijbehorende Logical Models:
- LogicalModel {{pagelink: LogicalModelsIndex, text: Taak, anchor: ptlmTask}}
- LogicalModel {{pagelink: LogicalModelsIndex, text: Digitale activiteit, anchor: ptlmActivity}}
- LogicalModel {{pagelink: LogicalModelsIndex, text: Zorgopdracht – uitvoeringsopdracht, anchor: ptlmServiceRequest}}

De zorgopdracht in de rol van *digitaal groepsplan* wordt gemodelleerd op basis van dezelfde resource (ServiceRequest) en wordt in dit ontwerp functioneel beschreven via de groepering van taken; voor de technische uitwerking zie het {{pagelink: TO, text: technisch ontwerp}}.


### Transacties en transactiegroepen
Het uitwisselen van gegevens tussen de verschillende systeemrollen gebeurt op basis van transacties; een verzameling van transacties (bijvoorbeeld een vraag- en antwoordbericht) vormt een zogeheten transactiegroep. Voor de transacties die tussen de systeemrollen plaatsvinden, beschrijven de bijbehorende CIM's (impliciet) welke gegevenselementen uitgewisseld worden binnen Aanbiedertaken. Voor de technische specificaties, zie het {{pagelink: TO, text: technisch ontwerp}}.


| Transactiegroep | Transactie | Systeemrolcode | Systeem | Bedrijfsrol |
| --- | --- | --- | --- | --- |
| Verzamelen Taakgegevens (PULL) | Beschikbaar stellen Taken | PT-TGB-1.0.0-alpha.1 | XIS | Zorgaanbieder |
| Verzamelen Taakgegevens (PULL) | Raadplegen Taken | PT-TGR-1.0.0-alpha.1 | PGO | Patiënt |
| Digitale activiteit uitvoeren (LAUNCH) | Launch naar digitale activiteit | PA-DAU-1.0.0-alpha.1 | Modulesysteem | Patiënt |
| Bijwerken Taakstatus (UPDATE) | Bijwerken Taakstatus | PA-DAU-1.0.0-alpha.1 | Modulesysteem | Patiënt |
| Bijwerken Taakstatus (UPDATE) | Verwerken Taakstatus | PT-TGB-1.0.0-alpha.1 | XIS | Zorgaanbieder |

**Tabel 3: Transactiegroep**