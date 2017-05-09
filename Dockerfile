FROM redis:alpine

LABEL gurumojo.service=redis

EXPOSE 6379

COPY healthcheck.sh /usr/local/bin/container-healthcheck
HEALTHCHECK --interval=10s --timeout=3s --retries=3 \
	CMD ["container-healthcheck"]

RUN apk --no-cache add bash rsync \
	&& date -Iseconds && env
VOLUME /data
