FROM debian:bullseye

RUN apt-get update && \
	apt-get install -y curl gnupg lsb-release && \
	curl -LsS https://r.mariadb.com/downloads/mariadb_repo_setup | bash && \
	apt-get install -y mariadb-server

COPY conf/* /etc/mysql/mariadb.conf.d/
COPY tools/* /
RUN chmod +x /entrypoint.sh

# RUN echo "\n[mysqld]\nskip-networking=0\nskip-bind-address" >> /etc/mysql/mariadb.cnf

EXPOSE 3306

CMD ["/entrypoint.sh"]
