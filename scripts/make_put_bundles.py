#!/usr/bin/env python3
"""Build FHIR transaction Bundles (PUT) from examples/.

One Bundle per patient (resource + everything whose filename ends with that
patient's name suffix), plus one 'shared' Bundle for resources bound to no
patient (Endpoint, Organization, Practitioner, ...).
"""
import json
from pathlib import Path

ROOT = Path(__file__).parent.parent
SRC = ROOT / "examples"
OUT = ROOT / "bundles"
PREFIX = "Patient-ProviderTasks-Patient-"  # patient suffix = filename after this


def patient_suffixes():
    return sorted(
        (p.stem[len(PREFIX):] for p in SRC.glob(f"{PREFIX}*.json")),
        key=len, reverse=True,  # longest first so "De-Groot" wins over any prefix overlap
    )


def bundle(resources):
    return {
        "resourceType": "Bundle",
        "type": "transaction",
        "entry": [
            {
                "fullUrl": f'{r["resourceType"]}/{r["id"]}',
                "resource": r,
                "request": {"method": "PUT", "url": f'{r["resourceType"]}/{r["id"]}'},
            }
            for r in resources
        ],
    }


def main():
    suffixes = patient_suffixes()
    groups = {s: [] for s in suffixes}
    groups["shared"] = []

    for f in sorted(SRC.glob("*.json")):
        r = json.loads(f.read_text(encoding="utf-8"))
        stem = f.stem
        owner = next((s for s in suffixes if stem.endswith(f"-{s}") or stem.endswith(s)), None)
        groups[owner if owner else "shared"].append(r)

    OUT.mkdir(exist_ok=True)
    for name, resources in groups.items():
        if not resources:
            continue
        dest = OUT / f"Bundle-PUT-{name}.json"
        dest.write_text(json.dumps(bundle(resources), indent=2, ensure_ascii=False), encoding="utf-8")
        print(f"{dest.name}: {len(resources)} resources")


if __name__ == "__main__":
    main()
