#!/bin/bash

rm -f /app/market/build/libs/market.jar

./gradlew build > /dev/null 2>&1

cd ./app/docker

docker-compose up -d

