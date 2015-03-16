: ${POSTGRES_USER:=postgres}
: ${POSTGRES_PASSWORD:=postgres}
: ${POSTGRES_DB:=postgres}
: ${DB_ENCODING:=UTF-8}
: ${DB_PG_DUMP_FILE:=/tmp/db.pgdump}

echo "*** Importing file $DB_PG_DUMP_FILE into database $POSTGRES_DB***"

ls /tmp

gosu postgres pg_ctl start -w
gosu postgres pg_restore -d "$POSTGRES_DB" "$DB_PG_DUMP_FILE"
gosu postgres pg_ctl stop -w

#gosu postgres psql -d "$DB_NAME" -f "$DB_PG_DUMP_FILE"