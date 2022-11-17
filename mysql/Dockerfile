# mysql image
FROM mysql:latest

# Set root password and working database
ENV MYSQL_ROOT_PASSWORD=secret MYSQL_DATABASE=kafka_test_db

# Add create table dll for database
COPY init.sql /docker-entrypoint-initdb.d/