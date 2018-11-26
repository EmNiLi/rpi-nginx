FROM emnili/rpi-base

Maintainer Guenther Morhart

ENV LANG C.UTF-8
ENV TZ Europe/Berlin

RUN apk update && apk upgrade && apk add nginx openssl vim && rm -rf /var/cache/apk/*
	
RUN ln -sf /dev/stdout /var/log/nginx/access.log
RUN ln -sf /dev/stderr /var/log/nginx/error.log

COPY default.conf /app/nginx.conf
COPY etc/ /etc/nginx/

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
