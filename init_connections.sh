#!/bin/bash

echo "🔗 Initializing Airflow Connections..."

airflow connections delete 'ex_postgres' || true

airflow connections add 'ex_postgres' \
    --conn-type 'postgres' \
    --conn-host '172.27.154.25' \
    --conn-login 'gi.joke' \
    --conn-password 'Tawatcha1@2021' \
    --conn-schema 'opendata' \
    --conn-port 5432 \
    --conn-extra '{"options": "-c search_path=airflow"}'
