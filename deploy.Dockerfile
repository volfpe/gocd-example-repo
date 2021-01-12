FROM dtzar/helm-kubectl:3.4.2
ARG KUBECONF_CLUSTER_CERTIFICATE_AUTHORITY_DATE
ARG KUBECONF_SERVER
ARG KUBECONF_USER_NAME
ARG KUBECONF_CLIENT_CERTIFICATE_DATA
ARG KUBECONF_CLIENT_KEY_DATA

COPY deploy.sh .
COPY kubeconfig.yml .
COPY serverpod.yml .
RUN apk add gettext
RUN mkdir /root/.kube && envsubst < kubeconfig.yml > /root/.kube/config


CMD sh deploy.sh