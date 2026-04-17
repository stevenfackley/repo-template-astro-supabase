#!/usr/bin/env pwsh
# Secret/telemetry grep. Exit 1 on any hit.
$ErrorActionPreference = 'Stop'

$telemetry = 'ApplicationInsights|Sentry|Segment|Mixpanel|Datadog|NewRelic|Raygun|Rollbar|Bugsnag|HockeyApp|AppCenter|GoogleAnalytics'
$secrets   = 'InstrumentationKey=|AKIA[0-9A-Z]{16}|ASIA[0-9A-Z]{16}|xoxb-|sk_live_|sk-ant-|ghp_|-----BEGIN (RSA |OPENSSH |EC )?PRIVATE KEY-----'

$roots = @('src', 'scripts', 'db')
$hits = @()
foreach ($r in $roots) {
  if (-not (Test-Path $r)) { continue }
  Get-ChildItem $r -Recurse -File | ForEach-Object {
    $c = Get-Content $_.FullName -Raw
    if ($c -match $telemetry) { $hits += "[telemetry] $($_.FullName)" }
    if ($c -match $secrets)   { $hits += "[secret]    $($_.FullName)" }
  }
}

if ($hits.Count) {
  Write-Host "secret-scan FAILED" -ForegroundColor Red
  $hits | ForEach-Object { Write-Host "  $_" -ForegroundColor Red }
  exit 1
}
Write-Host "secret-scan OK" -ForegroundColor Green
