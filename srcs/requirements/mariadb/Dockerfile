FROM debian:bullseye

RUN apt-get update && apt-get install -y mariadb-server

COPY tools/init.sql /init.sql
COPY tools/init.sh /init.sh
RUN chmod +x /init.sh

EXPOSE 3306

CMD ["/init.sh"]
