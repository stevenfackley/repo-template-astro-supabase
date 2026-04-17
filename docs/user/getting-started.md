# Getting started

## Prereqs
- Node 22+, Docker Desktop, PowerShell 7.

## Run
```
docker compose up -d db minio minio-init
npm ci
cp .env.dev .env
npm run db:push
npm run dev
```

Open http://localhost:4321. `/healthz` returns JSON. MinIO console is http://localhost:9001 (minioadmin/minioadmin).

## Hot-reload
Astro HMR is on for `.astro`, `.ts`, `.tsx`. Schema changes need `npm run db:push` to re-sync the dev DB.

## Swapping to Cloudflare R2
Set these prod secrets, leave the rest of the app untouched:
```
S3_ENDPOINT=https://<account-id>.r2.cloudflarestorage.com
S3_ACCESS_KEY_ID=<r2-token-id>
S3_SECRET_ACCESS_KEY=<r2-token-secret>
S3_BUCKET=<prod-bucket>
```

## Swapping to cloud Supabase (optional)
Point `DATABASE_URL` at your Supabase connection string. No other app changes required since Drizzle connects directly to Postgres.
