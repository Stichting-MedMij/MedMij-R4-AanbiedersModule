---
topic: FO
---

# Functioneel ontwerp

## Algemeen
Aanbiedertaken (ProviderTasks) beschrijft de uitwisseling waarmee een zorgaanbieder patiënt-specifieke digitale activiteiten als taken beschikbaar stelt aan een patiënt, zodat de patiënt deze kan uitvoeren via een Persoonlijke Gezondheidsomgeving (PGO) of een andere eHealth-module.

ProviderTasks en Koppeltaal zijn twee afzonderlijke projecten, maar beogen in de kern hetzelfde doel: het ondersteunen van digitale zorg door het uitwisselen van taken en het kunnen uitvoeren van digitale activiteiten in de context van een behandeling. Koppeltaal richt zich hierbij op gegevens- en workflow-uitwisseling tussen o.a. EPD’s, behandel-/patiëntportalen en eHealth-modules.

Omdat beide projecten FHIR gebruiken om vergelijkbare workflowconcepten (zoals taken en digitale activiteiten) uit te wisselen, is een belangrijk onderdeel van zowel ProviderTasks als Koppeltaal het harmoniseren van de FHIR-profielen. Het doel hiervan is dat dezelfde (of zoveel mogelijk overlappende) profielen herbruikbaar zijn en consistent toegepast kunnen worden in beide projecten.

Deze Implementation Guide is specifiek voor Aanbiedertaken. Voor Koppeltaal is een aparte Implementation Guide beschikbaar via Simplifier: https://simplifier.net/Koppeltaalv2.0/~guides.

### Doelgroep
De doelgroep voor deze pagina wijkt niet af van de [algemene doelgroep](https://informatiestandaarden.nictiz.nl/wiki/MedMij:FO:V1/FunctioneelOntwerp#Doelgroep) van de functionele ontwerpen binnen MedMij.


### Uitgangspunten
- De uitwisseling is gebaseerd op het MedMij-afsprakenstelsel en op (geharmoniseerde) FHIR-profielen die worden toegepast binnen Aanbiedertaken en Koppeltaal.
- De zorgaanbieder initieert één of meerdere digitale activiteiten voor een patiënt.
- De patiënt ziet de taken in de PGO als takenlijst en kan vanuit de PGO een externe module/applicatie starten om een taak uit te voeren. De takenlijst bevat zowel openstaande taken, maar kan daarnaast ook afgeronde taken tonen.
- Digitale activiteiten kunnen verschillende typen hebben, zoals informatie bekijken, een vragenlijst invullen of thuismetingen uitvoeren.


### Richtlijn en proces
Dit ontwerp is conform specificaties genoemd in [de algemene inleiding](https://informatiestandaarden.nictiz.nl/wiki/MedMij:V2020.01/Ontwerpen#Richtlijn) van de functionele ontwerpen binnen MedMij.


### Reikwijdte
De reikwijdte van dit ontwerp beslaat:
- de functionele beschrijving van het uitwisselen van patient-specifieke digitale activiteiten (taken) die door de zorgaanbieder worden aangevraagd en via Aanbiedertaken beschikbaar worden gesteld;
- de bijbehorende dataset (Logical Models) die nodig is voor deze uitwisseling, inclusief de relaties tussen de zorgopdracht (ServiceRequest), de taak (Task) en de digitale activiteit (ActivityDefinition).


### Infrastructuur
Geen nadere specificatie, anders dan genoemd in de [de algemene inleiding](https://informatiestandaarden.nictiz.nl/wiki/MedMij:FO:V1/FunctioneelOntwerp#Infrastructuur) van de functionele ontwerpen binnen MedMij.


### Geografische reikwijdte
Geen nadere specificatie, anders dan genoemd in [de algemene inleiding](https://informatiestandaarden.nictiz.nl/wiki/MedMij:V2020.02/Ontwerpen#Geografische_reikwijdte) van de MedMij functionele ontwerpen.


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
- het volgen van voortgang (op hoofdlijnen) via statusinformatie;


#### Patient journey Aanbiedertaken
De patient journey beschrijft momenten waarop de patiënt inzicht kan of wil hebben in de digitale activiteiten:

Ontvangst:
- De patiënt ontvangt een melding (via mail) dat er een digitale activiteit klaarstaat: “Meet je bloeddruk 2× per dag gedurende 7 dagen”.

Takenlijst raadplegen:
- De patiënt opent de PGO en raadpleegt de takenlijst. Per taak ziet de patiënt de taakomschrijving, status en uitvoerperiode.

Starten van de activiteit:
- De patiënt start de digitale activiteit vanuit de PGO, door een externe module/applicatie te openen (“Start module”). Hiermee wordt de uitvoering van de activiteit gestart in een externe applicatie met de juiste context.

Uitvoering:
- De patiënt voert één of meerdere taken uit in de externe module/applicatie.

Terugkoppeling:
- Na het uitvoeren van de digitale activiteit gaat de patiënt terug naar de PGO. De status van de taak (en eventuele subtaken) wordt bijgewerkt in het bronsysteem, zodat de voortgang en afronding zichtbaar zijn in de takenlijst. Het terugkoppelen van inhoudelijke resultaten (zoals de beantwoording van een vragenlijst) valt in deze versie buiten scope. De focus ligt op de taken en de workflow zelf.



### Procesbeschrijving Aanbiedertaken

#### Precondities
- De patiënt beschikt over een PGO die voldoet aan de MedMij-eisen.
- De patiënt heeft toestemming gegeven voor elektronische uitwisseling van gegevens tussen zorgaanbieder en PGO.
- De patiënt is bekend in het bronsysteem en er is een behandelrelatie.
 

#### Proces
1. Selectie digitale activiteit (module):
- Zorgaanbieder selecteert een digitale activiteit die past bij het zorgproces (bijv. CVRM/diabetes/COPD). 

2. Aanmaken en beschikbaar stellen van taken:
- Het bronsysteem maakt één of meerdere Task resources aan en stelt deze beschikbaar aan de patiënt, inclusief:
	- een koppeling naar de digitale activiteit (ActivityDefinition);
	- één taak (of meerdere taken) die de patiënt in de PGO ziet;
	- optioneel zijn reperterende subtaken (bijv. losse meetmomenten), gekoppeld aan een hoofdtaak;
	- een uitvoerdatum/uitvoerperiode, indien van toepassing;
	- patiënt-specifieke instructies via een zorgopdracht (ServiceRequest), die aan de taak is gekoppeld, indien van toepassing.

3. Patiënt informeren:
- De patiënt wordt geïnformeerd (bijv. per e-mail) dat er een nieuwe taak klaarstaat in de PGO.

4. Raadplegen door patiënt:
- De patiënt raadpleegt de takenlijst in de PGO. De patiënt kan taken filteren (bijv. per “zorgmodule”) op basis van contextinformatie.

5. Uitvoering:
- De patiënt start de digitale activiteit vanuit de PGO (launch naar de module/applicatie) en voert de activiteit uit in de externe applicatie. 

6. Statusupdates:
- De status van de taak (en eventuele subtaken) wordt bijgewerkt in het bronsysteem, zodat voortgang en afronding zichtbaar zijn in de takenlijst voor de zorgaanbieder en patiënt. De patiënt kan op elk moment de takenlijst opnieuw ophalen.


#### Postconditie
- De patiënt heeft één of meerdere taken uitgevoerd en/of afgerond (status bijgewerkt).
- De zorgaanbieder kan (op hoofdlijnen) de voortgang volgen via de (bijgewerkte) status van taken.


### Bedrijfsrollen
Deze usecase onderscheidt twee bedrijfsrollen, namelijk de Persoon en de (Zorg)Aanbieder zoals te zien in onderstaande tabel.

| Bedrijfsrol (actor) | Beschrijving bedrijfsrol |
| --- | --- |
| Patiënt | Gebruiker van de PGO |
| Zorgaanbieder | Gebruiker van het bronsysteem |

**Tabel 1 Bedrijfsrollen**

### Informatieoverdracht
Zowel de persoon als de (zorg)aanbieder maken ieder gebruik van een informatiesysteem:
- PGO (persoon)
- Bronsysteem ((zorg)aanbieder)
- Aanbiedertaken (persoon)


#### Systemen en systeemrollen
Deze systemen kennen ieder verschillende systeemrollen.

| Systeem | Naam systeemrol | Systeemrolcode | Omschrijving |
| --- | --- | --- | --- |
| PGO | TaakGegevensRaadplegend | PT-1.0.0-alpha.1-TGR-FHIR | Raadplegen taken bij de zorgaanbieder|
| XIS| TaakGegevensBeschikbaarstellend | PT-1.0.0-alpha.1-TGB-FHIR | Beschikbaar stellen taken aan de patiënt |
| Modulesysteem | DigitaleActiviteitUitvoerder | PA-1.0.0-alpha.1-DAU-FHIR | Levert de digitale activiteit en ondersteunt de uitvoering/afronding van de activiteit |

**Tabel 2 Systeemrol**

### Ontwerp uitwisselen taken
Functioneel ontwerpprincipes

**Digitale activiteit als herbruikbare definitie**
De ActivityDefinition beschrijft de digitale activiteit als een generieke instructie/definitie: wat de activiteit inhoudt en hoe deze in algemene zin uitgevoerd of gebruikt wordt (bijv. “Thuismetingen bloeddruk”)

**Zorgopdracht als patiënt-specifieke aanvraag**
Een ServiceRequest wordt gebruikt wanneer er patiënt-specifieke instructies nodig zijn die afwijken van of aanvullend zijn op de generieke informatie in de ActivityDefinition. 

**Taak als uitvoerbaar item voor de patiënt**
De Task is het item dat de patiënt in de PGO ziet en waarop de voortgang wordt bijgehouden (openstaand, in uitvoering, afgerond). Een Task kan verwijzen naar de bijbehorende zorgopdracht.

**Subtaken voor herhaling binnen één activiteit**
Wanneer een activiteit uit meerdere herhaalmomenten of deelstappen bestaat (bijv. losse meetmomenten), worden deze gemodelleerd als subtaken en gekoppeld aan een hoofdtaak. Subtaken worden alleen gebruikt voor herhaling binnen dezelfde digitale activiteit.

**Groepering voor overzicht en filtering**
Taken die bij elkaar horen (bijv. binnen één digitale zorgmodule zoals CVRM of Diabetes) worden gegroepeerd met groupIdentifier, zodat PGO’s taken overzichtelijk kunnen presenteren en filteren.


### Dataset
De dataset wordt beschreven in de bijbehorende Logical Models:
- LogicalModel [Taak](https://simplifier.net/medmij-r4-provider-module/lmtask)
- LogicalModel [Digitale activiteit](https://simplifier.net/medmij-r4-provider-module/lmactivitydefinition)
- LogicalModel [Zorgopdracht](https://simplifier.net/medmij-r4-provider-module/lmservicerequest)
- LogicalModel [Patient](https://simplifier.net/medmij-r4-provider-module/lmpatient)


### Transacties en transactiegroepen
Het uitwisselen van gegevens tussen de verschillende systeemrollen gebeurt op basis van transacties, een verzameling van transacties (bijvoorbeeld een vraag- en antwoordbericht) vormt een zogeheten transactiegroep. Voor de transacties die tussen de systeemrollen plaatsvinden, beschrijven de bijbehorende CIM's (impliciet) welke gegevenselementen uitgewisseld worden binnen Mondzorg. Voor de technische specificaties, zie het [technisch ontwerp](https://simplifier.net/guide/medmij-r4-provider-module-ig/Home/Technical-design.md?version=current)


| Transactiegroep | Transactie | Systeemrolcode | Systeem | Bedrijfsrol |
| --- | --- | --- | --- | --- |
| Verzamelen Taakgegevens (PULL) | Beschikbaar stellen Taken | PT-1.0.0-alpha.1-TGR-FHIR | XIS | Zorgaanbieder |
| Verzamelen Taakgegevens (PULL) | Raadplegen Taken | PT-1.0.0-alpha.1-TGB-FHIR | PGO | Patiënt |
| Digitale activiteit uitvoeren (LAUNCH) | Launch naar digitale activiteit| PA-1.0.0-alpha.1-DAU-FHIR | Modulesysteem | Patiënt |

**Tabel 3 Transactiegroep**

De onderstaande tabel geeft een overzicht van alle gegevensdiensten die van toepassing zijn voor AanbiedersTaken. 

| Id | Gegevensdienstnaam zonder versie | Versie |
| --- | --- | --- | --- |
| 301 | [Verzamelen - Taken](https://simplifier.net/guide/medmij-r4-provider-module-ig/Home/Artifact-index/FHIR-Profiles?version=current#ptTask) | 1.0.0-alpha.1 |

**Tabel 4: Gegevensdiensten relevant voor AanbiedersTaken**

### Weergaverichtlijn

#### Scope weergaverichtlijn 
De richtlijn geeft handvatten voor:
- het gebruik van patiëntvriendelijke termen en toelichting;
- de inhoud van het overzicht van taken in de PGO.

De richtlijn geeft géén handvatten voor de vormgeving (kleur, vorm, lettertype, etc.) van taken. 

#### Inhoud weergaverichtlijn
De weergaverichtlijn maakt nog geen onderdeel uit van deze alpha-versie. Deze wordt toegevoegd en gepubliceerd bij de beta-versie.