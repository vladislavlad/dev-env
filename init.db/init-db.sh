#!/bin/sh
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
    CREATE USER accounts WITH PASSWORD 'accounts';
    CREATE DATABASE accounts;
    GRANT ALL PRIVILEGES ON DATABASE accounts TO accounts;

    CREATE USER munes WITH PASSWORD 'munes';
    CREATE DATABASE munes;
    GRANT ALL PRIVILEGES ON DATABASE munes TO munes;
EOSQL