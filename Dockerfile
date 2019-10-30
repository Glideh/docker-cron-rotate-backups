FROM python:3.7-alpine

ENV ROTATE_CRON=""
ENV ROTATE_OPTIONS=""

RUN pip install rotate-backups

RUN mkdir /data

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["sh", "/entrypoint.sh"]

CMD ["crond", "-f", "-l", "0"]
