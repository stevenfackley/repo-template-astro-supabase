# Incident response

1. Open an `ops_incident` issue. Label, detected-at, impact.
2. Check `/healthz` from outside the VPC/network. If red → jump to rollback.
3. Tail container logs.
   - EC2: `ssh $host "docker logs --tail=500 -f {{PROJECT_NAME}}"`
   - K3s: `kubectl logs -n <ns> -l app={{PROJECT_NAME}} --tail=500 -f`
4. Check Postgres: `pg_isready -h <host>`; slow queries via `pg_stat_activity`.
5. If code caused it → rollback (`docs/runbooks/rollback.md`). If data → freeze writes, snapshot, assess.
6. Postmortem within 48h, linked on the incident issue.
