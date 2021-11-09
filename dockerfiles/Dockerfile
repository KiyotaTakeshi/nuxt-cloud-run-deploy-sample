FROM nginx:1.21.3-alpine

RUN apk update
COPY dist /usr/share/nginx/html
COPY dockerfiles/conf.d/default.conf /etc/nginx/conf.d/default.conf

EXPOSE 80 443

CMD nginx -g 'daemon off;'
