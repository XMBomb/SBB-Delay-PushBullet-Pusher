FROM node:10-jessie
RUN apt-get update && apt-get -y install -qq --force-yes cron
RUN git clone https://github.com/mbharanya/SBB-Delay-PushBullet-Pusher.git /project
WORKDIR /project
RUN npm i
COPY cron /etc/cron.d/cron
# Give execution rights on the cron job
RUN chmod 0644 /etc/cron.d/cron
# Apply cron job
RUN crontab /etc/cron.d/cron
# Run the command on container startup
CMD ["cron", "-f"]
