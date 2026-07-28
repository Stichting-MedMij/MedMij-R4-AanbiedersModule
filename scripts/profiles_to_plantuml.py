#!/usr/bin/env python3
"""Generate a PlantUML diagram of the pt- FHIR profiles and their references.

Unlike the logical-model diagram, this shows the constrained FHIR resources
(Task, ActivityDefinition, ...) and the cardinality of every reference between
them, including references made through a medmij extension.

Usage: python scripts/profiles_to_plantuml.py [StructureDefinitions dir]
Writes the .page.md (with <plantuml> block) to the IG FHIR-Profiles folder.
"""
import glob
import json
import os
import sys

OUT_FILE = os.path.join(
    "guides", "medmij-r4-provider-tasks-ig", "Home",
    "Artifact-Index", "FHIR-Profiles", "FhirProfileOverview.page.md",
)

HEADER = """@startuml
hide circle
hide empty members
skinparam shadowing false
skinparam roundcorner 12
skinparam defaultFontName Segoe UI
skinparam entity {
  BackgroundColor #F4F9FF
  BorderColor #4A78B5
  BorderThickness 1.5
  FontColor #1B2A4A
}
skinparam ArrowColor #4A78B5
skinparam ArrowFontColor #4A78B5
"""


def load(src_dir):
    """Return (profiles: url->sd, extensions: url->target_profile_url)."""
    profiles, extensions = {}, {}
    for path in glob.glob(os.path.join(src_dir, "*.json")):
        with open(path, encoding="utf-8") as f:
            sd = json.load(f)
        sid = str(sd.get("id", ""))
        if sd.get("derivation") != "constraint":
            continue
        if sid.startswith("ext-"):
            # an extension: find which profile its value[x] references
            for el in sd.get("differential", {}).get("element", []):
                for t in el.get("type", []):
                    for tp in t.get("targetProfile", []):
                        extensions[sd["url"]] = tp
        elif sid.startswith("pt-") and not sid.startswith("pt-lm-"):
            profiles[sd["url"]] = sd
    return profiles, extensions


def card(el):
    # ponytail: cardinality read from the differential only; an element that
    # doesn't constrain it (e.g. Task.focus) falls back to 0..1. Generate the
    # snapshot if you ever need true inherited cardinality.
    return f'{el.get("min", 0)}..{el.get("max", "1")}'


def edges_of(sd, profile_urls, extensions):
    """Yield (target_url, label, cardinality) for references to other profiles."""
    for el in sd.get("differential", {}).get("element", []):
        eid = el["id"]
        if "extension.value" in eid or "extension.extension" in eid:
            continue  # skip an extension's internal wiring (avoids duplicate edges)
        label = el.get("sliceName") or el["path"].split(".")[-1]
        for t in el.get("type", []):
            for tp in t.get("targetProfile", []):
                if tp in profile_urls:
                    yield tp, label, card(el)
            for pr in t.get("profile", []):  # reference made through an extension
                target = extensions.get(pr)
                if target in profile_urls:
                    yield target, label, card(el)


def to_plantuml(profiles, extensions):
    out, edges = [HEADER], []
    urls = set(profiles)
    for url, sd in sorted(profiles.items(), key=lambda kv: kv[1]["id"]):
        entity = sd["id"].replace("pt-", "")
        base = sd["type"]  # profiled FHIR resource, e.g. ActivityDefinition
        color = " #FFE7CC" if entity == "Task" else ""
        out.append(f'entity "{entity}" as {entity} <<{base}>>{color} {{')
        out.append("}")
        out.append("")
        for tgt_url, label, crd in edges_of(sd, urls, extensions):
            tgt = profiles[tgt_url]["id"].replace("pt-", "")
            edges.append(f'{entity} --> "{crd}" {tgt} : {label}')
    out.extend(sorted(set(edges)))
    out.append("@enduml")
    return "\n".join(out)


if __name__ == "__main__":
    src = sys.argv[1] if len(sys.argv) > 1 else "StructureDefinitions"
    profiles, extensions = load(src)
    assert profiles, f"no pt- profiles found in {src}"
    body = to_plantuml(profiles, extensions)
    assert "-->" in body, "no references detected — check targetProfile/extension parsing"
    page = f"---\ntopic: FhirProfileOverview\n---\n\n<plantuml>\n\n{body}\n\n</plantuml>\n"
    with open(OUT_FILE, "w", encoding="utf-8") as f:
        f.write(page)
    print(f"wrote {OUT_FILE}")
