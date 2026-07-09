---
topic: FO
---

# Functioneel ontwerp

## Algemeen
Aanbiedertaken beschrijft de uitwisseling waarmee een zorgaanbieder patiëntspecifieke digitale activiteiten als taken beschikbaar stelt aan een patiënt, zodat de patiënt deze kan uitvoeren via een Persoonlijke Gezondheidsomgeving (PGO) of een andere eHealth-module.

Aanbiedertaken en Koppeltaal zijn als afzonderlijke projecten ingericht omdat ze ieder een eigen domein, doelgroep en afsprakenkader bedienen:

- Aanbiedertaken valt binnen het MedMij-domein en betreft de uitwisseling tussen zorgaanbieder en patiënt: de zorgaanbieder zet digitale activiteiten uit, de patiënt raadpleegt en start deze via een PGO.
- Koppeltaal richt zich op gegevensuitwisseling en workflows tussen zorginformatiesystemen onderling, onder andere EPD's, behandel-/patiëntportalen en eHealth-modules, in de context van een behandeling.

In de kern beogen beide projecten echter hetzelfde: het ondersteunen van digitale zorg door het uitwisselen van taken en het kunnen uitvoeren van digitale activiteiten in de context van een behandeling. Het naast elkaar bestaan van twee projecten weerspiegelt dus niet twee verschillende doelen, maar twee verschillende contexten waarin dat doel wordt gerealiseerd.

Deze Implementation Guide is specifiek voor Aanbiedertaken. Voor Koppeltaal is een aparte Implementation Guide beschikbaar via [Simplifier](https://simplifier.net/packages/Koppeltaalv2.00/0.16.2).

Merk op dat naast dit ontwerp ook de (functionele) eisen en richtlijnen beschreven in de [MedMij R4 Core IG](https://simplifier.net/guide/medmij-r4-core-ig?version=1.0.1) en het door Nictiz gepubliceerde [Functioneel ontwerp](https://informatiestandaarden.nictiz.nl/wiki/MedMij:FO:V1/FunctioneelOntwerp) van toepassing zijn.

### Doelgroep
De doelgroep voor deze pagina wijkt niet af van de [algemene doelgroep](https://informatiestandaarden.nictiz.nl/wiki/MedMij:FO:V1/FunctioneelOntwerp#Doelgroep) van de functionele ontwerpen binnen MedMij.


### Uitgangspunten
- De uitwisseling is gebaseerd op het MedMij Afsprakenstelsel.
- De zorgaanbieder initieert één of meerdere digitale activiteiten voor een patiënt.
- De patiënt ziet de taken in de PGO als takenlijst en kan vanuit de PGO een externe module/applicatie starten om een taak uit te voeren. De takenlijst bevat openstaande taken en kan daarnaast ook afgeronde taken tonen.
- Digitale activiteiten kunnen verschillende typen hebben, zoals informatie bekijken, een vragenlijst invullen of thuismetingen uitvoeren.


### Richtlijn en proces
Dit ontwerp is conform specificaties genoemd in [de algemene inleiding](https://informatiestandaarden.nictiz.nl/wiki/MedMij:V2020.01/Ontwerpen#Richtlijn) van de functionele ontwerpen binnen MedMij.


### Reikwijdte
De reikwijdte van dit ontwerp beslaat:
- de functionele beschrijving van het uitwisselen van patiëntspecifieke digitale activiteiten (taken) die door de zorgaanbieder worden aangevraagd en via Aanbiedertaken beschikbaar worden gesteld;
- de bijbehorende dataset (Logical Models) die nodig is voor deze uitwisseling, inclusief de relaties tussen de digitale activiteit, het digitaal groepsplan, de uitvoeringsopdracht en de taak;
- het bijwerken van de status van een taak vanuit het modulesysteem naar het XIS.


Buiten scope van deze versie:
- het uitwisselen van inhoudelijke resultaten die ontstaan bij het uitvoeren van een digitale activiteit (zoals meetwaarden of vragenlijstantwoorden).


### Infrastructuur
Geen nadere specificatie, anders dan genoemd in [de algemene inleiding](https://informatiestandaarden.nictiz.nl/wiki/MedMij:FO:V1/FunctioneelOntwerp#Infrastructuur) van de functionele ontwerpen binnen MedMij.


### Geografische reikwijdte
Geen nadere specificatie, anders dan genoemd in [de algemene inleiding](https://informatiestandaarden.nictiz.nl/wiki/MedMij:FO:V1/FunctioneelOntwerp#Geografische_reikwijdte) van de MedMij functionele ontwerpen.


### Kwalificatie en testen
Op dit moment wordt de usecase uit dit ontwerp getoetst in een Proof of Concept (PoC). Later volgt meer informatie over kwalificatie.

In de alpha-testfase vindt geïsoleerd testen plaats met behulp van MedMij-simulatoren. Deze simulatoren simuleren de relevante systeemrollen (PGO en XIS) en ondersteunen leveranciers bij het zowel functioneel als technisch valideren van de uitwisseling.

De simulatoren voeren geautomatiseerde validaties uit om te bepalen of een leverancier implementeert conform de geldende specificaties, waaronder de afspraken zoals beschreven in deze IG (en de van toepassing zijnde MedMij-richtlijnen). De uitkomsten van deze validaties geven inzicht in conformiteit en eventuele afwijkingen, en vormen input voor door te voeren correcties voordat vervolgtesten (bijv. ketentesten) plaatsvinden.

## Usecases

### Algemeen
Binnen Aanbiedertaken stelt de zorgaanbieder patiëntspecifieke digitale activiteiten beschikbaar aan de patiënt via de PGO. Een digitale activiteit kan bijvoorbeeld bestaan uit het lezen van informatie, het invullen van een vragenlijst of het uitvoeren van thuismetingen.

Het proces is als volgt:
- De zorgaanbieder selecteert een passende digitale activiteit (module) voor het zorgproces.
- De zorgaanbieder vraagt deze activiteit aan voor een specifieke patiënt.
- Het XIS maakt vervolgens één of meerdere taken aan die in de PGO zichtbaar worden.
- De patiënt ontvangt en raadpleegt deze taken in de PGO en kan de activiteit uitvoeren (bijvoorbeeld door een externe module te starten).


### Usecase: Aanbiedertaken

#### Doel en relevantie uitwisselen taken
Voor de patiënt is het doel om in de PGO inzicht te hebben in:
- welke digitale activiteiten door de zorgaanbieder zijn aangevraagd;
- welke taken daarbij horen, inclusief planning en actuele status/voortgang;
- wat er van de patiënt wordt verwacht (omschrijving en eventuele instructies).

Voor de zorgaanbieder is het doel:
- het betrouwbaar kunnen uitzetten van digitale activiteiten;
- het volgen van voortgang (op hoofdlijnen) via statusinformatie.


#### Patiëntreis
De patiëntreis beschrijft momenten waarop de patiënt inzicht kan of wil hebben in de digitale activiteiten:

- De patiënt ontvangt een melding (via mail) dat er een digitale activiteit klaarstaat: "Meet je bloeddruk 2× per dag gedurende 7 dagen".
- De patiënt opent de PGO en raadpleegt de takenlijst. Per taak ziet de patiënt de taakomschrijving, de status en het tijdschema voor uitvoering (inclusief eventuele herhalingen, zoals afgeleid uit de uitvoeringsopdracht).
- De patiënt start de digitale activiteit vanuit de PGO, door een externe module/applicatie te openen ("Start module"). Hiermee wordt de uitvoering van de activiteit gestart in een externe applicatie met de juiste context.
- De patiënt voert één of meerdere taken uit in de externe module/applicatie.
- Na het uitvoeren van de digitale activiteit gaat de patiënt terug naar de PGO. De status van de taak wordt bijgewerkt in het XIS, zodat de voortgang en afronding zichtbaar zijn in de takenlijst. Het terugkoppelen van inhoudelijke resultaten (zoals de beantwoording van een vragenlijst) valt in deze versie buiten scope.


#### Procesbeschrijving

##### Precondities
- De patiënt beschikt over een PGO die voldoet aan de MedMij-eisen.
- De patiënt heeft toestemming gegeven voor elektronische uitwisseling van gegevens tussen zorgaanbieder en PGO.
- De patiënt is bekend in het XIS en er is een behandelrelatie.

##### Proces
- Zorgaanbieder selecteert een digitale activiteit die past bij het zorgproces (bijv. CVRM/diabetes/COPD).
- Het XIS maakt per digitale activiteit één taak aan en stelt deze beschikbaar aan de patiënt. Wanneer meerdere digitale activiteiten in samenhang worden aangevraagd (bijv. binnen één digitale zorgmodule), worden de bijbehorende taken gegroepeerd via een gedeeld digitaal groepsplan. Per taak worden de volgende relaties en gegevens vastgelegd:
	- een koppeling naar de digitale activiteit waarop de taak is gebaseerd;
	- het gedeelde digitaal groepsplan waaraan de taak is gekoppeld voor groepering;
	- patiëntspecifieke uitvoeringsinstructies en/of het tijdschema voor de uitvoering van de activiteit, vastgelegd in een uitvoeringsopdracht die aan de taak is gekoppeld. Een uitvoeringsopdracht is in principe optioneel, maar verplicht aanwezig wanneer er een (herhalend) tijdschema voor de activiteit geldt (bijv. "2× per dag gedurende 7 dagen").
- De patiënt wordt geïnformeerd (bijv. per e-mail) dat er een nieuwe taak klaarstaat in de PGO.
- De patiënt raadpleegt de takenlijst in de PGO. De patiënt kan taken filteren (bijv. per zorgmodule) op basis van contextinformatie.
- De patiënt start de digitale activiteit vanuit de PGO (launch naar de module/applicatie) en voert de activiteit uit in de externe applicatie.
- Het modulesysteem werkt de status van de individuele taak bij in het XIS (bijv. naar 'in uitvoering' of 'afgerond'), zodat voortgang en afronding zichtbaar zijn in de takenlijst voor de zorgaanbieder en patiënt. De patiënt kan op elk moment de takenlijst opnieuw ophalen.

##### Postconditie
- De patiënt heeft één of meerdere taken gestart en/of afgerond.
- Het modulesysteem heeft de status bijgewerkt.
- De zorgaanbieder kan (op hoofdlijnen) de voortgang volgen via de (bijgewerkte) status van taken.

### Bedrijfsrollen
Deze usecase onderscheidt twee bedrijfsrollen, namelijk de Patiënt en de Zorgaanbieder, zoals te zien in onderstaande tabel.

| Bedrijfsrol (actor) | Beschrijving bedrijfsrol |
| --- | --- |
| Patiënt | Gebruiker van de PGO en het modulesysteem |
| Zorgaanbieder | Gebruiker van het XIS |

**Tabel 1: Bedrijfsrollen**

### Informatieoverdracht
Zowel de patiënt als de zorgaanbieder maken ieder gebruik van een informatiesysteem:
- PGO (patiënt)
- XIS (zorgaanbieder)
- Modulesysteem (patiënt)

#### Systemen en systeemrollen
Deze systemen kennen ieder verschillende systeemrollen.

| Systeem | Naam systeemrol | Systeemrolcode | Omschrijving |
| --- | --- | --- | --- |
| PGO | TaakgegevensRaadplegend | PT-TGR-1.0.0-alpha.1 | Raadplegen taken bij de zorgaanbieder |
| XIS | TaakgegevensBeschikbaarstellend | PT-TGB-1.0.0-alpha.1 | Beschikbaar stellen taken aan de patiënt en verwerken van statusupdates van taken |
| Modulesysteem | DigitaleActiviteitUitvoerder | PA-DAU-1.0.0-alpha.1 | Levert de digitale activiteit, ondersteunt de uitvoering/afronding ervan, en koppelt de taakstatus terug naar het XIS |

**Tabel 2: Systeemrollen**

### Ontwerp uitwisselen taken
De volgende functionele ontwerpprincipes zijn gehanteerd binnen Aanbiedertaken:

**Digitale activiteit als herbruikbare definitie**  
De digitale activiteit beschrijft wat een activiteit inhoudt en hoe deze in algemene zin uitgevoerd of gebruikt wordt (bijv. "Thuismetingen bloeddruk"). Wanneer de activiteit launchbaar is, verwijst de digitale activiteit naar één of meerdere endpoints met de technische toegangs-/launchdetails.

**Digitaal groepsplan en uitvoeringsopdracht**  
Binnen Aanbiedertaken worden twee soorten zorgopdrachten onderscheiden:

- Digitaal groepsplan: de patiëntspecifieke aanvraag waarmee een digitaal groepsplan/zorgmodule voor de patiënt wordt geïnitieerd. Alle taken die binnen hetzelfde groepsplan horen, verwijzen naar hetzelfde digitaal groepsplan. De naam van het digitaal groepsplan wordt vastgelegd en gebruikt als groepslabel in de takenlijst van de PGO.
- Uitvoeringsopdracht: de patiëntspecifieke uitvoeringsopdracht voor één digitale activiteit, met patiëntspecifieke instructies en het tijdschema voor de uitvoering. Een uitvoeringsopdracht wordt aan de bijbehorende taak gekoppeld. De uitvoeringsopdracht is in principe optioneel en alleen nodig wanneer er patiëntspecifieke uitvoeringsdetails zijn, maar verplicht aanwezig wanneer er een (herhalend) tijdschema voor de activiteit geldt.

**Taak als uitvoerbaar item voor de patiënt**  
De taak is het item dat de patiënt in de PGO ziet en waarop de voortgang wordt bijgehouden (openstaand, in uitvoering, afgerond). Elke taak vertegenwoordigt één digitale activiteit en verwijst naar de digitale activiteit die uitgevoerd of gestart moet worden, naar het gedeelde digitaal groepsplan voor groepering met andere taken binnen hetzelfde groepsplan, en (optioneel; verplicht bij een (herhalend) tijdschema) naar een uitvoeringsopdracht wanneer er patiëntspecifieke uitvoeringsdetails zijn.

**Tijdschema in de uitvoeringsopdracht**  
Het tijdschema beschrijft de uitvoering van een digitale activiteit gedurende een bepaalde periode of in een herhalend patroon (bijv. "2× per dag gedurende 7 dagen"). De digitale activiteit kan generieke timing-informatie op moduleniveau bevatten als referentie voor de zorgaanbieder, maar het patiëntspecifieke tijdschema komt altijd uit de uitvoeringsopdracht. PGO's lezen het tijdschema dat aan de patiënt getoond wordt, inclusief eventuele herhalingen, uitsluitend uit de uitvoeringsopdracht. Hiermee is er één eenduidige bron voor het tijdschema en wordt duplicatie of inconsistentie voorkomen.

**Eén taak per digitale activiteit, geen hiërarchische onderverdeling**  
Elke digitale activiteit voor de patiënt wordt gemodelleerd als één taak. Er bestaat geen hiërarchische onderverdeling in hoofd- en subtaken. Wanneer meerdere activiteiten bij elkaar horen, worden deze gegroepeerd via het gedeelde digitaal groepsplan. Statusupdates worden per individuele taak toegepast.

**Groepering voor overzicht en filtering**  
Taken die bij elkaar horen (bijv. binnen één digitale zorgmodule zoals CVRM of Diabetes) verwijzen allemaal naar hetzelfde digitaal groepsplan. PGO's gebruiken deze gedeelde verwijzing om bij elkaar horende taken overzichtelijk onder dezelfde groep te presenteren en te filteren. De groepsnaam in de PGO is gelijk aan de naam van het digitaal groepsplan.

### Dataset
De dataset is uitgewerkt aan de hand van Logical Models:

- LogicalModel {{pagelink: LogicalModelsIndex, text: Taak, anchor: ptlmTask}}
- LogicalModel {{pagelink: LogicalModelsIndex, text: Digitale activiteit, anchor: ptlmDigitalActivity}}
- LogicalModel {{pagelink: LogicalModelsIndex, text: Digitaal groepsplan, anchor: ptlmDigitalGroupPlan}}
- LogicalModel {{pagelink: LogicalModelsIndex, text: Uitvoeringsopdracht, anchor: ptlmExecutionOrder}}


### Transacties en transactiegroepen
Het uitwisselen van gegevens tussen de verschillende systeemrollen gebeurt op basis van transacties; een verzameling van transacties (bijvoorbeeld een vraag- en antwoordbericht) vormt een zogeheten transactiegroep. Voor de technische specificaties, zie het {{pagelink: TO, text: technisch ontwerp}}.

Het modulesysteem voert namens de patiënt de launch en statusupdate uit; de patiënt start de activiteit via de PGO, waarna het modulesysteem de uitvoering ondersteunt en de taakstatus terugkoppelt naar het XIS.


| Transactiegroep | Transactie | Systeemrolcode | Systeem | Bedrijfsrol |
| --- | --- | --- | --- | --- |
| Verzamelen Taakgegevens (PULL) | Beschikbaar stellen Taken | PT-TGB-1.0.0-alpha.1 | XIS | Zorgaanbieder |
| Verzamelen Taakgegevens (PULL) | Raadplegen Taken | PT-TGR-1.0.0-alpha.1 | PGO | Patiënt |
| Digitale activiteit uitvoeren (LAUNCH) | Launch naar digitale activiteit | PA-DAU-1.0.0-alpha.1 | Modulesysteem | Patiënt |
| Bijwerken Taakstatus (UPDATE) | Bijwerken Taakstatus | PA-DAU-1.0.0-alpha.1 | Modulesysteem | Modulesysteem |
| Bijwerken Taakstatus (UPDATE) | Verwerken Taakstatus | PT-TGB-1.0.0-alpha.1 | XIS | Zorgaanbieder |

**Tabel 3: Transactiegroepen**
