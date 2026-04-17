# Testing strategy

Progressive pyramid, cheapest first.

| Layer | Tool | Scope | When |
|---|---|---|---|
| unit | vitest | pure modules | every run |
| integration | vitest | db + server utils, real Postgres service in CI | PR |
| e2e-smoke | playwright `smoke` project | `/healthz`, root render | PR |
| e2e-integration | playwright `integration` project | user flows against test env | main |
| nightly | playwright full | cross-browser, flaky-hunter | scheduled |

## DB in tests
Tests use a real Postgres service (CI spins one up via the reusable workflow). Never mock drizzle — mocks drift from prod behavior.

## Fixtures
Seed via `db/init/01-init.sql` (extensions only) + drizzle migrations.
