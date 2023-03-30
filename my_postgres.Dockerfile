FROM postgres:alpine

USER root 
# chown -R (recursive) username:group directory
RUN mkdir -p /docker-entrypoint-initdb.d/ && chown -R 70:70 /docker-entrypoint-initdb.d 
USER postgres 
COPY ./docker-entrypoint-initdb.d/ /docker-entrypoint-initdb.d/