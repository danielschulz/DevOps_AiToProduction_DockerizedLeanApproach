#!/usr/bin/env bash


# Docker Daemon control via web ui
# - webui.docker.devops.svc.cluster.local:1206
# - bind to localhost (IPv4) resp. 127.0.0.1 network interface --
#     will only be accessible from server and through SSH tunnel;
#     not even firewall-relevant network traffic from outside needs to be managed for it
# - only map the Docker Daemon's TCP socket inside the Container Jail for it to speak to the Docker Daemon from with
# - no user data mapping through Docker Volumes needed here -- might be better to add in production environments
# - gets 128 MiB of RAM wo/ Swap and 8.125% of one CPU core
docker run \
    -d \
    --name daniel-docker-daemon-ui \
    -h 127.0.0.1 \
    -p 1206:9000 \
    -v /var/run/docker.sock:/var/run/docker.sock \
    --memory="128m" --memory-swap="128m" \
    --cpus=".08125" \
    portainer/portainer

# inspect Docker Containers 2 secs after starting -- the last command is a comment for the Bash history to reveal it
# later on in case you need to step into the Container for debugging reasons
sleep 2 && docker ps -a | grep daniel-docker-daemon-ui && docker ps -a
# docker exec -it daniel-mxnet-server-deeplearning bash



# Query the deployed service -- from server itself
time curl -X GET \
    http://localhost:1206 \
    -H 'cache-control: no-cache' \
    && echo $?




# Query the deployed service -- from remote client
time curl -X GET \
    http://webui.docker.devops.svc.cluster.local:1206 \
    -H 'cache-control: no-cache' \
    && echo $?




# UNDEPLOY --
# WARNING: removes all runtime information again; persistent data (Volumes and Images) will remain untouched
# remove Docker Container
docker rm -f daniel-docker-daemon-ui
docker ps -a
