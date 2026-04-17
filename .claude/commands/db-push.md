---
description: Push drizzle schema to local dev DB without generating migrations.
---

1. Confirm `DATABASE_URL` in `.env.dev` targets local Postgres.
2. `npm run db:push`.
3. Report tables changed.

Never run against a non-dev URL.
