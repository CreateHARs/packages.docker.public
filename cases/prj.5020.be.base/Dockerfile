FROM ubuntu:jammy

ARG DEBIAN_FRONTEND=noninteractive
ARG TZ=Asia/Tokyo
ARG DOCKER_IMAGE_NAME_TEMPLATE="docker.images.lapisys.com/prj.5020.be.base:ubuntu-jammy-v%version%"

RUN apt-get update && \
    apt-get install -y curl wget gpg && \
    curl -sL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y nodejs && \
    apt-get install -y --no-install-recommends git openssh-client && \
    rm -rf /var/lib/apt/lists/* && \
    adduser pwuser

ENV PLAYWRIGHT_VERSION=1.37.1
ENV PLAYWRIGHT_BROWSERS_PATH=/ms-playwright

RUN mkdir /ms-playwright && \
    mkdir /ms-playwright-agent && \
    cd /ms-playwright-agent && npm init -y && \
    npm i playwright-core@${PLAYWRIGHT_VERSION} && \
    npm exec --no -- playwright-core mark-docker-image "${DOCKER_IMAGE_NAME_TEMPLATE}" && \
    npm exec --no -- playwright-core install --with-deps && rm -rf /var/lib/apt/lists/* && \
    rm -rf /ms-playwright-agent && \
    chmod -R 777 /ms-playwright

RUN mkdir /docker-workdir
WORKDIR /docker-workdir
EXPOSE 3000

CMD ["ping","127.0.0.1","-c","100"]
