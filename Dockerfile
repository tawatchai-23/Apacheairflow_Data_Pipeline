FROM apache/airflow:2.10.4

USER root

# Install system dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    curl \
    && rm -rf /var/lib/apt/lists/*

USER airflow

# Install Python dependencies
RUN pip install --no-cache-dir \
    geopandas \
    shapely \
    fiona \
    requests \
    psycopg2-binary \
    pendulum

# Set environment variables
ENV AIRFLOW__CORE__EXECUTOR=LocalExecutor
ENV AIRFLOW__CORE__FERNET_KEY=''
ENV AIRFLOW__CORE__DAGS_ARE_PAUSED_AT_CREATION='true'
ENV AIRFLOW__CORE__LOAD_EXAMPLES='true'
ENV AIRFLOW__API__AUTH_BACKENDS='airflow.api.auth.backend.basic_auth,airflow.api.auth.backend.session'
ENV AIRFLOW__SCHEDULER__ENABLE_HEALTH_CHECK='true'
ENV AIRFLOW__SMTP__SMTP_HOST=mailhog
ENV AIRFLOW__SMTP__SMTP_STARTTLS='false'
ENV AIRFLOW__SMTP__SMTP_SSL='false'
ENV AIRFLOW__SMTP__SMTP_PORT=1025

# Create necessary directories
RUN mkdir -p /opt/airflow/dags \
    /opt/airflow/logs \
    /opt/airflow/config \
    /opt/airflow/plugins \
    /opt/airflow/dbt/weather

# Set the working directory
WORKDIR /opt/airflow 