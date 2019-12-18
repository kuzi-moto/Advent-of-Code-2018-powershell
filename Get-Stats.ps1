param (
  [int]$Day,
  [int]$Part,
  [int]$Year = (Get-Date).year
)

$root = Join-Path $PSScriptRoot "$Year/Day $Day"

$Script = Join-Path $root "P$Part.ps1"
$Stats = Join-Path $root ("P" + $Part + "_stats.txt")

Measure-Command -Expression { & $Script } | Out-String | ForEach-Object {$_.Trim() | Out-File $Stats}