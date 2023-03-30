#!/bin/bash
set -e



psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE USER docker_demaster;
    CREATE DATABASE docker_demaster_db;
    GRANT ALL PRIVILEGES ON DATABASE docker_demaster_db TO docker_demaster;
    --file=/init_db/init_db_sql/init.sql;
EOSQL


psql --username "$POSTGRES_USER" -d docker_demaster_db -a -f /init_db/init_db_sql/init.sql


psql --username "$POSTGRES_USER" -d docker_demaster_db -c "COPY cars FROM '/init_db/init_db_csv/cars.csv' DELIMITERS ',' CSV HEADER"