## [2.1.0] - 2022-12-06

### Versions

- helm: 3.7.0
- helm plugin helm-diff: latest
- helm plugin helm-unittest: latest
- helm plugin helm-push: latest
- helmfile: 0.146.0
- kubectl: 1.22.16
- eksctl: 0.120.0
- kustomize: 4.5.6
- kubeseal: 0.18.5
- aws-iam-authenticator: 0.5.6
- aws-cli: latest
- gcloud: 410.0.0

### Added

- New tools: gcloud
 
### Changed

- Split Dockerfile to 2 versions: `Dockerfile-all` - for all the tools, `Dockerfile-minimal` - for the minimum tools set.

### Fixed


## [2.0.0] - 2022-12-05

### Versions

- helm: 3.7.0
- helm plugin helm-diff: latest
- helm plugin helm-unittest: latest
- helm plugin helm-push: latest
- helmfile: 0.146.0
- kubectl: 1.22.16
- eksctl: 0.120.0
- kustomize: 4.5.6
- kubeseal: 0.18.5
- aws-iam-authenticator: 0.5.6
- aws-cli: latest

### Added

- Multiarch builds for amd64 and arm64 platforms
- New tools: helm, helm plugins, kubectl, kustomize, eksctl, awscli, kubeseal, aws-cli, aws-iam-authenticator
 
### Changed

- Project renamed
- Dockerfile

### Fixed
