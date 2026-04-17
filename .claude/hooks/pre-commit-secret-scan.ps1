#!/usr/bin/env pwsh
$ErrorActionPreference = 'Stop'
$patterns = @(
  'ApplicationInsights','Sentry','Segment','Mixpanel','Datadog','NewRelic',
  'AKIA[0-9A-Z]{16}','ASIA[0-9A-Z]{16}','xoxb-','sk_live_','sk-ant-','ghp_',
  '-----BEGIN (RSA |OPENSSH |EC )?PRIVATE KEY-----'
)
$staged = git diff --cached --name-only --diff-filter=ACM |
  Where-Object { $_ -match '^(src|scripts|db)/' -and $_ -notmatch '\.env\.example$' }

$hits = @()
foreach ($f in $staged) {
  if (-not (Test-Path $f)) { continue }
  $content = Get-Content $f -Raw
  foreach ($p in $patterns) {
    if ($content -match $p) { $hits += "$f matches /$p/" }
  }
}
if ($hits.Count) {
  Write-Host "secret-scan: BLOCKED" -ForegroundColor Red
  $hits | ForEach-Object { Write-Host "  $_" -ForegroundColor Red }
  exit 1
}
