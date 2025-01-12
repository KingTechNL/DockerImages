FROM nginx:1.26-alpine
RUN apk --no-cache add curl bash

# Gather environment variables.
ARG TARGETARCH
ARG USER_DOMAIN
ARG SCHEME=https
ENV USER_DOMAIN=$USER_DOMAIN
ENV SCHEME=$SCHEME

# Copy NGinx config file.
COPY SatisfactoryMap/satisfactory-mapview/nginx.conf /nginx.conf.tmpl

# Copy scripts for cron-job
COPY SatisfactoryMap/satisfactory-mapview/cronjobs /etc/cron.d/cronjobs
COPY SatisfactoryMap/satisfactory-mapview/update-save.sh /update-save.sh
RUN chmod +x /update-save.sh

# Copy entrypoint and give it permission to run.
COPY SatisfactoryMap/satisfactory-mapview/entrypoint.sh .
RUN chmod +x entrypoint.sh
RUN dos2unix entrypoint.sh

# Setup cron job.
RUN apk --no-cache add cron
RUN chmod 0644 /etc/cron.d/cronjobs
RUN crontab /etc/cron.d/cronjobs
RUN touch /var/log/cron.log


# Start cron using entrypoint script
ENTRYPOINT [ "./entrypoint.sh" ]

# start nginx
CMD ["nginx-debug" '-g' 'daemon off;']
