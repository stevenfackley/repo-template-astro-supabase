# {{PROJECT_NAME}}

Astro 6 SSR app backed by Supabase (`supabase/postgres`) + Drizzle ORM + R2/S3-compatible object storage (MinIO locally).

## Quick start
```bash
docker compose up -d db minio minio-init
npm ci
cp .env.dev .env
npm run db:push
npm run dev
```
Visit http://localhost:4321. MinIO console: http://localhost:9001 (minioadmin/minioadmin). See `C:\Users\steve\projects\DEV_SETUP_GUIDE.md` for workstation setup.

## Scripts
- `npm run dev` — Astro dev (HMR).
- `npm run build` — production build → `dist/`.
- `npm run start` — run the built server.
- `npm run lint` / `npm run typecheck` / `npm run test` / `npm run test:e2e`.
- `npm run db:push` — sync schema to dev DB (no migration files).
- `npm run db:generate` — write migration SQL under `drizzle/`.
- `npm run db:migrate` — apply committed migrations.

## Docs
See `docs/` — product, architecture, runbooks, branding.

## Deploy
Target: `{{DEPLOY_TARGET}}`. Tag `YYYYMMDD_{{PROJECT_NAME}}_Release` triggers `deploy-prod.yml`.

## License
{{YEAR}} {{AUTHOR}}. MIT.
