FROM mysql:5.7.25
LABEL "Project"="VProfile"
LABEL "Author"="rosrain"

ENV MYSQL_ROOT_PASSWORD="admin123"
ENV MYSQL_DATABASE="accounts"

ADD docker-files/db/db_backup.sql docker-entrypoint-initdb.d/db_backup.sql

