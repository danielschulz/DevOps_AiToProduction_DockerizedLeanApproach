#!/usr/bin/env bash

# TODO: CHECK OR CHANGE ME
# extact and upload files
# definition: ${HOME} is the user's home folder on the remote server
# this path points to the root folder of the git repo for `mxnet`
export FS_PATH_MXNET_HOME="${HOME}/DSC/reports/aiToProd/models/mxnet/"


# deploy MXNet model DeepLearning, Docker Container w/ model path mapping
# deploy TF model Iris, Tensorflow Docker Container w/ model path mapping
# - bind to localhost (IPv4) resp. 127.0.0.1 network interface --
#     will only be accessible from server and through SSH tunnel;
#     not even firewall-relevant network traffic from outside needs to be managed for it
# - map the Model Server's config file and the therein referenced model both as read-only files inside a Volume
# - gets 256 MiB of RAM wo/ Swap and 10% of one CPU core
docker run \
    -d \
    --name daniel-mxnet-server-deeplearning \
    -h 127.0.0.1 \
    -p 2308:8080 \
    -v ${FS_PATH_MXNET_HOME}/mms_app_cpu.conf:/mxnet_model_server/mms_app_cpu.conf:ro \
    -v ${FS_PATH_MXNET_HOME}/squeezenet_v1.1.model:/mxnet_model_server/squeezenet_v1.1.model:ro \
    --memory="256m" --memory-swap="256m" \
    --cpus=".1" \
    awsdeeplearningteam/mms_cpu mxnet-model-server start --mms-config /mxnet_model_server/mms_app_cpu.conf

# inspect Docker Volumes and Docker Containers 4 secs after starting --
# the last command is a comment for the Bash history to reveal it
# later on in case you need to step into the Container for debugging reasons
docker exec daniel-mxnet-server-deeplearning ls -alshR /mxnet_model_server/
sleep 4 && docker ps -a | grep daniel-mxnet-server-deeplearning && docker ps -a
# docker exec -it daniel-mxnet-server-deeplearning bash




# UNDEPLOY --
# WARNING: removes all runtime information again; persistent data (Volumes and Images) will remain untouched
# remove Docker Container
docker rm -f daniel-mxnet-server-deeplearning
docker ps -a
