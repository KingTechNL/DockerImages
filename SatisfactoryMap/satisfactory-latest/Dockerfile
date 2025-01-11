FROM ubuntu:24.04

ARG TARGETARCH

# Copy scripts to docker image
COPY SatisfactoryMap/satisfactory-latest/cronjobs /etc/cron.d/cronjobs
COPY SatisfactoryMap/satisfactory-latest/update-save.sh /update-save.sh
RUN chmod +x /update-save.sh

# Install cron
RUN apt-get update && apt-get -y install cron

# Give execution rights on the cron job
RUN chmod 0644 /etc/cron.d/cronjobs

# Apply cron job
RUN crontab /etc/cron.d/cronjobs

# Create the log file to be able to run tail
RUN touch /var/log/cron.log

# start crond with log level 8 in foreground, output to stderr
CMD ["cron", "-f"]
