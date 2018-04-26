# openshift-tiller-installer
docker container for deploying tiller (the helm server-side component) on openshift

## how to run 

docker run -ti --rm -e OS_CLUSTER=https://example.com -e TILLER_NAMESPACE=example-namespace tillerinstaller:local
