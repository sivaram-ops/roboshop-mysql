FROM mysql:5.7
COPY shipping.sql /docker-entrypoint-initdb.d/shipping.sql