#!/usr/bin/env bash


# TODO: CHECK OR CHANGE ME
# extact and upload files
# definition: ${HOME} is the user's home folder on the remote server
# this path points to the root folder of the git repo for `tensorflow_serving_tutorial`
export FS_PATH_TFSERVING_HOME="${HOME}/DSC/reports/aiToProd/models/tensorflow/tensorflow_serving_tutorial"

# deploy TF model Iris, Tensorflow Docker Container w/ model path mapping
# - bind to localhost (IPv4) resp. 127.0.0.1 network interface --
#     will only be accessible from server and through SSH tunnel;
#     not even firewall-relevant network traffic from outside needs to be managed for it
# - map the Model Server's referenced model (through the MODEL_NAME env variable) as read-only file inside a Volume
# - gets 256 MiB of RAM wo/ Swap and 8.125% of one CPU core
docker run \
    -d \
    --name daniel-tf-server-iris \
    -h 127.0.0.1 \
    -p 2008:8501 \
    -e MODEL_NAME=iris \
    -v ${FS_PATH_TFSERVING_HOME}/model_volume/models/iris/:/models/iris \
    --memory="256m" --memory-swap="256m" \
    --cpus=".08125" \
    tensorflow/serving

# inspect Docker Volumes and Docker Containers 2 secs after starting twice --
# the last command is a comment for the Bash history to reveal it
# later on in case you need to step into the Container for debugging reasons
docker exec daniel-tf-server-iris ls -alshR /models/iris
sleep 2 && docker ps -a | grep daniel-tf-server-iris && docker ps -a
# docker exec -it daniel-tf-server-iris bash




# UNDEPLOY --
# WARNING: removes all runtime information again; persistent data (Volumes and Images) will remain untouched
# remove Docker Container
docker rm -f daniel-tf-server-iris
docker ps -a
