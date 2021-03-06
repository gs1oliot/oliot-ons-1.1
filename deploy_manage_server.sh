#!/bin/bash

# populate environment variables
set -a
source .env

# replace variables in conf file
envsubst < ./web-api/conf.template > ./web-api/conf.json
envsubst < ./web-app/conf.template > ./web-app/conf.json

# run
docker-compose -f compose_manage_server.yml up
#sleep 20

# insert constraints for Neo4j
#docker exec acl_neo4j /var/lib/neo4j/bin/neo4j-shell -file /var/lib/neo4j/import/constraints.cql
