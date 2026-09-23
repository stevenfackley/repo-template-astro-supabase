# Architecture Decision Log

Append new entries at the bottom. Never rewrite history — supersede with a new ADR.

## ADR-0 — Template bootstrap
Date: {{DATE}}
Context: Bootstrapped from `stevenfackley/repo-template-astro-supabase`.
Decision: Astro 6 SSR + Node adapter, Drizzle ORM on self-hosted `supabase/postgres`, R2/S3 object storage (MinIO locally), deploy via {{DEPLOY_TARGET}}.
Consequences: Opinionated stack; changes require a follow-up ADR. Cloud Supabase is an opt-in swap via `DATABASE_URL`.

## ADR-1 — vitest 4 → 5
Date: 2026-09-22
Context: Dependabot #19 bumped vitest 4.1.11 → 5.0.1 (devDependency). template-check renders the template, then runs lint, typecheck (covers `vitest.config.ts`), `vitest run` and build; all green on 5.0.1.
Decision: Take the major. The config needed no change; the template ships no unit tests yet, so the gate proves config load and types, not test semantics.
Consequences: vitest 5 warns that `__dirname` in `vitest.config.ts` is unsupported by Vite's future native config loader; switch to `import.meta.dirname` before that becomes the default.
