#!/usr/bin/env bash

mvn clean verify dependency:copy-dependencies &&\
docker build -t lds-postgres:dev -f Dockerfile-dev .
