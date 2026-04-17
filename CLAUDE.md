# {{PROJECT_NAME}}

## Stack
{{FLAVOR}}. Astro 6 SSR + Node adapter + Supabase (supabase/postgres) + Drizzle ORM + R2/S3 object storage. See `docs/architecture/SDD.md`.

## Standard flow
analyze -> read docs/ -> read package.json + tsconfig.json + drizzle.config.ts -> plan -> work.

## Conventions
- Image tags: `sha-{SHORT_SHA}` (test), `prod-{SHA}` (prod).
- Release tags: `YYYYMMDD_{{PROJECT_NAME}}_Release`.
- Routes: `src/pages/`. API endpoints export `GET`/`POST`. `prerender = false` for anything dynamic.
- DB: drizzle-kit migrations checked into `drizzle/`. No raw `psql` schema edits. Supabase extensions (pgcrypto, pgsodium, pgvector, pg_graphql, pgjwt) available by default.
- Storage: S3-compatible via `S3_ENDPOINT`. MinIO locally, Cloudflare R2 in prod. Never hardcode bucket URLs.
- Lint: `eslint` flat config. Types strict + `noUncheckedIndexedAccess`.
- Tests: vitest (unit), playwright (smoke PR, integration main).
- Commits: Conventional Commits.

## Deploy target
{{DEPLOY_TARGET}}

## Commands
- `/ship` — lint + typecheck + vitest + build + secret-scan
- `/deploy-test` — trigger test deploy
- `/add-adr` — new DECISIONS.md entry
- `/smoke` — playwright smoke locally
- `/db-push` — apply schema to local dev DB

## Do not
- Add static AWS keys. Use OIDC.
- Use `any`. Use `unknown` + narrowing.
- Add telemetry SDKs. Banned by CI.
- Write raw SQL migrations outside `drizzle/`.
- Commit secrets. Use `.env` (gitignored) + GitHub Secrets.
- Couple to cloud Supabase unless explicitly greenlit. Default is self-hosted `supabase/postgres` image.
