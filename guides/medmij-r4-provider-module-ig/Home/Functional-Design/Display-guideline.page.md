---
topic: Weergaverichtlijn
---

# Weergaverichtlijn

## Inleiding
Dit is de weergaverichtlijn voor de gegevensdienst Aanbiedertaken (ProviderTasks).

De richtlijn bevat een aantal verplichte acceptatiecriteria. De getoonde mock-ups zijn bedoeld ter inspiratie. Persoonlijke gezondheidsomgevingen (PGO's) kunnen deze voorbeelden naar eigen inzicht visueel vormgeven, zolang de gebruiksvriendelijkheid behouden blijft, en aan de acceptatiecriteria is voldaan.

## Doel
Deze richtlijn heeft als doel om duidelijke handvatten te bieden voor een patiëntvriendelijke en begrijpelijke weergave van aanbiedertaken in de PGO. De richtlijn ondersteunt ontwikkelaars en zorgverleners bij het:
- gebruiken van begrijpelijke en patiëntvriendelijke termen en toelichtingen;
- structureren en presenteren van het gegevensoverzicht op een manier die aansluit bij de informatiebehoefte van PGO-gebruikers.

De richtlijn geeft géén handvatten voor de vormgeving (kleur, vorm, lettertype, etc.) van gegevens. Ook geeft de richtlijn géén handvatten voor de flow, het synchroniseren of ophalen van gegevens en het technisch starten (launchen) van een aanbiedermodule. Voor die onderwerpen wordt verwezen naar het Solution Design en de FHIR Implementation Guide.

## Scope
De scope van deze richtlijn bestaat uit de gegevens van aanbiedertaken die in de PGO worden weergegeven. Gegevens die via andere MedMij-gegevensdiensten in de PGO worden verzameld, vallen buiten deze richtlijn.

Onderwerpen die buiten de scope van deze richtlijn vallen:
- Inloggen en authenticeren bij de zorgaanbieder.
- Het synchroniseren of incrementeel ophalen van taken (inclusief waarschuwingen bij verouderde gegevens en aanbevelingen rondom langdurige toestemming).
- Het starten (launchen) van een aanbiedermodule.

## Inhoud richtlijn
Om taken in te zien, navigeert de gebruiker in de PGO naar het takenoverzicht. Vanuit dit overzicht kan de gebruiker een specifieke taak openen om de bijbehorende details te bekijken. Deze richtlijn beschrijft hoe het overzichtsscherm en het detailscherm vormgegeven kunnen worden, en geeft aanbevelingen voor de weergave van de afzonderlijke datavelden.

De weergaverichtlijn beschrijft twee schermen:
- Overzicht van alle taken van alle zorgaanbieders in één overzicht
- Detailgegevens per taak

Het overzichts- en detailscherm worden geïllustreerd met mock-ups, die ter inspiratie dienen. De aanbevelingen voor de afzonderlijke datavelden zijn uitgewerkt in een specificatietabel ({{pagelink: Weergaverichtlijn, text: Tabel met specificaties, anchor: TabelSpecificaties}}), gebaseerd op het Logical Model.

### Mock-ups overzichtsschermen aanbiedertaken
<u>Overzicht taken</u>

In het overzicht taken worden de taken van alle zorgaanbieders op één pagina getoond.

Het overzichtsscherm bestaat uit twee onderdelen (deze mogen ook als tabs worden weergegeven): 
1. een (taak-)status overzicht
2. een overzicht met de taken.

**Figuur 1: Voorbeeld Overzicht taken**

<u>Overzicht taken per zorgaanbieder</u>

{{render: guides/medmij-r4-provider-module-ig/images/figuur 2.png}}

**Figuur 2: Voorbeeld Overzicht taken per zorgaanbieder**

#### Groeperen taken per status
De afzonderlijke taken worden ingedeeld in drie groepen:
1. Te doen (FHIR-status: `ready`, `requested`, `received`, `in-progress`)
2. Klaar (FHIR-status: `completed`)
3. Gestopt (FHIR-status: `failed`, `cancelled`)

#### Vertalingen taakstatussen
- "concept" voor "draft" 
- "aangevraagd" voor "requested" 
- "ontvangen" voor "received" 
- "geaccepteerd" voor "accepted" 
- "afgewezen" voor "rejected" 
- "gereed" voor "ready" 
- "geannuleerd" voor "cancelled" 
- "bezig" voor "in-progress" 
- "in de wacht" voor "on-hold" 
- "mislukt" voor "failed" 
- "voltooid" voor "completed" 
- "per ongeluk ingevoerd" voor "entered-in-error" 

De acceptatiecriteria voor het overzichtsscherm zijn als volgt.

| Nr | Acceptatiecriteria |
| --- | --- |
| 1 | Standaard worden alle gegevens van alle zorgaanbieder(s) waarbij taakgegevens zijn verzameld, overzichtelijk weergegeven, gesorteerd op datum. Het overzichtsscherm opent met het filter "Te doen". Wanneer er geen openstaande taken zijn, wordt een passende melding getoond (bijvoorbeeld "Er zijn geen nieuwe taken"). |
| 2 | De gebruiker kan zoeken op (delen van) de gegevens of op informatie uit de andere datavelden in het overzichtsscherm. Het bepalen van een eventuele drempel voor het minimaal aantal in te voeren karakters is aan de PGO (advies: minimaal drie karakters). Het zoekveld is met name relevant voor het tabblad met afgehandelde taken (historie). |
| 3 | Voor alle datavelden in het overzichtsscherm is het mogelijk om te filteren op één of meerdere waarden, met uitzondering van `Task.description` (Omschrijving). Minimaal moet gefilterd kunnen worden op datum (zie criterium 4), zorgaanbieder en taakstatus. |
| 4 | Voor het datumveld in het overzichtsscherm kan de gebruiker een specifieke periode selecteren. |
| 5 | Alle datavelden in het overzichtsscherm (met uitzondering van `Task.description`) zijn sorteerbaar. |
| 6 | De datavelden in het overzichtsscherm zijn begrijpelijk en gebruiksvriendelijk geformuleerd. Zie de {{pagelink: Weergaverichtlijn, text: Tabel met specificaties, anchor: TabelSpecificaties}} voor de aanbevolen termen per opgehaald dataveld. |
| 7 | De standaard sortering van openstaande taken is: de eerst uit te voeren taak bovenaan. De standaard sortering van afgeronde en gestopte taken is: de meest recent uitgevoerde taak bovenaan. |
| 8 | De PGO toont minimaal de datavelden met prioriteit M (must have) uit de specificatietabel. De PGO is vrij om aanvullende velden te tonen of deze (uitsluitend) in het detailscherm op te nemen. Lege velden hoeven niet getoond te worden. |
| 9 | De PGO toont alleen unieke taken in het overzichtscherm. |

### Detailscherm aanbiedertaken
Dit detailscherm krijgt een PGO-gebruiker te zien na het selecteren van een specifieke regel in het overzichtsscherm. De in de mock-up weergegeven gegevens dienen uitsluitend ter demonstratie.

#### Mock-ups detailscherm aanbiedertaken

{{render: guides/medmij-r4-provider-module-ig/images/detailscherm1.png}}

{{render: guides/medmij-r4-provider-module-ig/images/detailscherm2.png}}

{{render: guides/medmij-r4-provider-module-ig/images/detailscherm3.png}}

{{render: guides/medmij-r4-provider-module-ig/images/detailscherm4.png}}

**Figuur 3: Voorbeeld detailschermen**

De acceptatiecriteria voor het weergeven van een aanbiedertaak in het detailscherm zijn hieronder opgenomen.

| Nr | Acceptatiecriteria |
| --- | --- |
| 1 | Voor bepaalde termen in de aanbiedertaakgegevens worden nog patiëntvriendelijke termen gedefinieerd. Zodra deze beschikbaar zijn, toont de PGO de patiëntvriendelijke term in plaats van de oorspronkelijke term. |
| 2 | De datavelden in het detailscherm zijn begrijpelijk en gebruiksvriendelijk geformuleerd. Zie de {{pagelink: Weergaverichtlijn, text: Tabel met specificaties, anchor: TabelSpecificaties}} voor de aanbevolen termen per opgehaald dataveld. |

De patiëntinstructie is een specifieke instructie voor de patiënt. Deze instructie kan door de zorgverlener worden ingevoerd bij het klaarzetten van de digitale activiteit voor de patiënt. Algemene instructies horen in de module zelf zichtbaar te zijn en vallen daarom buiten deze weergaverichtlijn. De patiëntinstructie is niet altijd aanwezig.

Welke velden minimaal getoond moeten worden in het overzichtsscherm en het detailscherm, blijkt uit de prioritering (MoSCoW) in de {{pagelink: Weergaverichtlijn, text: Tabel met specificaties, anchor: TabelSpecificaties}}. Lege velden hoeven niet getoond te worden.

### Aanbiedertaakgegevens
Hieronder wordt een voorbeeld in tabelvorm gegeven van het overzichts- en detailscherm voor een taak met een digitale activiteit.

<u>Overzichtsscherm</u>

| Titel | Status | Periode | Zorgorganisatie | Digitale zorgmodule |
| --- | --- | --- | --- | --- |
| Gezonder gaan leven | Aangevraagd | 22-12-2025 t/m 28-12-2025 | Huisartsenpraktijk de Haard | Digitale zorgmodule Diabetes |
| Bloedglucose meting volgens NHG protocol | In uitvoering | 22-12-2025 t/m 28-12-2025 | Huisartsenpraktijk de Haard | Digitale zorgmodule Diabetes |

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
| Omschrijving | Je meet de bloeddruk om te controleren hoe goed het hart en de bloedvaten werken |
| Zorgverlener | A. de Haard |
| Zorgorganisatie | Huisartsenpraktijk de Haard |
| Patiëntinstructie | Meet 7 dagen, 2 keer per dag, uw bloedglucose: nuchter vóór het ontbijt en vóór het avondeten. |

<br/>

## <a name="TabelSpecificaties"></a> Tabel met specificaties
De tabellen met specificaties tonen de gegevens uit de gegevensdienst Aanbiedertaken (ProviderTasks) die relevant zijn voor deze weergaverichtlijn.
De prioriteit van de te tonen datavelden is vastgesteld volgens de MoSCoW-methodiek. Datavelden die niet in de specificatietabel voorkomen, worden beschouwd als datavelden met prioriteit W.

<br/>

| Prioriteit | Omschrijving |
| --- | --- |
| M(ust have) | Nodig voor de basisfunctionaliteit van de toepassing en moet worden geïmplementeerd om het proces succesvol te laten verlopen. |
| S(hould have) | Belangrijke functionaliteit die niet vereist is, maar die voordelen biedt voor gebruikers en de algehele gebruikservaring. |
| C(ould have) | Gewenste functionaliteit die waarde toevoegt, maar minder kritisch is en indien nodig kan worden uitgesteld. |
| W(on't have) | Functionaliteiten die nu buiten scope zijn maar mogelijk in de toekomst worden overwogen. |

<br/>

De gegevensdienst Aanbiedertaken (ProviderTasks) bestaat uit drie samenhangende Logical Models. Onderstaande tabellen beschrijven per model welke datavelden in de PGO worden weergegeven:

- **Taak (Task):** de hoofdresource. Beschrijft de uit te voeren taak en de bijbehorende status, periode, aanvrager en zorgorganisatie.
- **Digitale activiteit (ActivityDefinition):** de herbruikbare definitie van de digitale activiteit waar de taak naar verwijst (via `Task.instantiates`). Levert onder andere de titel die in het overzichtsscherm wordt getoond.
- **Uitvoeringsopdracht (ServiceRequest):** wordt alleen gebruikt wanneer er een patiënt-specifieke instructie of tijdschema bij de taak hoort (via `Task.focus`). Optioneel.

Voor elk dataveld is in de kolom **"Waar tonen in PGO"** met een letter aangegeven waar het veld weergegeven wordt:

| Code | Betekenis |
| --- | --- |
| a | In het overzichtsscherm én als detailgegeven in het detailscherm. |
| b | Alleen als detailgegeven in het detailscherm. |

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
      <td><strong>Taak</strong></td><td><strong>Rootconcept</strong></td><td>pt-dataelement-1</td><td></td><td></td>
      <td></td><td>Taak</td><td></td><td></td>
    </tr>
    <tr>
      <td>Instantiates::ActivityDefinition</td><td>Reference</td><td>pt-dataelement-2</td><td>Bloedglucose meting volgens NHG protocol</td><td>a</td>
      <td>Titel van de digitale activiteit.</td><td></td><td></td><td>M</td>
    </tr>
    <tr>
      <td>BasedOn::ServiceRequestDigitalGroupPlan</td><td>Reference</td><td>pt-dataelement-3</td><td>Digitale zorgmodule Diabetes</td><td>b</td>
      <td>Toon hier alleen de waarde van `code.text` uit het ServiceRequest.</td><td></td><td></td><td>C</td>
    </tr>
    <tr>
      <td>Status</td><td>Item</td><td>pt-dataelement-4</td><td>Requested</td><td>a</td>
      <td></td><td>Status</td><td>Patiëntvriendelijke vertaling van de statuscode (bijv. "Aangevraagd", "In uitvoering", "Afgerond", "Geannuleerd").</td><td>M</td>
    </tr>
    <tr>
      <td>Priority</td><td>Item</td><td>pt-dataelement-5</td><td>Routine</td><td>b</td>
      <td></td><td></td><td></td><td>C</td>
    </tr>
    <tr>
      <td>Description</td><td>Item</td><td>pt-dataelement-6</td><td>Je meet de bloeddruk om te controleren hoe goed het hart en de bloedvaten werken</td><td>Omschrijving</td><td></td><td>M</td>
    </tr>
    <tr>
      <td>ExecutionPeriod</td><td>Item</td><td>pt-dataelement-7</td><td>2025-12-22 tot en met 2025-12-28</td><td>a</td>
      <td>Tijdvenster waarin de taak uitgevoerd moet/mag worden (start en eind).</td><td>Periode van uitvoer</td><td></td><td>M</td>
    </tr>
    <tr>
      <td>Requester::PractitionerRole.Practitioner</td><td>Reference</td><td>pt-dataelement-8</td><td>A. de Haard, huisarts</td><td>b</td>
      <td>Zowel de naam als het specialisme tonen.</td><td>Aanvragende zorgverlener</td><td></td><td>S</td>
    </tr>
    <tr>
      <td>Requester::PractitionerRole.Organization</td><td>Reference</td><td>pt-dataelement-8</td><td>Huisartsenpraktijk de Haard</td><td>a</td>
      <td>Voluit weergeven; bij voorkeur geen afkortingen gebruiken.</td><td>Zorgorganisatie</td><td></td><td>M</td>
    </tr>
    <tr>
      <td>Focus::ServiceRequestExecutionOrder</td><td>Reference</td><td></td><td></td><td>b</td>
      <td>Uitvoeringsopdracht voor onder andere patiënt-specifieke instructies en het tijdschema.</td><td></td><td></td><td>C</td>
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
      <th>Waar tonen in PGO</th>
      <th>Opmerkingen</th><th>Weergavetekst in de PGO</th><th>Gebruikersvriendelijke toelichting</th><th>Prioriteit (MoSCoW)</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><strong>Digitale Activiteit</strong></td><td><strong>Rootconcept</strong></td><td>pt-dataelement-9</td><td></td><td></td>
      <td>Herbruikbare definitie van een te starten digitale (eHealth) activiteit.</td><td>Digitale activiteit</td><td></td><td></td>
    </tr>
    <tr>
      <td>Title</td><td>Item</td><td>pt-dataelement-10</td><td>Vragenlijst over de woon-/leefsituatie</td><td>a</td>
      <td>Voor de mens leesbare titel die in het overzichtsscherm met taken wordt getoond.</td><td></td><td></td><td>M</td>
    </tr>
  </tbody>
</table>

### Uitvoeringsopdracht (ServiceRequest)
Verwijzing: [LogicalModel ServiceRequest](https://simplifier.net/medmij-r4-provider-module/lmservicerequest)

Wordt alleen gebruikt als er voor een taak in de module een patiënt-specifieke instructie of een tijdschema moet worden vastgelegd.

<!-- SERVICEREQUEST (PATIËNTSPECIFIEK) -->
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
      <td><strong>ServiceRequest uitvoeringsopdracht</strong></td><td><strong>Rootconcept</strong></td><td>pt-dataelement-15</td><td></td><td></td>
      <td></td><td></td><td></td><td></td>
    </tr>
    <tr>
      <td>patientInstruction</td><td>Item</td><td>pt-dataelement-16</td><td>Meet 7 dagen, 2 keer per dag, uw bloedglucose: nuchter vóór het ontbijt en vóór het avondeten.</td><td>b</td>
      <td>Patiënt-specifieke uitvoeringsopdracht voor een digitale activiteit.</td><td>Patiëntinstructie</td><td></td><td>M</td>
    </tr>
    <tr>
      <td>Occurrence</td><td>Item</td><td>pt-dataelement-17</td><td>start: 22-12-2025, eind: 28-12-2025, schema: 7d, 2x per dag</td><td>c</td>
      <td>Optioneel. Patiëntspecifiek tijdschema.</td><td>Tijdschema</td><td></td><td>C</td>
    </tr>
    <tr>
      <td>Requester</td><td>Reference</td><td>pt-dataelement-18</td><td>A. de Haard, huisarts</td><td>c</td>
      <td></td><td></td><td></td><td>C</td>
    </tr>
  </tbody>
</table>

