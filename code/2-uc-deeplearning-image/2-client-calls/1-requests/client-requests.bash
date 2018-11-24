#!/usr/bin/env bash


# TODO: CHECK OR CHANGE ME
# definition: ${PWD} is this git repository's root folder
export FS_PATH_EXAMPLES_HOME="${PWD}/code/2-uc-deeplearning-image/2-client-calls/1-requests"



# Query the deployed service for payload data -- from remote client -- myself
time curl -X POST \
    http://deeplearning.devops.svc.cluster.local:2308/squeezenet/predict -F "data=@${FS_PATH_EXAMPLES_HOME}/daniel.jpg" \
    -H 'cache-control: no-cache' \
    && echo $?


# TODO: extract files
# before issuing the last two statements, please extract the respective images from it's photo.7z file
# into an photo.jpg file right parallel to the original archive in the very same parent folder
# -- to ${PWD}/code/2-uc-deeplearning-image/2-client-calls/1-requests
# -- as it is default in this extraction
# Query the deployed service for payload data -- from remote client -- Egyptian Kitten (85%)
time curl -X POST \
    http://deeplearning.devops.svc.cluster.local:2308/squeezenet/predict -F "data=@${FS_PATH_EXAMPLES_HOME}/kitten.jpg" \
    -H 'cache-control: no-cache' \
    && echo $?


# TODO: extract files
# before issuing the last two statements, please extract the respective images from it's photo.7z file
# into an photo.jpg file right parallel to the original archive in the very same parent folder
# -- to ${PWD}/code/2-uc-deeplearning-image/2-client-calls/1-requests
# -- as it is default in this extraction
# Query the deployed service for payload data -- from remote client -- myself
# tribute to SemperVideo's running gag: https://www.sempervideo.de/downloads/cute-chick-with-hairy-pussy.jpg
time curl -X POST \
    http://deeplearning.devops.svc.cluster.local:2308/squeezenet/predict -F "data=@${FS_PATH_EXAMPLES_HOME}/cute-chick-with-hairy-pussy.jpg" \
    -H 'cache-control: no-cache' \
    && echo $?
