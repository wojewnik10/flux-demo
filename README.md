### FluxCD demo repository

## Requirements
It is essential to have a Kubernetes cluster with a version of 1.16 or newer and kubectl <1.18.
## Bootstrap the cluster

First, make sure that the Github PAT (personal access token) is created with a repo level permission.
Export your GitHub PAT and username:
```
export GITHUB_TOKEN=<your-token>
export GITHUB_USER=<your-username>
```

```flux bootstrap github \
  --components-extra=image-reflector-controller,image-automation-controller \
  --owner=$GITHUB_USER \
  --repository=flux-demo \
  --branch=main \
  --path=flux/clusters/demo-cluster \
  --read-write-key \
  --personal
  ```

## Uninstall the cluster
`flux uninstall --namespace=flux-system`