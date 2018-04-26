#!/usr/bin/env bash

echo "Openshift cluster set: " "${OS_CLUSTER:?Please set the Openshift cluster address via -e OS_CLUSTER=URL}"
echo "Tiller namespace set: "  "${TILLER_NAMESPACE:?Please set the namespace you want to install tiller in via -e TILLER_NAMESPACE=NAMESPACE}"

oc login $OS_CLUSTER --insecure-skip-tls-verify

oc project $TILLER_NAMESPACE

oc process -f https://github.com/openshift/origin/raw/master/examples/helm/tiller-template.yaml -p TILLER_NAMESPACE="${TILLER_NAMESPACE}" | oc create -f -

oc rollout status deployment tiller

helm version

oc policy add-role-to-user edit "system:serviceaccount:${TILLER_NAMESPACE}:tiller"

helm install https://github.com/jim-minter/nodejs-ex/raw/helm/helm/nodejs-0.1.tgz -n nodejs-ex

helm del --purge nodejs-ex