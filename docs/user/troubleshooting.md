# Troubleshooting

## `DATABASE_URL is required`
Copy `.env.dev` to `.env` or export `DATABASE_URL` in your shell.

## `ECONNREFUSED 127.0.0.1:5432`
`docker compose up -d db`, then wait for `pg_isready` to return 0.

## `drizzle-kit` complains about missing schema
Run from repo root so `drizzle.config.ts` resolves `./src/db/schema.ts`.

## Playwright can't find the server
CI uses a prebuilt server; locally, `npm run dev` must be running (or the config will auto-start it).
