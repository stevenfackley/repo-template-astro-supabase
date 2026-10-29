# Rollback

## EC2 (SSH)
1. SSH, `cd $EC2_APP_DIR`.
2. `export IMAGE_REF=ghcr.io/stevenfackley/{{PROJECT_NAME}}@sha256:<last-good-digest>`
3. `IMAGE_REF=$IMAGE_REF docker compose pull && IMAGE_REF=$IMAGE_REF docker compose up -d`
4. `curl http://localhost:4321/healthz`

## DB
Roll forward only. If a migration broke prod, write a new migration that un-does it; never `drizzle-kit drop`.
