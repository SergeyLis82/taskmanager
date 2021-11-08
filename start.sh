#!/bin/bash

export PROJECT_DIR=$(pwd)
export DEPLOY_DIR=${PROJECT_DIR}/.deploy
#nginx
export NGINX_IMG="nginx-tm:latest"
export PORT=8080
# gunicorn
export PY_IMG="pygunicorn:latest"
#db
export DTB_IMG="mysql:8.0"
export DTB_PORT=33060
#phpmyadmin
export PMA_IMG="phpmyadmin"
export PMA_PORT=8075

init() {
    if [[ -n "$1" ]]; then
		export PORT=$1;
	fi
    docker-compose -f ${DEPLOY_DIR}/docker-compose.tpl.yml --env-file ${PROJECT_DIR}/.env pull
    docker-compose -f ${DEPLOY_DIR}/docker-compose.tpl.yml --env-file ${PROJECT_DIR}/.env config > ${PROJECT_DIR}/docker-compose.yml
}

up() {
    docker-compose up -d
}

down() {
    docker-compose down
}

case $1 in
    'init') init ;;
    'up') up ;;
    'down') down ;;
    *) echo "No command" ;;
esac;