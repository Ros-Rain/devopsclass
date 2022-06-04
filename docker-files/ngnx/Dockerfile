FROM nginx
LABEL "Project"="VProfile"
LABEL "Author"="rosrain"

RUN rm -f /etc/nginx/conf.d/default.conf
COPY docker-files/ngnx/vproapp.conf /etc/nginx/conf.d/

