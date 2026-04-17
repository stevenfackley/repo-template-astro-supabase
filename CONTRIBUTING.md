# Contributing

1. Branch off `main`: `feat/<short-name>` or `fix/<short-name>`.
2. Conventional Commits.
3. Before PR: `/ship` (lint, typecheck, tests, build, secret-scan).
4. PRs require `ci` + `secret-scan` green. One approving review unless solo.
5. Schema change? `npm run db:generate` and commit the SQL in `drizzle/`.
6. Architectural decision? Add an ADR via `/add-adr`.
