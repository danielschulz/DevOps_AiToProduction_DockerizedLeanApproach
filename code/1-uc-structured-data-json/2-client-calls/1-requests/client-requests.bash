#!/usr/bin/env bash


# Query the deployed service for metadata -- from remote client
curl http://iris.devops.svc.cluster.local:2008/v1/models/iris
curl http://iris.devops.svc.cluster.local:2008/v1/models/iris/metadata




# Query the deployed service for payload data -- from remote client
time curl -X POST \
    http://iris.devops.svc.cluster.local:2008/v1/models/iris:classify \
    -H 'cache-control: no-cache' \
    -d '{
 "examples":[
   {"x": [5.1, 3.5, 1.4, 0.2]}
  ]
}' && echo $?


# Slightly altered query the deployed service for payload data -- from remote client
time curl -X POST \
    http://iris.devops.svc.cluster.local:2008/v1/models/iris:classify \
    -H 'cache-control: no-cache' \
    -d '{
 "examples":[
   {"x": [5.0, 3.0, 1.0, 0.0]}
  ]
}' && echo $?
