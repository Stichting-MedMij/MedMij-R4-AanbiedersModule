#!/usr/bin/env python3
"""Generate a PlantUML entity diagram from the pt-lm logical model StructureDefinitions.

Usage: python scripts/lm_to_plantuml.py [StructureDefinitions dir]
Writes the .page.md (with <plantuml> block) to the IG Logical-Models folder.
"""
import glob
import json
import os
import sys

OUT_FILE = os.path.join(
    "guides", "medmij-r4-provider-tasks-ig", "Home",
    ".plantuml", "LogicalModelOverview.page.md",
)

CAPTION = "*Diagram 1: Overview of the logical models and their relations.*"


def load_models(src_dir):
    models = {}
    for path in glob.glob(os.path.join(src_dir, "*.json")):
        with open(path, encoding="utf-8") as f:
            sd = json.load(f)
        if sd.get("kind") != "logical" or not str(sd.get("id", "")).startswith("pt-lm-"):
            continue
        models[sd["url"]] = sd
    return models


def fields_and_relations(sd, known_urls):
    """Return (list of element names, list of (target_url, label))."""
    root = sd["id"]
    fields, relations = [], []
    for el in sd.get("differential", {}).get("element", []):
        if el["path"] == root:  # skip the root element itself
            continue
        name = el["path"].split(".", 1)[1].replace("[x]", "")
        # a Reference to another known pt-lm model becomes an edge, not a field row
        linked = False
        for t in el.get("type", []):
            for tp in t.get("targetProfile", []):
                if tp in known_urls:
                    relations.append((tp, name))
                    linked = True
        if not linked:
            fields.append(name)
    return fields, relations


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


def to_plantuml(models):
    out = [HEADER]
    edges = []
    for url, sd in sorted(models.items(), key=lambda kv: kv[1]["id"]):
        title = sd.get("title", sd["id"])
        entity = sd["id"].replace("pt-lm-", "")
        fields, relations = fields_and_relations(sd, set(models))
        # Task is the hub — give it an accent colour
        color = " #FFE7CC" if entity == "Task" else ""
        out.append(f'entity "{title}" as {entity}{color} {{')
        for fld in fields:
            out.append(f"  {fld}")
        out.append("}")
        out.append("")
        for target_url, label in relations:
            tgt = models[target_url]["id"].replace("pt-lm-", "")
            edges.append(f'{entity} --> {tgt} : {label}')
    out.extend(edges)
    out.append("@enduml")
    return "\n".join(out)


if __name__ == "__main__":
    src = sys.argv[1] if len(sys.argv) > 1 else "StructureDefinitions"
    models = load_models(src)
    assert models, f"no pt-lm logical models found in {src}"
    assert any(
        fields_and_relations(sd, set(models))[1] for sd in models.values()
    ), "no relations detected — check targetProfile parsing"
    page = (
        f"---\ntopic: LogicalModelOverview\n---\n\n"
        f"<plantuml>\n\n{to_plantuml(models)}\n\n</plantuml>\n\n{CAPTION}\n"
    )
    os.makedirs(os.path.dirname(OUT_FILE), exist_ok=True)
    with open(OUT_FILE, "w", encoding="utf-8") as f:
        f.write(page)
    print(f"wrote {OUT_FILE}")
