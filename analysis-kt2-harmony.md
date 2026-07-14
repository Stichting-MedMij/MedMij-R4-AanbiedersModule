# MedMij ProviderModule vs Koppeltaal KT2 — Koppeltaal Perspective Review

## Context

The MedMij-R4-KoppelMij IG harmonizes module launching between MedMij and Koppeltaal. The goal is that module suppliers can support both launch flows with minimal effort (beyond auth differences). This analysis identifies conflicts, risks, and structural friction from the Koppeltaal perspective.

**Key premise:** Koppeltaal will move from a "closed" model (unused fields set to 0..0) to an "open" model. This means most cardinality conflicts (MedMij opening what KT2 closes) will resolve naturally.

---

## 1. CRITICAL FINDINGS (Require Discussion/Action)

### 1.1 Practitioner vs PractitionerRole — STRUCTURAL CONFLICT

| Element | KT2\_Task | MedMij pt-Task |
|---------|----------|----------------|
| `requester` | `Reference(KT2_Practitioner)` | `Reference(nl-core-HealthProfessional-PractitionerRole)` |
| `owner` | `...KT2_Practitioner...` | `...nl-core-HealthProfessional-PractitionerRole...` |

**These are fundamentally different FHIR resource types.** MedMij follows the Dutch zib convention (PractitionerRole wrapping Practitioner), Koppeltaal references Practitioner directly. A module supplier cannot use the same reference resolution logic for both.

**Impact:** HIGH — This is the single biggest structural barrier to "trivial" dual support. Module suppliers must implement dual-path reference resolution for `requester` and `owner`.

**Recommendation:** Koppeltaal should align with the zib convention and move to PractitionerRole as part of the open-model transition. The MedMij profile explicitly notes Practitioner is acceptable "in rare circumstances" — so the MedMij profile is already forward-compatible with this change.

### 1.2 resource-origin Extension Cardinality — PROFILE BUG

- **KT2\_ResourceOrigin extension definition** (`KT2_ResourceOrigin.fsh`): `* . ..1` — max 1 per resource
- **MedMij Origin RuleSet** (`RuleSets.fsh:5`): `KT2_ResourceOrigin named resource-origin 0..*`

MedMij declares the extension as `0..*` but the extension definition caps it at `..1`. In FHIR, a profile cannot loosen beyond the extension definition's max cardinality. **This is a validation error in the MedMij profile.**

**Recommendation:** MedMij should change `0..*` to `0..1` to match the extension definition.

### 1.3 ServiceRequest — NEW RESOURCE TYPE (KT2 has none)

MedMij introduces `ProviderModule-ServiceRequest` (clinical order / "zorgopdracht") referenced via `Task.basedOn`. Koppeltaal has no ServiceRequest profile and currently closes `Task.basedOn` to `..0`.

**Impact:** MEDIUM — Module suppliers receiving MedMij data must handle `Task.basedOn → ServiceRequest`. However, for module launching itself, ServiceRequest is informational context (patient instructions, scheduling). The actual launch mechanism (Task → ActivityDefinition → Endpoint) is identical.

**Mitigation:** When KT2 opens `basedOn`, the structural incompatibility disappears. The ServiceRequest resource can simply be ignored by KT2-only consumers since it's referenced, not embedded.

### 1.4 Endpoint connectionType — DIFFERENT LAUNCH PROTOCOLS

| Aspect | KT2\_Endpoint | MedMij pt-Endpoint |
|--------|-------------|-------------------|
| connectionType | `= #hti-smart-on-fhir` (FIXED) | Extensible binding (not fixed) |
| MedMij examples use | N/A | `#hl7-fhir-rest` |

**Impact:** HIGH for auth/launch flow (acknowledged), LOW for data model. The connectionType code is the logical discriminator for which launch protocol to use — this is by design, not a conflict.

---

## 2. MEDIUM FINDINGS (Manageable Differences)

### 2.1 ActivityDefinition.url — Mandatory in KT2, Optional in MedMij

- KT2: `url 1..*` (mandatory)
- MedMij: `0..1` (optional, base FHIR default)

**Risk:** LOW in practice — most implementers include `url`. But a valid MedMij ActivityDefinition without `url` would fail KT2 validation.

**Recommendation:** MedMij should make `url` mandatory (`1..`) to align with KT2.

### 2.2 Task.priority — Fixed in KT2, Open in MedMij

- KT2: `priority = #routine (exactly)` — fixed value
- MedMij: `0..1` (any value allowed)

**Risk:** LOW — When KT2 opens up, the fixed value constraint should be relaxed to a preferred/default. MedMij examples all use `#routine`.

### 2.3 groupIdentifier — Used in MedMij, Prohibited in KT2

MedMij uses `groupIdentifier` for grouping related tasks (e.g., all measurement moments in a blood pressure protocol). KT2 closes it to `..0`.

**Risk:** LOW — Resolves when KT2 opens up. MedMij's usage of groupIdentifier is additive and non-conflicting.

### 2.4 Task.output — Open in MedMij, Closed in KT2

MedMij allows Task output (measurement results, questionnaire responses). KT2 closes it.

**Risk:** LOW — Resolves when KT2 opens up. Module suppliers can populate output in MedMij context and omit it in KT2 context.

### 2.5 Dependency Version Mismatch

| Package | KT2 | MedMij |
|---------|-----|--------|
| nictiz.fhir.nl.r4.nl-core | 0.12.0-beta.4 | 0.12.0-beta.1 |
| nictiz.fhir.nl.r4.zib2020 | 0.12.0-beta.4 | 0.12.0-beta.1 |
| koppeltaalv2.00 | 0.15.4 (current) | 0.15.0-beta.9 (dependency) |

**Risk:** MEDIUM — Beta version differences could introduce subtle profile differences. MedMij depends on an older KT2 package version.

**Recommendation:** Align nl-core versions and update the koppeltaalv2.00 dependency.

### 2.6 MedMij ClientID Extension (MedMij-only)

`ext-ClientID` on Endpoint for DVA token exchange. Not present in KT2.

**Risk:** LOW — Additive extension, unknown extensions are ignored in FHIR. Module suppliers need MedMij-specific auth logic regardless.

---

## 3. POSITIVE FINDINGS (Well Harmonized)

### 3.1 Shared Extensions — Same Canonical URLs

All critical extensions are **identical** between KT2 and MedMij:

- `instantiates`: `http://vzvz.nl/fhir/StructureDefinition/instantiates` — same URL, MedMij reuses KT2 definition
- `KT2EndpointExtension`: `http://koppeltaal.nl/fhir/StructureDefinition/KT2EndpointExtension`
- `KT2PublisherId`: `http://koppeltaal.nl/fhir/StructureDefinition/KT2PublisherId`
- `resource-origin`: `http://koppeltaal.nl/fhir/StructureDefinition/resource-origin`

### 3.2 Shared ValueSets and Terminology

- `koppeltaal-task-code` ValueSet — same binding in both
- `koppeltaal-definition-topic` ValueSet — same extensible binding in both
- `endpoint-connection-type` ValueSet — same extensible binding in both

### 3.3 Core Task Structure

- `identifier 1..*` — mandatory in both
- `for 1..*` — mandatory patient reference in both
- `owner 1..*` — mandatory in both
- `partOf` — self-referencing in both
- `instantiates` extension — same structure, same URL

### 3.4 ActivityDefinition Structure

- `endpoint 1..*` — mandatory in both (same extension)
- `title 1..*` — mandatory in both
- `topic` — same ValueSet, same binding strength
- `publisherId` — same extension in both

---

## 4. VERDICT: IS DUAL SUPPORT "ALMOST TRIVIAL"?

### What IS trivial (same code path):

- Task creation/reading (core fields identical)
- ActivityDefinition handling (same extensions, same structure)
- Launch URL resolution (ActivityDefinition → Endpoint → address)
- Extension processing (same canonical URLs)

### What is NOT trivial:

1. **Authorization flows** (HTI vs DVA) — acknowledged, out of scope
2. **Practitioner vs PractitionerRole** — requires dual-path reference resolution in `requester`/`owner`
3. **ServiceRequest handling** — module suppliers must either resolve `Task.basedOn` or explicitly ignore it
4. **Endpoint connectionType** — different codes require context-aware launch logic

### Bottom line:

With auth differences excluded, and assuming KT2 opens up its closed model, the gap narrows to essentially **one structural issue: Practitioner vs PractitionerRole**. If Koppeltaal aligns with the zib PractitionerRole convention, dual support becomes genuinely close to trivial for module suppliers.

---

## 5. RECOMMENDATIONS (Prioritized)

### For MedMij (this IG):

1. **FIX:** Change `resource-origin` cardinality from `0..*` to `0..1` (currently violates extension definition)
2. **CONSIDER:** Make `ActivityDefinition.url` mandatory (`1..`) to align with KT2
3. **UPDATE:** Align nl-core dependency to match KT2 version (beta.4)
4. **UPDATE:** Update koppeltaalv2.00 dependency from 0.15.0-beta.9 to current

### For Koppeltaal (open-model transition):

1. **PRIORITY:** Move `requester`/`owner` from Practitioner to PractitionerRole (aligns with zib convention and MedMij)
2. **OPEN:** Remove `..0` on `basedOn` and `groupIdentifier` first (actively used by MedMij)
3. **RELAX:** Change `priority` from fixed `#routine` to preferred/default
4. **OPEN:** Remove `..0` on `output`, `businessStatus`, `note`, `restriction`

### Joint:

1. Align nl-core/zib2020 dependency versions
2. Create a conformance test suite: FHIR instances valid against BOTH profiles simultaneously
3. Document the connectionType discriminator as the mechanism for selecting HTI vs DVA launch flow

---

## Key Files Referenced

| File | Purpose |
|------|---------|
| `MedMij-R4-KoppelMij/fsh/input/fsh/AanbiedersModule-Task.fsh` | MedMij Task profile |
| `MedMij-R4-KoppelMij/fsh/input/fsh/AanbiedersModule-ActivityDefinition.fsh` | MedMij ActivityDefinition profile |
| `MedMij-R4-KoppelMij/fsh/input/fsh/AanbiedersModule-Endpoint.fsh` | MedMij Endpoint profile |
| `MedMij-R4-KoppelMij/fsh/input/fsh/AanbiedersModule-ServiceRequest.fsh` | MedMij ServiceRequest profile |
| `MedMij-R4-KoppelMij/fsh/input/fsh/RuleSets.fsh` | resource-origin cardinality bug |
| `MedMij-R4-KoppelMij/fsh/input/fsh/aliases.fsh` | Extension URL verification |
| `MedMij-R4-KoppelMij/fsh/sushi-config.yaml` | MedMij dependency versions |
| `Koppeltaal-2.0-FHIR/input/fsh/profiles/KT2_Task.fsh` | KT2 Task profile |
| `Koppeltaal-2.0-FHIR/input/fsh/profiles/KT2_ActivityDefinition.fsh` | KT2 ActivityDefinition profile |
| `Koppeltaal-2.0-FHIR/input/fsh/profiles/KT2_Endpoint.fsh` | KT2 Endpoint profile |
| `Koppeltaal-2.0-FHIR/input/fsh/extensions/KT2_Instantiates.fsh` | Extension URL verification |
| `Koppeltaal-2.0-FHIR/input/fsh/extensions/KT2_ResourceOrigin.fsh` | Cardinality verification |

---

## Appendix: Issues by Resource Type

### Task

| # | Issue | Severity | Status |
|---|-------|----------|--------|
| 1.1 | `requester` references Practitioner (KT2) vs PractitionerRole (MedMij) | CRITICAL | Requires KT2 alignment with zib convention |
| 1.1 | `owner` references Practitioner (KT2) vs PractitionerRole (MedMij) | CRITICAL | Requires KT2 alignment with zib convention |
| 1.2 | `resource-origin` extension declared `0..*` but definition caps at `..1` | CRITICAL | MedMij profile bug — fix to `0..1` |
| 2.2 | `priority` fixed to `#routine` in KT2, open in MedMij | LOW | Resolves when KT2 relaxes to preferred/default |
| 2.3 | `groupIdentifier` used in MedMij, closed `..0` in KT2 | LOW | Resolves when KT2 opens up |
| 2.4 | `output` open in MedMij, closed `..0` in KT2 | LOW | Resolves when KT2 opens up |
| 1.3 | `basedOn` references ServiceRequest in MedMij, closed `..0` in KT2 | MEDIUM | Resolves when KT2 opens up |

### ActivityDefinition

| # | Issue | Severity | Status |
|---|-------|----------|--------|
| 1.2 | `resource-origin` extension declared `0..*` but definition caps at `..1` | CRITICAL | MedMij profile bug — fix to `0..1` |
| 2.1 | `url` mandatory in KT2 (`1..`), optional in MedMij (`0..1`) | LOW | MedMij should make mandatory to align |

### Endpoint

| # | Issue | Severity | Status |
|---|-------|----------|--------|
| 1.2 | `resource-origin` extension declared `0..*` but definition caps at `..1` | CRITICAL | MedMij profile bug — fix to `0..1` |
| 1.4 | `connectionType` fixed to `#hti-smart-on-fhir` in KT2, extensible in MedMij | LOW | By design — discriminator for launch protocol |
| 2.6 | `ext-ClientID` present in MedMij only | LOW | Additive, no conflict |

### ServiceRequest

| # | Issue | Severity | Status |
|---|-------|----------|--------|
| 1.2 | `resource-origin` extension declared `0..*` but definition caps at `..1` | CRITICAL | MedMij profile bug — fix to `0..1` |
| 1.3 | Entirely new resource type — no KT2 equivalent | MEDIUM | Informational context only; no KT2 action needed |

### Cross-cutting

| # | Issue | Severity | Status |
|---|-------|----------|--------|
| 2.5 | nl-core/zib2020 dependency version mismatch (beta.1 vs beta.4) | MEDIUM | Align versions |
| 2.5 | koppeltaalv2.00 dependency outdated (0.15.0-beta.9 vs 0.15.4) | MEDIUM | Update dependency |
