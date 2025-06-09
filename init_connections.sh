#!/bin/bash

echo "🔗 Initializing Airflow Connections..."

airflow connections delete 'ex_postgres' || true

airflow connections add 'ex_postgres' \
    --conn-type 'postgres_type' \
    --conn-host 'xxx.xx.xxx.xx' \
    --conn-login 'xxxx' \
    --conn-password 'xxxxxxxx' \
    --conn-schema 'xxxxxxx' \
    --conn-port xxxx \
    --conn-extra '{"options": "-c search_path=airflow"}'
