# Self-hosting

## Minimum
- x86_64 Linux or arm64. 1 GB RAM (Postgres + app). Docker 24+.
- `supabase/postgres` container reachable via `DATABASE_URL`.
- S3-compatible bucket (Cloudflare R2 recommended) reachable via `S3_ENDPOINT` + `S3_*` creds.

## Compose
```
IMAGE_REF=ghcr.io/stevenfackley/{{PROJECT_NAME}}@sha256:<digest> \
  docker compose -f docker-compose.yml -f docker-compose.prod.yml up -d
```

## Reverse proxy
Terminate TLS upstream (nginx / Caddy / ingress). Proxy `:4321` → the container. Forward `X-Forwarded-Proto` and `X-Forwarded-For`.

## Managed alternatives
- DB: swap `DATABASE_URL` to a Supabase Cloud connection string when free-tier headroom is gone.
- Storage: set `S3_ENDPOINT=https://<account-id>.r2.cloudflarestorage.com` and drop the `minio` + `minio-init` services from compose.
