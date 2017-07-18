#!/bin/bash
docker rm -fv bigchaindb
docker-compose -f ./bin/docker-compose.yml up bigchaindb &
rails server -p 7001