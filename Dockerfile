FROM node:8-alpine
LABEL maintainer="jania902@gmail.com"

# Install node dependencies
RUN apk add --no-cache --virtual .build-deps git
COPY package.json /src/
COPY package-lock.json /src/
WORKDIR /src
RUN npm install
RUN mkdir -p /data
RUN apk del .build-deps

# Copy other files
COPY entrypoint.sh /src/
COPY config.yaml /src/
COPY server.js /src/

EXPOSE 7231

CMD ["/src/entrypoint.sh"]
