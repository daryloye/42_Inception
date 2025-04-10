FROM debian:bullseye

RUN apk update && apk add --no-cache nginx openssl

COPY conf/nginx.conf /etc/nginx/nginx.conf
COPY certs/ /etc/nginx/certs/
COPY html/ /usr/share/nginx/html/

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
