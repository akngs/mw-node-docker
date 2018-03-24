#!/bin/sh
cd /usr/src/restbase
envsubst '${MEDIAWIKI_PROTOCOL} ${MEDIAWIKI_SITE_SERVER}' < config_template.yaml > config.yaml
exec node server.js -c config.yaml -n 1