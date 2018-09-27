#!/usr/bin/env bash

if [ "$1" == "clean" ]; then
  echo "Cleaning existing postgres data volumes"
  docker rm $(docker ps -aq -f "name=postgresdb_1")
  docker volume rm $(docker volume ls -q | grep pgdata)
else
  echo "Reusing existing data volumes"
fi

ENV_FILE='docker-compose.env'
if [ -f $ENV_FILE ]; then
    export $(grep -v '^#' $ENV_FILE | xargs -0)
fi

docker-compose up --remove-orphans
