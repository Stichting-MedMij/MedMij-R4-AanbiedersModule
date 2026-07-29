#!/usr/bin/env pwsh
# Runs sushi on fsh/, sorts generated resources into top-level folders by type,
# then regenerates the derived IG pages (plantuml diagrams, page TOCs).
$ErrorActionPreference = 'Stop'
$root = Split-Path $PSScriptRoot -Parent

Push-Location "$root/fsh"
try { sushi . } finally { Pop-Location }

$src = "$root/fsh/fsh-generated/resources"
foreach ($f in Get-ChildItem "$src/*.json") {
    $dest = switch -Wildcard ($f.Name) {
        'CapabilityStatement-*' { 'CapabilityStatements' }
        'StructureDefinition-*' { 'StructureDefinitions' }
        'SearchParameter-*'     { 'SearchParameter' }
        default                 { 'examples' }
    }
    New-Item -ItemType Directory -Force "$root/$dest" | Out-Null
    Move-Item $f.FullName "$root/$dest/$($f.Name)" -Force
}

# the python scripts read/write paths relative to the repo root
Push-Location $root
try {
    foreach ($s in 'lm_to_plantuml.py', 'profiles_to_plantuml.py', 'add_page_toc.py') {
        python "scripts/$s"
        if ($LASTEXITCODE) { throw "scripts/$s failed ($LASTEXITCODE)" }
    }
} finally { Pop-Location }
