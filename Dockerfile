FROM alpine:3.17

ARG TARGETARCH
ARG TARGETPLATFORM
ARG BUILDPLATFORM

ARG HELM_VERSION=3.7.0
ARG HELMFILE_VERSION=0.146.0
ARG KUBECTL_VERSION=1.22.16
ARG EKSCTL_VERSION=0.120.0
ARG KUSTOMIZE_VERSION=4.5.6
ARG KUBESEAL_VERSION=0.18.5
ARG AWS_IAM_AUTHENTICATOR_VERSION=0.5.6
ENV PIP_ROOT_USER_ACTION=ignore


# COMMON
RUN apk add --update --no-cache curl ca-certificates bash git curl jq gettext python3

# HELM
ENV HELM_BASE_URL="https://get.helm.sh"
ENV TAR_FILE="helm-v${HELM_VERSION}-linux-${TARGETARCH}.tar.gz"
RUN curl -sL ${HELM_BASE_URL}/${TAR_FILE} | tar -xvz && \
    mv linux-${TARGETARCH}/helm /usr/bin/helm && \
    chmod +x /usr/bin/helm && \
    rm -rf linux-${TARGETARCH} && \
    helm repo add "stable" "https://charts.helm.sh/stable" --force-update

# HELM plugins
# helm-diff
RUN helm plugin install https://github.com/databus23/helm-diff && rm -rf /tmp/helm-*
# helm-unittest
RUN helm plugin install https://github.com/quintush/helm-unittest && rm -rf /tmp/helm-*
# helm-push
RUN helm plugin install https://github.com/chartmuseum/helm-push && rm -rf /tmp/helm-*

# HELMFILE
RUN curl -sL https://github.com/helmfile/helmfile/releases/download/v${HELMFILE_VERSION}/helmfile_${HELMFILE_VERSION}_linux_${TARGETARCH}.tar.gz -o - | tar xz -C /usr/bin/ && \
    chmod +x /usr/bin/helmfile

# KUBECTL
RUN curl -sLO https://storage.googleapis.com/kubernetes-release/release/v${KUBECTL_VERSION}/bin/linux/${TARGETARCH}/kubectl && \
    mv kubectl /usr/bin/kubectl && \
    chmod +x /usr/bin/kubectl

# EKSCTL
RUN curl -sL "https://github.com/weaveworks/eksctl/releases/download/v${EKSCTL_VERSION}/eksctl_Linux_${TARGETARCH}.tar.gz" | tar xz -C /tmp && \
    mv /tmp/eksctl /usr/bin && \
    chmod +x /usr/bin/eksctl

# AWSCLI
RUN python3 -m ensurepip && \
    pip3 install --upgrade pip && \
    pip3 install awscli && \
    pip3 cache purge

# KUSTOMIZE
RUN curl -sLO https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize%2Fv${KUSTOMIZE_VERSION}/kustomize_v${KUSTOMIZE_VERSION}_linux_${TARGETARCH}.tar.gz && \
    tar xvzf kustomize_v${KUSTOMIZE_VERSION}_linux_${TARGETARCH}.tar.gz && \
    mv kustomize /usr/bin/kustomize && \
    chmod +x /usr/bin/kustomize && \
    rm -rf kustomize_v${KUSTOMIZE_VERSION}_linux_${TARGETARCH}.tar.gz

# KUBESEAL
RUN curl -sL https://github.com/bitnami-labs/sealed-secrets/releases/download/v${KUBESEAL_VERSION}/kubeseal-${KUBESEAL_VERSION}-linux-${TARGETARCH}.tar.gz -o - | tar xz -C /usr/bin/ && \
    chmod +x /usr/bin/kubeseal

# AWS-IAM-AUTHENTICATOR
RUN curl -fsL https://github.com/kubernetes-sigs/aws-iam-authenticator/releases/download/v${AWS_IAM_AUTHENTICATOR_VERSION}/aws-iam-authenticator_${AWS_IAM_AUTHENTICATOR_VERSION}_linux_${TARGETARCH} -o /usr/bin/aws-iam-authenticator && \
    chmod +x /usr/bin/aws-iam-authenticator


WORKDIR /app
# CMD bash
