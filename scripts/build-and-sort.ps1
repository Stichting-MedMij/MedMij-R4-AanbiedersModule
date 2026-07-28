#!/usr/bin/env pwsh
# Runs sushi on fsh/ then sorts generated resources into top-level folders by type.
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
