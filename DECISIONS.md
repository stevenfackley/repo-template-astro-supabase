# Architecture Decision Log

Append new entries at the bottom. Never rewrite history — supersede with a new ADR.

## ADR-0 — Template bootstrap
Date: {{DATE}}
Context: Bootstrapped from `stevenfackley/repo-template-astro-supabase`.
Decision: Astro 7 SSR + Node adapter, Drizzle ORM on self-hosted `supabase/postgres`, R2/S3 object storage (RustFS locally), deploy via {{DEPLOY_TARGET}}.
Consequences: Opinionated stack; changes require a follow-up ADR. Cloud Supabase is an opt-in swap via `DATABASE_URL`.

## ADR-1 — vitest 4 → 5
Date: 2026-09-22
Context: Dependabot #19 bumped vitest 4.1.11 → 5.0.1 (devDependency). template-check renders the template, then runs lint, typecheck (covers `vitest.config.ts`), `vitest run` and build; all green on 5.0.1.
Decision: Take the major. The config needed no change; the template ships no unit tests yet, so the gate proves config load and types, not test semantics.
Consequences: vitest 5 warns that `__dirname` in `vitest.config.ts` is unsupported by Vite's future native config loader; switch to `import.meta.dirname` before that becomes the default.

## ADR-2 — minimatch 10 → 11 via npm override
Date: 2026-11-02
Context: GHSA-g3hv-75wg-m249 (medium, DoS via globparts amplification) is fixed only in minimatch 11.0.1; no 10.x backport exists. Every parent in the tree (eslint, @eslint/config-array, @typescript-eslint/typescript-estree) still declares `^10.x`, so a lock-only `npm update` cannot reach the fix.
Decision: Pin `"minimatch": "^11.0.1"` in `package.json` `overrides` (resolves 11.0.4 today). The 11 major removes `makeRe()`, `Minimatch#regexp`, the `AST` class, `matchOne()`, `debug` and `maxExtglobRecursion`; the three parents only call `new Minimatch(pattern, { dot: true })`, `.match(path[, partial])`, `.pattern` and the plain `minimatch()` function, none of which changed.
Consequences: Remove the override once eslint and typescript-estree declare `^11` themselves. Watch the 11.x behaviour change that `a/b/` no longer matches `a/b/?(x)`; eslint's config globs do not use extglobs, so lint results should be unchanged.
