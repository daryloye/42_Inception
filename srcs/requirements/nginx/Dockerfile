FROM debian:bullseye

RUN apt-get update && apt-get install -y nginx openssl

# copy files from local machine to docker image
COPY certs/ /etc/nginx/certs/
COPY conf/ /etc/nginx/

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
