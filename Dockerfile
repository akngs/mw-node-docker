FROM node:8
LABEL maintainer="jania902@gmail.com"

# Install node packages
COPY package.json /src/
COPY package-lock.json /src/
WORKDIR /src
RUN npm install
RUN mkdir -p /data

# Copy other files
COPY entrypoint.sh /src/
COPY config.yaml /src/
COPY server.js /src/

EXPOSE 7231

CMD ["/src/entrypoint.sh"]
