# DevOps_AiToProduction_DockerizedLeanApproach
Delivery Excellence, DevOps: Cloud-native Deployments of Data Science Models

## Setup in static code
Please modify this static git repo's code before using it. For technical and legal reasons, some files are 
archived in unencrypted and plain 7z archives.

### Extract
For legal licensing reasons only, two images may not be provided in raw format.

- `code/2-uc-deeplearning-image/2-client-calls/1-requests/kitten.7z` to
`code/2-uc-deeplearning-image/2-client-calls/1-requests/kitten.jpg` to
- `code/2-uc-deeplearning-image/2-client-calls/1-requests/cute-chick-with-hairy-pussy.7z` to
`code/2-uc-deeplearning-image/2-client-calls/1-requests/cute-chick-with-hairy-pussy.jpg`
- `code/1-uc-structured-data-json/1-server-setup/1-data-to-deploy/raw-binaries/tensorflow_serving_tutorial.7z` to 
`code/1-uc-structured-data-json/1-server-setup/1-data-to-deploy/raw-binaries/tensorflow_serving_tutorial`
- `code/2-uc-deeplearning-image/1-server-setup/1-data-to-deploy/raw-binaries/mxnet.7z` to 
`code/2-uc-deeplearning-image/1-server-setup/1-data-to-deploy/raw-binaries/mxnet`

The extraction keys for the presentation resp. photos may or may not be provided to you for legal reasons. You can find 
the applicable keys in
- `resources/presentation/credentials.txt` resp.
- `resources/photos/credentials.txt` 
Both latter software archives as git repositories are packaged only for technical reasons and do not need a passphrase 
to extract them.


# Prepare your client's host
Amend your OS' `hosts` file like shown in `code/0-meta/client-network/amend-hosts-file/example-hosts-file`. 
Your `hosts` file resides in:
- Windows: `C:\Windows\System32\drivers\etc\hosts`
- Linux: `/etc/hosts`


# Getting started deploying Docker Containers

## Establish SSH tunnel
Shown in `code/0-meta/client-network/create-ssh-tunnel/sshConnection.bash`

## Optional: Docker web ui
Shown in `code/0-meta/server-optional-dockerwebui/deepinfrastructure-docker-webui.bash`

## TensorFlow / Iris model

### Distribute Model data
Shown in `code/1-uc-structured-data-json/1-server-setup/1-data-to-deploy`

### Start Docker Container
Shown in `code/1-uc-structured-data-json/1-server-setup/2-bash-commands-to-execute/tf-model-iris.bash`

### Perform client requests
Requests in `code/1-uc-structured-data-json/2-client-calls/1-requests` and respective responses from `code/1-uc-structured-data-json/2-client-calls/2-example-responses`


## MXNet / Deep Learning image classification model

### Distribute Model data
Shown in `code/2-uc-deeplearning-image/1-server-setup/1-data-to-deploy`

### Start Docker Container
Shown in `code/2-uc-deeplearning-image/1-server-setup/2-bash-commands-to-execute/mxnet-model-deeplearning.bash`

### Perform client requests
Requests in `code/2-uc-deeplearning-image/2-client-calls/1-requests` and respective responses from `code/2-uc-deeplearning-image/2-client-calls/2-example-responses`
