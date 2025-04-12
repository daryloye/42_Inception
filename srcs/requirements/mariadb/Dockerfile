FROM debian:bullseye

RUN apt-get update && \
	apt-get install -y curl gnupg lsb-release && \
	curl -LsS https://r.mariadb.com/downloads/mariadb_repo_setup | bash && \
	apt-get install -y mariadb-server

# RUN mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld && mkdir -p /var/lib/mysqld && chown -R mysql:mysql /var/lib/mysqld

COPY conf/* /etc/mysql/mariadb.conf.d/
COPY tools/* /
RUN chmod +x /entrypoint.sh

# RUN echo "\n[mysqld]\nskip-networking=0\nskip-bind-address" >> /etc/mysql/mariadb.cnf

EXPOSE 3306

CMD ["/entrypoint.sh"]
