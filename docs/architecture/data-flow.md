# Data flow

```
Client --HTTP--> Astro SSR --drizzle--> supabase/postgres
                     |            \
                     |             +--> S3 SDK --> R2 (prod) / MinIO (local)
                     +--> render HTML + React islands --> Client
```

Static assets served directly from `dist/client/`. API routes live under `src/pages/api/` (or top-level `.ts` files with exported HTTP verb functions). Large/user-uploaded blobs go to R2/S3, never to the DB.
