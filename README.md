# openshift-tiller-installer
Docker container for deploying tiller (the helm server-side component) on openshift

## Build and Run locally

docker build -t openshift-tiller-installer:local .

docker run -ti --rm -e OS_CLUSTER=https://example.com -e TILLER_NAMESPACE=example-namespace openshift-tiller-installer:local

## Run from DockerHub

docker run -ti --rm -e OS_CLUSTER=https://example.com -e TILLER_NAMESPACE=example-namespace ksandermann/openshift-tiller-installer:latest