---
description: Run playwright smoke suite against local dev server.
---

1. Ensure `docker compose up -d db` is running.
2. `npm run dev` in background if not already up.
3. `npx playwright test --project=smoke`.
4. Report pass/fail per test.
