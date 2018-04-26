FROM ksandermann/openshift-helm-client:0.1

MAINTAINER Kevin Sandermann <kevin.sandermann@gmail.com>

COPY /install_tiller_on_openshift.sh /install_tiller_on_openshift.sh

ENTRYPOINT ["/bin/bash"]
CMD ["/install_tiller_on_openshift.sh"]