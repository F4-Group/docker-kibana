#!/bin/bash
ES_HOST=${ES_HOST:-window.location.hostname}
ES_PORT=${ES_PORT:-9200}

CONFIG_FILE="/usr/share/nginx/www"

function config_replace() {
    CMD="s/{{$1}}/$2/g"
    sed -i'.bak' -e ${CMD} ${CONFIG_FILE}
}

config_replace "ES_HOST" "$ES_HOST"
config_replace "ES_PORT" "$ES_PORT"

nginx -c /etc/nginx/nginx.conf
