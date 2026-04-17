# System Design — {{PROJECT_NAME}}

## Runtime
- Astro 6 SSR (Node adapter, standalone) on Node 22 alpine.
- Single stateless container. Scales horizontally behind a load balancer.
- Listens on `:4321`. `/healthz` is the liveness endpoint (JSON, no-store).

## Data
- `supabase/postgres` image (Postgres 15.x) locally and in prod. Ships pgcrypto, pgsodium, pgvector, pg_graphql, pgjwt, pg_stat_statements by default.
- Cloud Supabase is available but opt-in — default is self-hosted for cost control. The only difference at the app layer is `DATABASE_URL`.
- Schema defined in `src/db/schema.ts` (Drizzle). Migrations SQL under `drizzle/` (committed). Drizzle connects directly to Postgres; Supabase's REST/Auth/Realtime layers are not used.
- Connection via `postgres-js` with pool size 10. `DATABASE_URL` is required at boot.

## Object storage
- S3-compatible API. Cloudflare R2 in prod; MinIO sidecar locally (mirrors R2's surface).
- Env: `S3_ENDPOINT`, `S3_REGION=auto`, `S3_ACCESS_KEY_ID`, `S3_SECRET_ACCESS_KEY`, `S3_BUCKET`, `S3_FORCE_PATH_STYLE=true`, optional `S3_PUBLIC_BASE_URL`.
- `docker-compose.yml` boots `minio` + a one-shot `minio-init` that creates the local bucket.

## Rendering
- SSR by default. `export const prerender = true` on pages that can be static.
- React islands via `@astrojs/react` only where interactivity is needed.

## Deploy
- Image built once, tagged `sha-{SHORT_SHA}` (test) and re-tagged `prod-{SHA}` on release.
- Deploy target: `{{DEPLOY_TARGET}}`.
- Migrations run as a pre-deploy job (`npm run db:migrate`).

## Observability
- Structured JSON logs to stdout. No third-party telemetry SDKs (banned by CI).
- Container logs are the source of truth; downstream aggregation is infra-level.

## Security
- Runs as non-root (`astro:1001`).
- Secrets via env vars only. No `.env` files in the image.
- Pre-commit + CI secret-scan gates.
