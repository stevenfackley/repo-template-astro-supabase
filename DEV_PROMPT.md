# Dev cheat sheet — {{PROJECT_NAME}}

## Run locally
```
docker compose up -d db
npm ci
npm run db:push
npm run dev
```

## Test
```
npm run test            # vitest
npx playwright test --project=smoke
npx playwright test --project=integration
```

## Build image
```
docker build -t {{PROJECT_NAME}}:dev .
```

## Deploy test
Push to main → `ci` passes → `deploy-test.yml` fires automatically. Or `gh workflow run deploy-test.yml`.

## Release prod
```
git tag YYYYMMDD_{{PROJECT_NAME}}_Release
git push origin --tags
```
