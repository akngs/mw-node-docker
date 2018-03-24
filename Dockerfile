FROM debian:sid
LABEL maintainer="jania902@gmail.com"

# Install debian packages
RUN set -x \
  && apt update \
  && apt install -y --no-install-recommends \
    build-essential \
    ca-certificates \
    curl \
    gettext-base \
    git \
    npm \
  && rm -rf /var/lib/apt/lists/* \
  && rm -rf /var/cache/apt/archives/*

# Install restbase
RUN set -x \
  && mkdir -p /usr/src \
  && cd /usr/src \
  && git clone https://github.com/wikimedia/restbase.git \
  && cd restbase \
  && npm install \
  && npm install wikimedia/parsoid \
  && cd .. \
  && ( find . -type d -name ".git" && find . -name ".gitignore" && find . -name ".gitmodules" ) | xargs rm -rf

COPY config.yaml /usr/src/restbase/config_template.yaml

EXPOSE 7231
COPY entrypoint.sh /entrypoint.sh
CMD ["/entrypoint.sh"]
