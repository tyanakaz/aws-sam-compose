#!/bin/sh

docker-compose build --force-rm
docker-compose up
docker-compose run aws-sam sam init --runtime python
