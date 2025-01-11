FROM nginx:1.26-alpine

ARG TARGETARCH
ARG USER_DOMAIN
ENV USER_DOMAIN $USER_DOMAIN

COPY SatisfactoryMap/satisfactory-map/nginx.conf /nginx.conf.tmpl
COPY SatisfactoryMap/satisfactory-map/entrypoint.sh .
RUN chmod +x entrypoint.sh
RUN dos2unix entrypoint.sh
#RUN envsubst < /nginx.conf.tmpl > /etc/nginx/nginx.conf
#CMD ["nginx-debug", "-g", "daemon off;"]
ENTRYPOINT [ "./entrypoint.sh" ]