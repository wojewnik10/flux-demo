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

Next, run the `flux boostrap github` command with following parameters:
```flux bootstrap github \
  --components-extra=image-reflector-controller,image-automation-controller \
  --owner=$GITHUB_USER \
  --repository=flux-demo \
  --branch=main \
  --path=flux/clusters/demo-cluster \
  --read-write-key \
  --personal
  ```

## Demo deployment
This demo showcase simple deployment with a service and a configmap. 
There are configured flux manifests such as ImagePolicy, ImageRepository, in order to test out 
the Flux image update automation.

Whenever there is a change either in workflow file or the `index.html`, the new docker image is being build and pushed
to the external registry with a new tag, based on the current date and timestamp. The deployment is being updated based on the new image.
Also with the help of reloader HelmRelease, whenever the data of the configmap is changed, the deployment also gets
reconciled.

## Uninstall FLuxCD from the cluster
`flux uninstall --namespace=flux-system`