FROM nginx:1.26-alpine
RUN apk --no-cache add curl bash

# Gather environment variables.
ARG TARGETARCH
ARG DOMAIN_NAME
ARG SCHEME=https
ENV DOMAIN_NAME=$DOMAIN_NAME
ENV SCHEME=$SCHEME

# Copy NGinx config file.
COPY SatisfactoryMap/satisfactory-map/nginx.conf /nginx.conf.tmpl

# Copy scripts for cron-job
COPY SatisfactoryMap/satisfactory-latest/cronjobs /etc/cron.d/cronjobs
COPY SatisfactoryMap/satisfactory-latest/update-save.sh /update-save.sh
RUN chmod +x /update-save.sh

# Copy entrypoint and give it permission to run.
COPY SatisfactoryMap/satisfactory-map/entrypoint.sh .
RUN chmod +x entrypoint.sh
RUN dos2unix entrypoint.sh

# Setup cron job.
RUN chmod 0644 /etc/cron.d/cronjobs
RUN crontab /etc/cron.d/cronjobs
RUN touch /var/log/cron.log

# Start container using entrypoint script
ENTRYPOINT [ "./entrypoint.sh" ]