# Ops patterns

- Immutable images. Never mutate `latest` in prod — always pin by digest.
- Zero-downtime deploy: `docker compose pull && up -d` swaps containers; Astro SSR is stateless.
- DB migrations gated: run `npm run db:migrate` before rollout; fail deploy if migration errors.
- Log aggregation via whatever the host provides (CloudWatch / Loki). App just writes JSON to stdout.
