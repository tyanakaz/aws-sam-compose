#!/bin/sh

docker-compose build --force-rm
docker-compose up
docker-compose run aws-sam-cli sam init --runtime python
