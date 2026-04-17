---
description: Full pre-push sequence — lint, typecheck, tests, build, secret-scan.
---

Run in order, stop on first failure:
1. `npm run lint`
2. `npm run typecheck`
3. `npm run test`
4. `npm run build`
5. `pwsh ./scripts/scan-secrets.ps1`

Report the short SHA when green.
