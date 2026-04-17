# ERD

Source of truth: `src/db/schema.ts`. Regenerate diagrams with `drizzle-kit studio` locally (`npm run db:studio`).

## Starter tables
- `users(id, email UNIQUE, created_at)`

## Available Postgres extensions
Enabled automatically by the `supabase/postgres` image — use them directly in your Drizzle schema or raw SQL migrations:
- `pgcrypto` — UUIDs, hashing
- `pgsodium` — server-side encryption
- `pgvector` — embedding columns
- `pg_graphql` — optional GraphQL layer (unused by default)
- `pgjwt` — JWT signing
- `pg_stat_statements` — query telemetry
