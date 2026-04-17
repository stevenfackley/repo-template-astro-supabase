# Security

Report vulnerabilities privately to stevenfackley@gmail.com. Do not open public issues for unpatched vulns.

## Guarantees
- No telemetry SDKs. No static AWS keys. OIDC only.
- Secrets never committed. `.env.example` documents names; real values live in GitHub Secrets.
- Pre-commit hook scans `src/**` and `scripts/**` for key patterns.
- Branch protection requires `ci` and `secret-scan` green.

## Dependencies
- Dependabot grouped weekly.
- CI fails on `npm audit` high/critical.

## Runtime
- Runs as non-root (`astro:1001`).
- HTTPS termination at edge (EC2 via nginx / K3s via ingress).
