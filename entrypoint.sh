#!/bin/sh

RED='\033[0;31m'
NC='\033[0m'

if [ -z "$API_BASE_URL" ]; then
    printf "${RED}[ERROR] API_BASE_URL is not set.${NC}\n"
    printf "${RED}        Please restart the container with:${NC}\n"
    printf "${RED}        docker run -e API_BASE_URL=https://your-api.com ...${NC}\n"
    exit 1
fi

envsubst '${API_BASE_URL}' < /etc/nginx/nginx.conf.template > /etc/nginx/nginx.conf
exec nginx -g 'daemon off;'
