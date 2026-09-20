$ErrorActionPreference = 'Stop'

$godot = [Environment]::GetEnvironmentVariable('GODOT_ENGINE', 'Machine')
if ([string]::IsNullOrWhiteSpace($godot)) {
    throw 'GODOT_ENGINE is not configured in the Machine environment scope.'
}
if (-not (Test-Path -LiteralPath $godot -PathType Leaf)) {
    throw "GODOT_ENGINE does not point to a file: $godot"
}

& $godot --version
if ($LASTEXITCODE -ne 0) { throw "Godot version check failed: $LASTEXITCODE" }

& $godot --headless --path (Split-Path $PSScriptRoot -Parent) --editor --quit
if ($LASTEXITCODE -ne 0) { throw "Godot project validation failed: $LASTEXITCODE" }

& $godot --headless --path (Split-Path $PSScriptRoot -Parent) --quit-after 2
if ($LASTEXITCODE -ne 0) { throw "Godot runtime smoke test failed: $LASTEXITCODE" }

Write-Output 'Godot validation passed.'
