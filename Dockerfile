ARG BASE_IMAGE=library/node:16-alpine

FROM docker.io/${BASE_IMAGE}

ARG TIMELIMIT_REPO=https://codeberg.org/timelimit/timelimit-server
ARG TIMELIMIT_TAG=2024-07-30

WORKDIR /opt/timelimit
RUN <<-EOT sh
	set -eu

	wget ${TIMELIMIT_REPO}/archive/${TIMELIMIT_TAG}.tar.gz -O - \
		| tar -xzv --strip-components=1

	mkdir -p docs/schema
	npm install --exclude=optional && npm run build && npm prune --omit=dev
	rm -rf ./src
EOT

EXPOSE 8080/tcp

HEALTHCHECK --interval=1m --timeout=3s \
  CMD timeout 2 nc -z 127.0.0.1 8080

CMD [ "npm", "start" ]
