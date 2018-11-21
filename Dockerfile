FROM emnili/rpi-alpine-scratch

Maintainer Guenther Morhart

ENV LANG C.UTF-8
ENV TZ Europe/Berlin

RUN apk update && apk upgrade && apk add nginx openssl vim && rm -rf /var/cache/apk/*
	
RUN ln -sf /dev/stdout /var/log/nginx/access.log
RUN ln -sf /dev/stderr /var/log/nginx/error.log

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
