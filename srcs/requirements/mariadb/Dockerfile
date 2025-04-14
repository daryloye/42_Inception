FROM debian:bullseye

RUN apt-get update && \
	apt-get install -y curl gnupg lsb-release && \
	curl -LO https://r.mariadb.com/downloads/mariadb_repo_setup && \
	chmod +x mariadb_repo_setup && \
	./mariadb_repo_setup --mariadb-server-version=11.0 && \
	apt-get install -y mariadb-server

COPY conf/* /etc/mysql/mariadb.conf.d/
COPY tools/* /
RUN chmod +x /entrypoint.sh

EXPOSE 3306

CMD ["/entrypoint.sh"]
