FROM quay.io/roboll/helmfile:helm3-v0.135.0


RUN apk add --update --no-cache python3 && pip3 install --no-cache --upgrade pip boto3 setuptools
