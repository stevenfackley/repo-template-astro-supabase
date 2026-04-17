---
description: Trigger a test deploy via GitHub Actions workflow_dispatch.
---

1. Confirm current branch is pushed.
2. `gh workflow run deploy-test.yml --ref $(git branch --show-current)`
3. `gh run watch` on the newest run id.
4. After green, curl the test `/healthz` and report the response body.
