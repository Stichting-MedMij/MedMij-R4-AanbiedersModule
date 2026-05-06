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

De richtlijn geeft géén handvatten voor de vormgeving (kleur, vorm, lettertype, etc.) van gegevens. Ook geeft de richtlijn géén handvatten voor de flow, het synchroniseren of het ophalen van gegevens en de technische launch van een aanbiedertaak. Voor die onderwerpen wordt verwezen naar het Afsprakenstelsel (AS) en de implementation guide.

## Scope
De scope van deze richtlijn bestaat uit de aanbiedertaak-gegevens die worden weergegeven in de PGO. Gegevens die via andere MedMij-gegevensdiensten verzameld worden in de PGO zijn hierin niet meegenomen.

Onderwerpen die buiten de scope van deze richtlijn vallen (en elders worden behandeld, bijvoorbeeld in het Afsprakenstelsel of de implementation guide):
- Inloggen en authenticeren bij de zorgaanbieder.
- Het synchroniseren of incrementeel ophalen van taken (inclusief waarschuwingen bij verouderde gegevens en aanbevelingen rondom langdurige toestemming).
- De technische uitwerking van het starten/launchen van een aanbiedertaak.

## Inhoud richtlijn
Het inloggen en authenticeren bij de zorgaanbieder is niet opgenomen in deze richtlijn.
De gebruiker gaat in de PGO naar het overzicht Aanbiedertaken en/of overzicht Zorgaanbieder ‑ Aanbiedertaken waar de aanbiedertaken getoond worden.

### Overzichtsscherm aanbiedertaken
Er zijn twee weergaven gedefinieerd voor het overzicht van de aanbiedertaken:
- Scenario 1: Overzicht Aanbiedertaken (met alle aanbiedertaken van alle zorgaanbieders in één overzicht)
- Scenario 2: Overzicht Zorgaanbieder ‑ Aanbiedertaken (met alle aanbiedertaken van één zorgaanbieder in één overzicht). Dit scenario is optioneel, omdat het uitgangspunt is dat de taken van alle zorgaanbieders worden getoond.

Het scenario, hieronder uitgewerkt, geeft weer hoe een UX-design getoond kan worden. Een PGO is vrij om scenario 2 te ondersteunen. 

In deze richtlijn zijn mock-ups opgenomen ter inspiratie. Daaronder is het Logical Model (LM) apart opgenomen, niet in een mock-up, maar in tabelvorm.

### Mock-ups overzichtsschermen aanbiedertaken
<u>Overzicht Aanbiedertaken</u>

In het Overzicht Aanbiedertaken heeft het overzichtsscherm één pagina waar de datavelden getoond worden, voor alle zorgaanbieders.

Het overzichtsscherm bestaat uit twee secties (deze mogen ook tabs zijn): een statussectie en een sectie met de afzonderlijke digitale activiteiten. De afzonderlijke digitale activiteiten worden gegroepeerd in drie groepen:
1. Te doen ( FHIR-status: `ready`, `requested`, `received`, `in-progress`)
2. Gereed (FHIR-status: `completed`)
3. Gestopt (FHIR-status: `failed`, `cancelled`)

Niet alle bovenstaande velden hoeven in het overzichtsscherm getoond te worden. Welke velden minimaal getoond moeten worden, blijkt uit de prioritering (MoSCoW) in de {{pagelink: Weergaverichtlijn, text: Tabel met specificaties, anchor: TabelSpecificaties}}. Lege velden hoeven niet getoond te worden. 

**Figuur 1: Voorbeeld Overzicht Aanbiedertaken**

{{render: guides/medmij-r4-provider-module-ig/images/overzichtschermTaken.png}}

Nb. In het overzichtsscherm worden alleen hoofdtaken of enkelvoudige taken getoond. Dat zijn taken waarbij `Task.partOf` geen waarde heeft. In het geval van een hoofdtaak worden vervolgens in het detailscherm de relevante subtaken getoond.

De acceptatiecriteria voor het overzichtsscherm zijn als volgt.

| Nr | Acceptatiecriteria |
| --- | --- |
| 1 | Standaard worden alle gegevens van de geraadpleegde zorgaanbieder(s) overzichtelijk weergegeven, gesorteerd op datum. Het overzichtsscherm opent met het filter "te doen". Wanneer er geen open taken zijn, wordt een passende melding getoond (bijvoorbeeld "Er zijn geen nieuwe taken"). |
| 2 | Je kunt zoeken op (delen van) de gegevens of op informatie uit de andere datavelden in het overzichtsscherm. Het bepalen van een eventuele drempel voor het aantal in te voeren karakters is aan de PGO (advies: maximaal drie karakters). Het zoekveld is met name relevant voor het tabblad met afgehandelde taken (historie). |
| 3 | Filteren op datavelden in het overzichtsscherm is mogelijk; voor velden met meerdere mogelijke waarden (bijvoorbeeld de zorgorganisatie) is een multi-select filter wenselijk. Filteren op `Task.description` is niet voorzien. Welke overige datavelden filterbaar zijn is aan de PGO; voor het datumveld geldt criterium 4. |
| 4 | Voor het datumveld in het overzichtsscherm kun je een specifieke periode selecteren. |
| 5 | Alle datavelden in het overzichtsscherm (met uitzondering van `Task.description`) zijn sorteerbaar. |
| 6 | De datavelden in het overzichtsscherm zijn begrijpelijk en gebruiksvriendelijk geformuleerd. Zie de {{pagelink: Weergaverichtlijn, text: Tabel met specificaties, anchor: TabelSpecificaties}} voor de aanbevolen termen per opgehaald dataveld. |
| 7 | De standaard sortering van de open taken is: eerst uit te voeren taak bovenaan. De standaard sortering van de afgeronde en gestopte taken is: meest recent uitgevoerde taak bovenaan. |
| 8 | De PGO toont in elk geval de datavelden met prioriteit M (must have) uit de specificatietabel. De PGO is vrij om aanvullende velden te tonen of deze (uitsluitend) in het detailscherm op te nemen. Lege velden hoeven niet getoond te worden. |

### Detailscherm aanbiedertaken
Dit detailscherm krijgt een PGO-gebruiker te zien na het selecteren van een specifieke regel in het overzichtsscherm. De in de mock-up weergegeven gegevens dienen uitsluitend ter demonstratie.

### Mock-up detailscherm aanbiedertaken
In het detailscherm zijn de volgende velden zichtbaar:
- `Task.status`
- `Task.requester.practitionerRole.organization.name`
- `Task.requester.practitionerRole.practitioner.name`
- `Task.description`
- `Task.executionPeriod.start`
- `Task.executionPeriod.end`
- `ActivityDefinition.title`
- `ServiceRequest.patientInstruction` (alleen indien er een patiëntspecifieke instructie bestaat)

**Figuur 2: Voorbeeld Detailscherm Aanbiedertaken (mock-up volgt)**


Nb 3. De patiëntinstructie is een specifieke instructie voor de patiënt. Deze instructie kan door de zorgverlener worden ingevoerd bij het klaarzetten van de digitale activiteit voor de patiënt. Algemene instructies horen in de module zichtbaar te zijn en zijn daarom geen onderdeel van deze weergaverichtlijn. De patiëntinstructie is niet altijd aanwezig.

### Starten/Launchen van een aanbiedertaak
Bij het starten van een taak moet de patiënt geïnformeerd worden dat het vervolg van de taak in de omgeving van de zorgaanbieder draait. De technische uitwerking van de launch valt buiten de scope van deze richtlijn; daarvoor wordt verwezen naar het Afsprakenstelsel (AS) en de implementation guide.

### Aanbiedertaakgegevens
Hieronder wordt een voorbeeld in tabelvorm gegeven van het overzichts- en detailscherm voor een hoofdtaak met onderliggende digitale activiteiten.

<u>Overzichtsscherm</u>

| Titel | Status | Periode | Zorgorganisatie |
| --- | --- | --- | --- |
| Gezonder gaan leven | Aangevraagd | 22-12-2025 t/m 28-12-2025 | Huisartsenpraktijk de Haard |
| Bloedglucose monitoren | In uitvoering | 15-12-2025 t/m 22-12-2025 | Huisartsenpraktijk de Haard |

<u>Detailscherm</u>

| Geselecteerde regel: Gezonder gaan leven | |
| --- | --- |
| Titel | Gezonder gaan leven |
| Status | Aangevraagd |
| Periode | 22-12-2025 t/m 28-12-2025 |
| Zorgverlener | A. de Haard |
| Zorgorganisatie | Huisartsenpraktijk de Haard |
| Patiëntinstructie | (optionele specifieke instructie van de zorgverlener) |
| Actieknop | Start |

<u>Onderliggende digitale activiteiten (subtaken)</u>

| Titel digitale activiteit | Beschrijving | Periode van uitvoer | Behandelcontext | Zorgorganisatie |
| --- | --- | --- | --- | --- |
| Bloedglucosemeting | 1 week 2x per dag bloedglucosemeting | 22-12-2025 t/m 28-12-2025 | Diabetes | Huisartsenpraktijk de Haard |
| Gezonder gaan leven | Leestips voor een gezondere leefstijl | 22-12-2025 t/m 28-12-2025 | Diabetes | Huisartsenpraktijk de Haard |
| Vragenlijst over de woon-leefsituatie | Vul de vragenlijst in | 22-12-2025 t/m 28-12-2025 | Diabetes | Huisartsenpraktijk de Haard |

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
      <th>Waar tonen in PGO (a) in overzicht en als detailgegeven (b) als detailgegeven (c) niet tonen (d) niet tonen, wel noodzakelijk voor de launch</th>
      <th>Opmerkingen</th><th>Weergavetekst in de PGO</th><th>Gebruikersvriendelijke toelichting</th><th>Prioriteit (MoSCoW)</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><strong>Taak</strong></td><td><strong>Rootconcept</strong></td><td>pt-lm-Task</td><td></td><td></td>
      <td></td><td>Taak</td><td></td><td></td>
    </tr>
    <tr>
      <td>Instantiates::ActivityDefinition</td><td>Reference</td><td>pt-lm-Task.Instantiates.ActivityDefinition</td><td>ProviderModule-ActivityDefinition-Vragenlijst-WoonLeefsituatie</td><td>c</td>
      <td>Verwijzing naar de digitale activiteit (LM ActivityDefinition).</td><td></td><td></td><td>M</td>
    </tr>
    <tr>
      <td>Identifier</td><td>Item</td><td>pt-lm-Task.Identifier</td><td>system: "http://medrie.nl/taskIdentifier"<br/>value: "TASK-Vragenlijst-Woonsituatie-9642"</td><td>b / c</td>
      <td>Business identifier is verplicht (uniek binnen of over systemen heen).</td><td></td><td></td><td>M</td>
    </tr>
    <tr>
      <td>GroupIdentifier</td><td>Item</td><td>pt-lm-Task.GroupIdentifier</td><td>system: "https://medrie.nl/fhir/identifiers/task-group"<br/>value: "module-diabetes-2025"<br/>display/text: "Digitale zorgmodule Diabetes"</td><td>a</td>
      <td>Wordt gebruikt om gerelateerde taken (bijv. taken binnen één digitale zorgmodule) te groeperen en te filteren in het overzicht. Open tekstveld; geen vaste valueset.</td><td>Zorgmodule of Groep</td><td>De zorgmodule of het programma waar deze taak toe behoort.</td><td>M</td>
    </tr>
    <tr>
      <td>BasedOn::ServiceRequest</td><td>Reference</td><td>pt-lm-Task.BasedOn</td><td>ServiceRequest/ProviderModule-ServiceRequest-Glucosemeting</td><td>c</td>
      <td>De zorgopdracht waar de taak op gebaseerd is. Discussiepunt MedMij.</td><td></td><td></td><td>C</td>
    </tr>
    <tr>
      <td>PartOf::Task</td><td>Reference</td><td>pt-lm-Task.PartOf</td><td>Task/ProviderModule-MainTask-Meetopdracht-Glucosemeting</td><td>c</td>
      <td>Verwijzing naar een hoofdtaak. Gebruikt om subtaken (bijv. losse meetmomenten) te koppelen aan een hoofdtaak. In het overzichtsscherm worden alleen hoofdtaken of enkelvoudige taken (zonder <code>partOf</code>) getoond.</td><td></td><td></td><td>M</td>
    </tr>
    <tr>
      <td>Status</td><td>Item</td><td>pt-lm-Task.Status</td><td>requested</td><td>a</td>
      <td>Bepaalt in welke groep de taak in het overzichtsscherm valt: Te doen (<code>ready</code>, <code>requested</code>, <code>received</code>, <code>in-progress</code>), Gereed (<code>completed</code>) of Gestopt (<code>failed</code>, <code>cancelled</code>).</td><td>Status</td><td>Patiëntvriendelijke vertaling van de statuscode (bijv. "Aangevraagd", "In uitvoering", "Afgerond", "Geannuleerd").</td><td>M</td>
    </tr>
    <tr>
      <td>Intent</td><td>Item</td><td>pt-lm-Task.Intent</td><td>order</td><td>c</td>
      <td>Voor patiëntgerichte activiteiten doorgaans 'order'.</td><td></td><td></td><td>C</td>
    </tr>
    <tr>
      <td>Priority</td><td>Item</td><td>pt-lm-Task.Priority</td><td>routine</td><td>c</td>
      <td></td><td></td><td></td><td>C</td>
    </tr>
    <tr>
      <td>Description</td><td>Item</td><td>pt-lm-Task.Description</td><td>Vul de vragenlijst in over je woon-/leefsituatie</td><td>b</td>
      <td>Voor de patiënt leesbare omschrijving van de taak. In de praktijk vaak een langer veld; alleen in het detailscherm tonen. Niet sorteerbaar of filterbaar.</td><td>Omschrijving</td><td></td><td>M</td>
    </tr>
    <tr>
      <td>For::Patient</td><td>Reference</td><td>pt-lm-Task.For</td><td>Tom van Duinen</td><td>c</td>
      <td>De patiënt voor wie de taak bedoeld is. Wordt normaal gesproken niet getoond in de PGO (eigen account).</td><td></td><td></td><td>W</td>
    </tr>
    <tr>
      <td>ExecutionPeriod</td><td>Item</td><td>pt-lm-Task.ExecutionPeriod</td><td>2025-12-22 tot en met 2025-12-28</td><td>a</td>
      <td>Tijdvenster waarin de taak uitgevoerd moet/mag worden (start en eind). De invulvereisten (welke onderdelen verplicht of optioneel zijn) worden beschreven in de implementation guide.</td><td>Periode van uitvoer</td><td></td><td>M</td>
    </tr>
    <tr>
      <td>AuthoredOn</td><td>Item</td><td>pt-lm-Task.AuthoredOn</td><td>2025-12-23T18:00:00+01:00</td><td>c</td>
      <td>Datum/tijd waarop de taak is aangemaakt.</td><td></td><td></td><td>C</td>
    </tr>
    <tr>
      <td>LastModified</td><td>Item</td><td>pt-lm-Task.LastModified</td><td>2025-12-23T18:00:00+01:00</td><td>c</td>
      <td>Datum/tijd van de laatste wijziging (bijv. statuswijziging).</td><td></td><td></td><td>C</td>
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
      <td>Owner::Patient</td><td>Reference</td><td>pt-lm-Task.Owner</td><td>Tom van Duinen</td><td>c</td>
      <td>Uitvoerder van de taak. In de huidige scope altijd de patiënt zelf.</td><td>Uitvoerder</td><td></td><td>W</td>
    </tr>
    <tr>
      <td>Restriction.Repetitions</td><td>Item</td><td>pt-lm-Task.Restriction.Repetitions</td><td>(nog geen voorbeeld)</td><td>c</td>
      <td>Aantal keer dat de taak herhaald moet worden.</td><td></td><td></td><td>C</td>
    </tr>
    <tr>
      <td>Restriction.Period</td><td>Item</td><td>pt-lm-Task.Restriction.Period</td><td>(nog geen voorbeeld)</td><td>c</td>
      <td>Periode waarin de restrictie van toepassing is.</td><td></td><td></td><td>C</td>
    </tr>
    <tr>
      <td>LastUpdated</td><td>Item</td><td>(niet in LM)</td><td></td><td>c</td>
      <td>Niet in het LM, maar wel relevant. Functioneert als metadata: betreft de <code>lastUpdated</code> aan de bron en kan PGO-zijdig gebruikt worden voor incrementele synchronisatie (max(_lastUpdated)). Wordt niet getoond aan de patiënt; helpt het ontbreken van notificaties op te vangen.</td><td></td><td></td><td>C</td>
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
      <th>Waar tonen in PGO (a) in overzicht en als detailgegeven (b) als detailgegeven (c) niet tonen (d) niet tonen, wel noodzakelijk voor de launch</th>
      <th>Opmerkingen</th><th>Weergavetekst in de PGO</th><th>Gebruikersvriendelijke toelichting</th><th>Prioriteit (MoSCoW)</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><strong>Digitale Activiteit</strong></td><td><strong>Rootconcept</strong></td><td>pt-lm-ActivityDefinition</td><td></td><td></td>
      <td>Herbruikbare definitie van een te starten digitale (eHealth) activiteit.</td><td>Activiteit</td><td></td><td></td>
    </tr>
    <tr>
      <td>ModuleEndpoint</td><td>Reference</td><td>pt-lm-ActivityDefinition.ModuleEndpoint</td><td>Endpoint/ProviderModule-Endpoint-Module</td><td>d</td>
      <td>Endpoint waar de activiteit gestart wordt. Niet tonen, wel noodzakelijk voor de launch.</td><td></td><td></td><td>M</td>
    </tr>
    <tr>
      <td>Identifier</td><td>Item</td><td>pt-lm-ActivityDefinition.Identifier</td><td></td><td>c</td>
      <td>Business identifier van de ActivityDefinition.</td><td></td><td></td><td>C</td>
    </tr>
    <tr>
      <td>Version</td><td>Item</td><td>pt-lm-ActivityDefinition.Version</td><td>1.0.0</td><td>c</td>
      <td>Versie van de gepubliceerde activiteit.</td><td></td><td></td><td>C</td>
    </tr>
    <tr>
      <td>Name</td><td>Item</td><td>pt-lm-ActivityDefinition.Name</td><td>VragenlijstWoonLeefsituatie</td><td>c</td>
      <td>Computer-friendly naam.</td><td></td><td></td><td>W</td>
    </tr>
    <tr>
      <td>Title</td><td>Item</td><td>pt-lm-ActivityDefinition.Title</td><td>Vragenlijst over de woon-leefsituatie</td><td>a</td>
      <td>Mens-leesbare titel die in het overzicht en detail wordt getoond.</td><td>Activiteit (titel)</td><td></td><td>M</td>
    </tr>
    <tr>
      <td>Status</td><td>Item</td><td>pt-lm-ActivityDefinition.Status</td><td>active</td><td>c</td>
      <td>Status van de definitie (bijv. draft, active, retired).</td><td></td><td></td><td>C</td>
    </tr>
    <tr>
      <td>Publisher</td><td>Item</td><td>pt-lm-ActivityDefinition.Publisher</td><td>HinqZNO</td><td>c</td>
      <td>Organisatie die verantwoordelijk is voor de publicatie van de activiteit (moduleaanbieder).</td><td></td><td></td><td>C</td>
    </tr>
    <tr>
      <td>Description</td><td>Item</td><td>pt-lm-ActivityDefinition.Description</td><td>Vragenlijst beschrijving voor patiënt en zorgaanbieder</td><td>c</td>
      <td>Beschrijving (markdown). Niet patiëntspecifiek.</td><td></td><td></td><td>C</td>
    </tr>
    <tr>
      <td>Usage</td><td>Item</td><td>pt-lm-ActivityDefinition.Usage</td><td></td><td>c</td>
      <td>Bedoeld voor de zorgverlener bij het selecteren/toewijzen.</td><td></td><td></td><td>W</td>
    </tr>
    <tr>
      <td>Timing</td><td>Item</td><td>pt-lm-ActivityDefinition.Timing</td><td>7d, 2x per dag (optioneel)</td><td>c</td>
      <td>Aanbevolen timing op definitieniveau. Patiëntspecifieke timing hoort bij de ServiceRequest.</td><td></td><td></td><td>C</td>
    </tr>
  </tbody>
</table>

### Zorgopdracht (ServiceRequest)
Verwijzing: [LogicalModel ServiceRequest](https://simplifier.net/medmij-r4-provider-module/lmservicerequest)

Voor de ServiceRequest hebben we twee varianten:

**Variant 1 — Groeperende zorgopdracht.** De zorgverlener vraagt een set aan digitale interventies aan (bijv. een digitale zorgmodule). De ServiceRequest dient hier momenteel geen ander doel dan het groeperen van de taken. Workflow compliant.

<!-- SERVICEREQUEST (GROEP) -->
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
      <td><strong>ServiceRequest (groep)</strong></td><td><strong>Rootconcept</strong></td><td>pt-lm-ServiceRequest</td><td></td><td></td>
      <td>Groeperende zorgopdracht voor een digitale zorgmodule.</td><td></td><td></td><td></td>
    </tr>
    <tr>
      <td>Identifier</td><td>Item</td><td>pt-lm-ServiceRequest.Identifier</td><td>system: "https://medrie.nl/fhir/identifiers/SR-group"<br/>value: "module-diabetes-2025"</td><td>c</td>
      <td>Mogelijk nodig voor sortering/groepering aan PGO-zijde.</td><td></td><td></td><td>C</td>
    </tr>
    <tr>
      <td>Code (text)</td><td>Item</td><td>(FHIR: ServiceRequest.code.text)</td><td>"Digitale zorgmodule Diabetes"</td><td>a</td>
      <td>Wordt in het overzicht getoond via <code>Task.basedOn.display</code>.</td><td>Zorgmodule</td><td></td><td>M</td>
    </tr>
    <tr>
      <td>Status</td><td>Item</td><td>pt-lm-ServiceRequest.Status</td><td>active</td><td>c</td>
      <td></td><td></td><td></td><td>C</td>
    </tr>
    <tr>
      <td>Intent</td><td>Item</td><td>pt-lm-ServiceRequest.Intent</td><td>order</td><td>c</td>
      <td></td><td></td><td></td><td>C</td>
    </tr>
    <tr>
      <td>Subject</td><td>Reference</td><td>pt-lm-ServiceRequest.Subject</td><td>De patiënt</td><td>c</td>
      <td></td><td></td><td></td><td>W</td>
    </tr>
    <tr>
      <td>Requester</td><td>Reference</td><td>pt-lm-ServiceRequest.Requester</td><td>A. de Haard, huisarts</td><td>c</td>
      <td>Aanvragende zorgverlener wordt al getoond via Task.requester.</td><td></td><td></td><td>C</td>
    </tr>
    <tr>
      <td>AuthoredOn</td><td>Item</td><td>pt-lm-ServiceRequest.AuthoredOn</td><td>2025-12-23T18:00:00+01:00</td><td>c</td>
      <td></td><td></td><td></td><td>C</td>
    </tr>
  </tbody>
</table>

**Variant 2 — Patiëntspecifieke zorgopdracht.** Wordt alleen gebruikt als er voor een taak in de module een patiëntspecifieke instructie of een afwijkende timing moet worden vastgelegd.

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
      <td><strong>ServiceRequest (patiëntspecifiek)</strong></td><td><strong>Rootconcept</strong></td><td>pt-lm-ServiceRequest</td><td></td><td>b</td>
      <td>Patiëntspecifieke zorgopdracht. Naamgevingsconventies en verdere uitwerking worden beschreven in de implementation guide.</td><td></td><td></td><td></td>
    </tr>
    <tr>
      <td>Identifier</td><td>Item</td><td>pt-lm-ServiceRequest.Identifier</td><td></td><td>c</td>
      <td></td><td></td><td></td><td>C</td>
    </tr>
    <tr>
      <td>Status</td><td>Item</td><td>pt-lm-ServiceRequest.Status</td><td>active</td><td>c</td>
      <td></td><td></td><td></td><td>C</td>
    </tr>
    <tr>
      <td>Intent</td><td>Item</td><td>pt-lm-ServiceRequest.Intent</td><td>order</td><td>c</td>
      <td></td><td></td><td></td><td>C</td>
    </tr>
    <tr>
      <td>Subject</td><td>Reference</td><td>pt-lm-ServiceRequest.Subject</td><td>De patiënt</td><td>c</td>
      <td></td><td></td><td></td><td>W</td>
    </tr>
    <tr>
      <td>patientInstruction</td><td>Item</td><td>pt-lm-ServiceRequest.patientInstruction</td><td>"Specifieke instructie voor patiënt X, alleen 's avonds gebruiken"</td><td>b</td>
      <td>Optioneel. Specifieke instructie voor de patiënt, alleen tonen indien aanwezig.</td><td>Patiëntinstructie</td><td></td><td>M</td>
    </tr>
    <tr>
      <td>Occurrence</td><td>Item</td><td>pt-lm-ServiceRequest.Occurrence</td><td>7d, 2x per dag</td><td>c</td>
      <td>Optioneel. Patiëntspecifieke timing (kan afwijken van de timing in de ActivityDefinition).</td><td></td><td></td><td>C</td>
    </tr>
    <tr>
      <td>Requester</td><td>Reference</td><td>pt-lm-ServiceRequest.Requester</td><td>A. de Haard, huisarts</td><td>c</td>
      <td></td><td></td><td></td><td>C</td>
    </tr>
    <tr>
      <td>AuthoredOn</td><td>Item</td><td>pt-lm-ServiceRequest.AuthoredOn</td><td>2025-12-23T18:00:00+01:00</td><td>c</td>
      <td></td><td></td><td></td><td>C</td>
    </tr>
  </tbody>
</table>

### Lokale gegevens aan PGO-zijde

<!-- LOKALE GEGEVENS -->
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
      <td>Laatste_ophaal_ZA</td><td>Item</td><td>(lokaal)</td><td>2000-01-01T00:00:00+01:00</td><td>a</td>
      <td>Initiële datum of <code>max(_lastUpdated)</code>. Wordt gebruikt om incrementeel taakgegevens op te halen bij de zorgaanbieder.</td><td>Laatst opgehaald</td><td></td><td>M</td>
    </tr>
  </tbody>
</table>

## Aandachtspunten

**Patiëntgegevens.** Het Logical Model `pt-lm-Patient` (naam, geboortedatum, geslacht) wordt niet als aparte sectie uitgewerkt in deze richtlijn. Binnen de scope van Aanbiedertaken is de patiënt altijd de PGO-gebruiker zelf en worden zijn/haar gegevens niet apart in het overzicht of detailscherm getoond. De referenties `Task.For` en `Task.Owner` naar de patiënt zijn daarom in de specificatietabel gemarkeerd met `c` (niet tonen).

**Deduplicatie.** Voor de taak gebeurt deduplicatie op basis van een business identifier. Voor gerelateerde resources (bijvoorbeeld een gekoppelde ActivityDefinition) is het wenselijk dat ook deze een unieke business identifier krijgen, om verweesde objecten in de PGO te voorkomen.

**Weergave duplicaten.** In tegenstelling tot bijvoorbeeld Beelden willen we voor taken voorkomen dat er duplicaten bestaan. Tonen in groepen is hier daarom niet wenselijk.

**Status `draft` → `cancelled` (Draft2cancel).** Taken met status `cancelled` worden uitgewisseld en moeten in een separaat tabblad worden getoond. Omdat de aanname is dat Koppeltaal-taken status `draft` kunnen hebben (taken die de patiënt kan ophalen), kan via `Task.statusReason` worden aangegeven dat een taak voorheen in `draft` stond. Deze taken kunnen client-side worden weggelaten.
