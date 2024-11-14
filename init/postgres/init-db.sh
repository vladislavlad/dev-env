#!/bin/sh
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
    CREATE USER accounts WITH PASSWORD 'accounts';
    CREATE DATABASE accounts WITH OWNER accounts;
    GRANT ALL PRIVILEGES ON DATABASE accounts TO accounts;

    CREATE USER munes WITH PASSWORD 'munes';
    CREATE DATABASE munes WITH OWNER munes;
    GRANT ALL PRIVILEGES ON DATABASE munes TO munes;

    CREATE USER trading WITH PASSWORD 'trading';
    CREATE DATABASE trading WITH OWNER trading;
    GRANT ALL PRIVILEGES ON DATABASE trading TO trading;

    CREATE USER comments WITH PASSWORD 'comments';
    CREATE DATABASE comments WITH OWNER comments;
    GRANT ALL PRIVILEGES ON DATABASE comments TO comments;
EOSQL