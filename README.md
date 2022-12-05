# devops-tools

![GitHub tag (latest by date)](https://img.shields.io/github/v/tag/vfabi/devops-tools)
![GitHub last commit](https://img.shields.io/github/last-commit/vfabi/devops-tools)
[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

[![Generic badge](https://img.shields.io/badge/hub.docker.com-vfabi/devops_tools-<>.svg)](https://hub.docker.com/repository/docker/vfabi/devops-tools)
![Docker Cloud Automated build](https://img.shields.io/docker/cloud/automated/vfabi/devops-tools)
![Docker Pulls](https://img.shields.io/docker/pulls/vfabi/devops-tools)
![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/vfabi/devops-tools)

DevOps tools docker image.  
Supported platforms: amd64, arm64.

## Features

Contains following tools:

- helm
- helm plugin helm-diff
- helm plugin helm-unittest
- helm plugin helm-push
- helmfile
- kubectl
- eksctl
- kustomize
- kubeseal
- aws-iam-authenticator
- awscli

For the tools versions please look at [CHANGELOG.md](CHANGELOG.md)

## Docker

[![Generic badge](https://img.shields.io/badge/hub.docker.com-vfabi/devops_tools-<>.svg)](https://hub.docker.com/repository/docker/vfabi/devops-tools)

## Build

```
docker buildx build --push --platform=linux/amd64,linux/arm64 -t vfabi/devops-tools:latest -f Dockerfile .
```

## Contributing

Please refer to each project's style and contribution guidelines for submitting patches and additions. In general, we follow the "fork-and-pull" Git workflow.

 1. **Fork** the repo on GitHub
 2. **Clone** the project to your own machine
 3. **Commit** changes to your own branch
 4. **Push** your work back up to your fork
 5. Submit a **Pull request** so that we can review your changes

NOTE: Be sure to merge the latest from "upstream" before making a pull request!

## License

Apache 2.0
