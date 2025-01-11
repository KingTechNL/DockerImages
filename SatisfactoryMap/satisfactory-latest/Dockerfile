FROM ubuntu:24.04

ARG TARGETARCH

RUN apt-get update && apt-get -y install cron

# Copy hello-cron file to the cron.d directory
COPY SatisfactoryMap/satisfactory-map/cronjobs /etc/cron.d/cronjobs

# Give execution rights on the cron job
RUN chmod 0644 /etc/cron.d/cronjobs

# Apply cron job
RUN crontab /etc/cron.d/cronjobs

# Create the log file to be able to run tail
RUN touch /var/log/cron.log

# Copy script
COPY SatisfactoryMap/satisfactory-map/update-save.sh /update-save.sh
RUN chmod +x /update-save.sh

# start crond with log level 8 in foreground, output to stderr
CMD ["cron", "-f"]
