---
description: Bump the IMAGE_REF on a deployed target to a new SHA.
---

Ask the user for the target SHA.
Compose the new ref: `ghcr.io/stevenfackley/{{PROJECT_NAME}}@sha256:<digest>`.
For EC2: SSH, `export IMAGE_REF=...`, `docker compose pull && up -d`, health-check.
For K3s: `helm upgrade <release> --set api.image.tag=sha-<short>`.
