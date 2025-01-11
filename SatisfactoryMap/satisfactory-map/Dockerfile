FROM nginx

ARG TARGETARCH
ARG USER_DOMAIN
ENV USER_DOMAIN $USER_DOMAIN

COPY SatisfactoryMap/satisfactory-map/nginx.conf /nginx.conf.tmpl
RUN envsubst < /nginx.conf.tmpl > /etc/nginx/nginx.conf
