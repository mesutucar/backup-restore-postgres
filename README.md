### Backup & restore AWS RDS PostgreSQL instance with multiple DBs
---
* Backup schema:
```console
pg_dumpall -h <old-db-url> --no-role-passwords -U postgres --schema-only > definition_only.sql
```

* Restore the schema:
```console
psql -h <new-db-url> -U postgres -f definition_only.sql
```

* Setup old users' passwords:
```console
ALTER USER "user_name" with encrypted password 'passwd';
ALTER USER "user_name" with LOGIN;
```
Reason: Amazon RDS for PostgreSQL rds_superuser role doesn’t have permission on the pg_authid table, it’s important to use --no-role-passwords with pg_dumpall while dumping data.

* Time to backup & restore:
```console
./backup.sh
./restore.sh
```
