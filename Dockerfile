FROM redis:alpine

RUN apk --no-cache add bash rsync \
	&& date -Iseconds && env

COPY healthcheck.sh /usr/local/bin/container-healthcheck

HEALTHCHECK --interval=10s --timeout=3s --retries=3 \
	CMD ["container-healthcheck"]

LABEL gurumojo.service=redis

ENV POLL_TIMEOUT 100

EXPOSE 6379
