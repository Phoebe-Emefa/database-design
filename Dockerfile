FROM postgres:latest
WORKDIR /usr/src/app

COPY ./hospital_management_systemz /docker-entrypoint-initdb.d/

