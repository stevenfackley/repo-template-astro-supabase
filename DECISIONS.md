# Architecture Decision Log

Append new entries at the bottom. Never rewrite history — supersede with a new ADR.

## ADR-0 — Template bootstrap
Date: {{DATE}}
Context: Bootstrapped from `stevenfackley/repo-template-astro-supabase`.
Decision: Astro 6 SSR + Node adapter, Drizzle ORM on self-hosted `supabase/postgres`, R2/S3 object storage (MinIO locally), deploy via {{DEPLOY_TARGET}}.
Consequences: Opinionated stack; changes require a follow-up ADR. Cloud Supabase is an opt-in swap via `DATABASE_URL`.
