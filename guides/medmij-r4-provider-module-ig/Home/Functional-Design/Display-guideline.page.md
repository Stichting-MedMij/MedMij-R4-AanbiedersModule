---
topic: Weergaverichtlijn
---

# Weergaverichtlijn

## Inleiding
Dit is de weergaverichtlijn voor de gegevensdienst Aanbiedertaken (ProviderTasks).

De richtlijn bevat mock-ups die bedoeld zijn ter inspiratie. Persoonlijke gezondheidsomgevingen (PGO's) kunnen deze voorbeelden naar eigen inzicht visueel vormgeven, zolang de gebruiksvriendelijkheid behouden blijft.

## Doel
Deze richtlijn heeft als doel om duidelijke handvatten te bieden voor een patiëntvriendelijke en begrijpelijke weergave van aanbiedertaken in de PGO. De richtlijn ondersteunt ontwikkelaars en zorgverleners bij het:
- gebruiken van begrijpelijke en patiëntvriendelijke termen en toelichtingen;
- structureren en presenteren van een overzicht van gegevens op een manier die aansluit bij de informatiebehoefte van PGO-gebruikers.

De richtlijn geeft géén handvatten voor de vormgeving (kleur, vorm, lettertype, etc.) van gegevens. Ook geeft de richtlijn géén handvatten voor de flow, het synchroniseren of het ophalen van gegevens en de technische launch van een aanbiedermodule. Voor die onderwerpen wordt verwezen naar het Solution Design en de FHIR implementation guide.

## Scope
De scope van deze richtlijn bestaat uit de aanbiedertaak-gegevens die worden weergegeven in de PGO. Gegevens die via andere MedMij-gegevensdiensten verzameld worden in de PGO zijn hierin niet meegenomen.

Onderwerpen die buiten de scope van deze richtlijn vallen:
- Inloggen en authenticeren bij de zorgaanbieder.
- Het synchroniseren of incrementeel ophalen van taken (inclusief waarschuwingen bij verouderde gegevens en aanbevelingen rondom langdurige toestemming).
- Het starten/launchen van een aanbiedermodule

## Inhoud richtlijn
Om taken in te zien, navigeert de gebruiker in de PGO naar het takenoverzicht. Vanuit dit overzicht kan de gebruiker een specifieke taak openen om de bijbehorende details te bekijken. Deze richtlijn beschrijft hoe het overzichtsscherm en het detailscherm vormgegeven kunnen worden, en geeft aanbevelingen voor de weergave van de afzonderlijke datavelden.

Het overzichts- en detailscherm worden geïllustreerd met mock-ups, die ter inspiratie dienen. De aanbevelingen voor de afzonderlijke datavelden zijn uitgewerkt in een specificatietabel, gebaseerd op het Logical Model (LM).

### Overzichtsscherm aanbiedertaken
Er zijn twee weergaven gedefinieerd voor het overzicht van de aanbiedertaken:
- Scenario 1: Overzicht taken (met alle aanbiedertaken van alle zorgaanbieders in één overzicht)
- Scenario 2: Overzicht taken per zorgaanbieder (met alle aanbiedertaken van één zorgaanbieder in één overzicht). Dit scenario is optioneel, omdat het uitgangspunt is dat de taken van alle zorgaanbieders worden getoond.

Het scenario, hieronder uitgewerkt, geeft weer hoe een UX-design getoond kan worden. Een PGO is vrij om scenario 2 te ondersteunen. 

### Mock-ups overzichtsschermenen aanbiedertaken
<u>Overzicht taken</u>

In het overzicht taken heeft het overzichtsscherm één pagina waar de datavelden getoond worden, voor alle zorgaanbieders.

Het overzichtsscherm bestaat uit twee secties (deze mogen ook tabs zijn): een statussectie en een sectie met de afzonderlijke taken en bijhorende digitale activiteiten. 

{{render: guides/medmij-r4-provider-module-ig/images/overzichtsschermTaken.png}}

**Figuur 1: Voorbeeld Overzicht taken**

<u>Overzicht taken per zorgaanbieder</u>

{{render: guides/medmij-r4-provider-module-ig/images/overzichttakenperzorgaanbieder.png}}

**Figuur 2: Voorbeeld Overzicht taken per zorgaanbieder**


#### Groeperen taken per status
De afzonderlijke taken worden gegroepeerd in drie groepen:
1. Te doen ( FHIR-status: `ready`, `requested`, `received`, `in-progress`)
2. Gereed (FHIR-status: `completed`)
3. Gestopt (FHIR-status: `failed`, `cancelled`)


De acceptatiecriteria voor het overzichtsscherm zijn als volgt.

| Nr | Acceptatiecriteria |
| --- | --- |
| 1 | Standaard worden alle gegevens van de geraadpleegde zorgaanbieder(s) overzichtelijk weergegeven, gesorteerd op datum. Het overzichtsscherm opent met het filter "te doen". Wanneer er geen open taken zijn, wordt een passende melding getoond (bijvoorbeeld "Er zijn geen nieuwe taken"). |
| 2 | Je kunt zoeken op (delen van) de gegevens of op informatie uit de andere datavelden in het overzichtsscherm. Het bepalen van een eventuele drempel voor het aantal in te voeren karakters is aan de PGO (advies: maximaal drie karakters). Het zoekveld is met name relevant voor het tabblad met afgehandelde taken (historie). |
| 3 | Voor de datavelden in het overzichtsscherm is het mogelijk om te filteren op één of meerdere waarden. Filteren op `Task.description` is niet voorzien. Voor het datumveld geldt criterium 4. |
| 4 | Voor het datumveld in het overzichtsscherm kun je een specifieke periode selecteren. |
| 5 | Alle datavelden in het overzichtsscherm (met uitzondering van `Task.description`) zijn sorteerbaar. |
| 6 | De datavelden in het overzichtsscherm zijn begrijpelijk en gebruiksvriendelijk geformuleerd. Zie de {{pagelink: Weergaverichtlijn, text: Tabel met specificaties, anchor: TabelSpecificaties}} voor de aanbevolen termen per opgehaald dataveld. |
| 7 | De standaard sortering van de open taken is: eerst uit te voeren taak bovenaan. De standaard sortering van de afgeronde en gestopte taken is: meest recent uitgevoerde taak bovenaan. |
| 8 | De PGO toont in elk geval de datavelden met prioriteit M (must have) uit de specificatietabel. De PGO is vrij om aanvullende velden te tonen of deze (uitsluitend) in het detailscherm op te nemen. Lege velden hoeven niet getoond te worden. |

### Detailscherm aanbiedertaken
Dit detailscherm krijgt een PGO-gebruiker te zien na het selecteren van een specifieke regel in het overzichtsscherm. De in de mock-up weergegeven gegevens dienen uitsluitend ter demonstratie.

#### Mock-ups detailscherm aanbiedertaken

{{render: guides/medmij-r4-provider-module-ig/images/detailscherm1.png}}

{{render: guides/medmij-r4-provider-module-ig/images/detailscherm2.png}}

{{render: guides/medmij-r4-provider-module-ig/images/detailscherm3.png}}

**Figuur 3: Voorbeeld detailschermen**

In het detailscherm zijn de volgende velden zichtbaar:
- `Task.status`
- `Task.requester.practitionerRole.organization.name`
- `Task.requester.practitionerRole.practitioner.name`
- `Task.description`
- `Task.executionPeriod.start`
- `Task.executionPeriod.end`
- `ActivityDefinition.title`
- `ServiceRequest.patientInstruction` (alleen indien er een patiëntspecifieke instructie bestaat)


De patiëntinstructie is een specifieke instructie voor de patiënt. Deze instructie kan door de zorgverlener worden ingevoerd bij het klaarzetten van de digitale activiteit voor de patiënt. Algemene instructies horen in de module zichtbaar te zijn en zijn daarom geen onderdeel van deze weergaverichtlijn. De patiëntinstructie is niet altijd aanwezig.

Niet alle bovenstaande velden hoeven in het overzichtsscherm getoond te worden. Welke velden minimaal getoond moeten worden, blijkt uit de prioritering (MoSCoW) in de {{pagelink: Weergaverichtlijn, text: Tabel met specificaties, anchor: TabelSpecificaties}}. Lege velden hoeven niet getoond te worden. 

### Aanbiedertaakgegevens
Hieronder wordt een voorbeeld in tabelvorm gegeven van het overzichts- en detailscherm voor een taak met een digitale activiteit.

<u>Overzichtsscherm</u>

| Titel | Status | Periode | Zorgorganisatie | Toelichting | Digitale zorgmodule |
| --- | --- | --- | --- | --- | -- |
| Gezonder gaan leven | Aangevraagd | 22-12-2025 t/m 28-12-2025 | Huisartsenpraktijk de Haard | Leestips voor een gezondere leefstijl. | Digitale zorgmodule Diabetes |
| Bloedglucose meting volgens NHG protocol | In uitvoering | 22-12-2025 t/m 28-12-2025 | Huisartsenpraktijk de Haard | Meet je bloedglucose (in de ochtend nuchter en in de avond voor het eten) en noteer de waarde in de app | Digitale zorgmodule Diabetes |

<u>Detailscherm</u>

| Geselecteerde regel: Gezonder gaan leven | |
| --- | --- |
| Titel | Gezonder gaan leven |
| Status | Aangevraagd |
| Periode | 22-12-2025 t/m 28-12-2025 |
| Zorgverlener | A. de Haard |
| Zorgorganisatie | Huisartsenpraktijk de Haard |
| Patiëntinstructie | n.v.t. |

| Geselecteerde regel: Bloedglucose meting volgens NHG protocol | |
| --- | --- |
| Titel | Bloedglucose meting volgens NHG protocol |
| Status | In uitvoering |
| Periode | 22-12-2025 t/m 28-12-2025 |
| Zorgverlener | A. de Haard |
| Zorgorganisatie | Huisartsenpraktijk de Haard |
| Patiëntinstructie | Meet 7 dagen, 2 keer per dag, uw bloedglucose: nuchter vóór het ontbijt en vóór het avondeten. |

<br/>

## <a name="TabelSpecificaties"></a> Tabel met specificaties
In de tabellen met specificaties staan de gegevens uit de gegevensdienst Verzamelen Aanbiedertaken (ProviderTasks), die relevant zijn voor deze weergaverichtlijn, weergegeven.
De prioriteit van de te tonen datavelden wordt vastgesteld volgens de MoSCoW-methodiek. Datavelden die niet in de specificatietabel voorkomen, moeten worden beschouwd als datavelden met de letter W.

<br/>

| Prioriteit | Omschrijving |
| --- | --- |
| M(ust have) | Nodig voor de basisfunctionaliteit van de toepassing en moet worden geïmplementeerd om het proces succesvol te laten verlopen. |
| S(hould have) | Belangrijke functionaliteit die niet vereist is, maar die voordelen biedt voor gebruikers en de algehele gebruikservaring. |
| C(ould have) | Gewenste functionaliteit die waarde toevoegt, maar minder kritisch is en indien nodig kan worden uitgesteld. |
| W(on't have) | Functionaliteiten die nu buiten scope zijn maar mogelijk in de toekomst worden overwogen. |

<br/>

<!-- VASTE KOLOMBREEDTES + PRESERVE WHITESPACE -->
<style>
  .pgo-table {
    width: 100%;
    table-layout: fixed;  /* respecteert <colgroup> widths */
    border-collapse: collapse;
    margin: 0 0 24px 0;
  }
  .pgo-table th, .pgo-table td {
    border: 1px solid #cccccc;
    padding: 6px 8px;
    vertical-align: top;
    overflow-wrap: anywhere;
    word-break: break-word;
    white-space: pre-wrap; /* behoudt regeleinden en meerdere spaties */
  }
  .pgo-table th {
    background: #f7f7f7;
    text-align: left;
  }
</style>

<!-- 9 KOLOMMEN:
Naam data-item | Type data-item | Id | Voorbeeld | Waar tonen in PGO (a) in overzicht en als detailgegeven (b) als detailgegeven (c) niet tonen (d) niet tonen, wel noodzakelijk voor de launch | Opmerkingen | Weergavetekst in de PGO | Gebruikersvriendelijke toelichting | Prioriteit (MoSCoW)
Breedteverdeling: 13% | 9% | 9% | 11% | 10% | 10% | 11% | 21% | 6% (totaal 100%) -->

### Taak (Task)
Verwijzing: [LogicalModel Task](https://simplifier.net/medmij-r4-provider-module/lmtask)

<!-- TAAK -->
<table class="pgo-table">
  <colgroup>
    <col style="width:13%"><col style="width:9%"><col style="width:9%"><col style="width:11%">
    <col style="width:10%"><col style="width:10%"><col style="width:11%"><col style="width:21%"><col style="width:6%">
  </colgroup>
  <thead>
    <tr>
      <th>Naam data-item</th><th>Type data-item</th><th>Id</th><th>Voorbeeld</th>
      <th>Waar tonen in PGO (a) in overzicht en als detailgegeven (b) als detailgegeven</th>
      <th>Opmerkingen</th><th>Weergavetekst in de PGO</th><th>Gebruikersvriendelijke toelichting</th><th>Prioriteit (MoSCoW)</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><strong>Taak</strong></td><td><strong>Rootconcept</strong></td><td>pt-lm-Task</td><td></td><td></td>
      <td></td><td>Taak</td><td></td><td></td>
    </tr>
    <tr>
      <td>Instantiates::ActivityDefinition</td><td>Reference</td><td>pt-lm-Task.Instantiates.ActivityDefinition</td><td>Bloedglucose meting volgens NHG protocol</td><td>a</td>
      <td>Titel digitale acitiviteit</td><td></td><td></td><td>M</td>
    </tr>
    <tr>
      <td>BasedOn::ServiceRequestDigitalGroupPlan</td><td>Reference</td><td>pt-lm-Task.BasedOn</td><td>Digitale zorgmodule Diabetes</td><td>b</td>
      <td>Toon hier alleen de waarde van `code.text`</td><td></td><td></td><td>C</td>
    </tr>
    <tr>
      <td>Status</td><td>Item</td><td>pt-lm-Task.Status</td><td>Requested</td><td>a</td>
      <td></td><td>Status</td><td>Patiëntvriendelijke vertaling van de statuscode (bijv. "Aangevraagd", "In uitvoering", "Afgerond", "Geannuleerd").</td><td>M</td>
    </tr>
    <tr>
      <td>Priority</td><td>Item</td><td>pt-lm-Task.Priority</td><td>Routine</td><td>b</td>
      <td></td><td></td><td></td><td>C</td>
    </tr>
    <tr>
      <td>Description</td><td>Item</td><td>pt-lm-Task.Description</td><td>Vul de vragenlijst in over je woon-/leefsituatie</td><td>b</td>
      <td>Voor de patiënt leesbare omschrijving van de taak.</td><td>Omschrijving</td><td></td><td>M</td>
    </tr>
    <tr>
      <td>ExecutionPeriod</td><td>Item</td><td>pt-lm-Task.ExecutionPeriod</td><td>2025-12-22 tot en met 2025-12-28</td><td>a</td>
      <td>Tijdvenster waarin de taak uitgevoerd moet/mag worden (start en eind).</td><td>Periode van uitvoer</td><td></td><td>M</td>
    </tr>
    <tr>
      <td>AuthoredOn</td><td>Item</td><td>pt-lm-Task.AuthoredOn</td><td>2025-12-23T18:00:00+01:00</td><td>c</td>
      <td>Datum/tijd waarop de taak is aangemaakt.</td><td></td><td></td><td>C</td>
    </tr>
    <tr>
      <td>Requester::PractitionerRole.Practitioner</td><td>Reference</td><td>pt-lm-Task.Requester</td><td>A. de Haard, huisarts</td><td>b</td>
      <td>Zowel de naam als het specialisme tonen.</td><td>Aanvragende zorgverlener</td><td></td><td>S</td>
    </tr>
    <tr>
      <td>Requester::PractitionerRole.Organization</td><td>Reference</td><td>pt-lm-Task.Requester</td><td>Huisartsenpraktijk de Haard</td><td>a</td>
      <td>Liefst geen afkortingen.</td><td>Zorgorganisatie</td><td></td><td>M</td>
    </tr>
    <tr>
      <td>Focus::ServiceRequestExecutionOrder</td><td>Reference</td><td>pt-lm-Task.focus</td><td></td><td>b</td>
      <td>Uitvoeringsopdracht voor o.a. patiëntspecifieke instructies en tijdschema</td><td></td><td></td><td>C</td>
    </tr>
  </tbody>
</table>

### Digitale activiteit (ActivityDefinition)
Verwijzing: [LogicalModel ActivityDefinition](https://simplifier.net/medmij-r4-provider-module/lmactivitydefinition)

<!-- DIGITALE ACTIVITEIT -->
<table class="pgo-table">
  <colgroup>
    <col style="width:13%"><col style="width:9%"><col style="width:9%"><col style="width:11%">
    <col style="width:10%"><col style="width:10%"><col style="width:11%"><col style="width:21%"><col style="width:6%">
  </colgroup>
  <thead>
    <tr>
      <th>Naam data-item</th><th>Type data-item</th><th>Id</th><th>Voorbeeld</th>
      <th>Waar tonen in PGO (a) in overzicht en als detailgegeven (b) als detailgegeven</th>
      <th>Opmerkingen</th><th>Weergavetekst in de PGO</th><th>Gebruikersvriendelijke toelichting</th><th>Prioriteit (MoSCoW)</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><strong>Digitale Activiteit</strong></td><td><strong>Rootconcept</strong></td><td>pt-lm-ActivityDefinition</td><td></td><td></td>
      <td>Herbruikbare definitie van een te starten digitale (eHealth) activiteit.</td><td>Activiteit</td><td></td><td></td>
    </tr>
    <tr>
      <td>Title</td><td>Item</td><td>pt-lm-ActivityDefinition.Title</td><td>Vragenlijst over de woon-leefsituatie</td><td>a</td>
      <td>Mens-leesbare titel die in het overzichtsscherm taken wordt getoond.</td><td>Titel van de digitale activiteit</td><td></td><td>M</td>
    </tr>
  </tbody>
</table>

### Zorgopdracht (ServiceRequest)
Verwijzing: [LogicalModel ServiceRequest](https://simplifier.net/medmij-r4-provider-module/lmservicerequest)

Wordt alleen gebruikt als er voor een taak in de module een patiëntspecifieke instructie is of tijdschema moet worden vastgelegd.

<!-- SERVICEREQUEST (PATIËNTSPECIFIEK) -->
<table class="pgo-table">
  <colgroup>
    <col style="width:13%"><col style="width:9%"><col style="width:9%"><col style="width:11%">
    <col style="width:10%"><col style="width:10%"><col style="width:11%"><col style="width:21%"><col style="width:6%">
  </colgroup>
  <thead>
    <tr>
      <th>Naam data-item</th><th>Type data-item</th><th>Id</th><th>Voorbeeld</th>
      <th>Waar tonen in PGO (a) in overzicht en als detailgegeven (b) als detailgegeven (c) niet tonen (d) niet tonen, wel noodzakelijk voor de launch</th>
      <th>Opmerkingen</th><th>Weergavetekst in de PGO</th><th>Gebruikersvriendelijke toelichting</th><th>Prioriteit (MoSCoW)</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><strong>ServiceRequest uitvoeringsopdracht</strong></td><td><strong>Rootconcept</strong></td><td>pt-lm-ServiceRequest</td><td></td><td>b</td>
      <td></td><td></td><td></td><td></td>
    </tr>
    <tr>
      <td>patientInstruction</td><td>Item</td><td>pt-lm-ServiceRequest.patientInstruction</td><td>Meet 7 dagen, 2 keer per dag, uw bloedglucose: nuchter vóór het ontbijt en vóór het avondeten.</td><td>b</td>
      <td>Patiëntspecifiek uitvoeringsopdracht voor een digitale activiteit, met daarin o.a. de planning (tijdschema) en patiënteninstructies. </td><td>Patiëntinstructie</td><td></td><td>M</td>
    </tr>
    <tr>
      <td>Occurrence</td><td>Item</td><td>pt-lm-ServiceRequest.Occurrence</td><td>start: 22-12-2025, eind: 28-12-2025, schema: 7d, 2x per dag</td><td>c</td>
      <td>Optioneel. Patiëntspecifieke timing (kan afwijken van de timing in de ActivityDefinition).</td><td></td><td></td><td>C</td>
    </tr>
    <tr>
      <td>Requester</td><td>Reference</td><td>pt-lm-ServiceRequest.Requester</td><td>A. de Haard, huisarts</td><td>c</td>
      <td></td><td></td><td></td><td>C</td>
    </tr>
  </tbody>
</table>

