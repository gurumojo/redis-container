FROM redis:alpine

EXPOSE 6379

LABEL gurumojo.service=redis

ENV POLL_TIMEOUT 100

HEALTHCHECK --interval=10s \
	--timeout=3s \
	--retries=3 \
	CMD curl -f http://localhost:80/

RUN apk --no-cache add rsync &&\
	env && date
