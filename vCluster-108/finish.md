# Congratulations — vCluster 108 Complete!

You have successfully run virtual Kubernetes clusters using Docker as the backing infrastructure with vind.

## What You Learned

- **Docker driver** — `vcluster use driver docker` switches the CLI from Kubernetes-backed to Docker-backed vClusters
- **vind clusters** — `vcluster create <name>` spins up a fully functional Kubernetes cluster inside a Docker container in seconds
- **Same workflow** — `kubectl get nodes`, `kubectl apply`, `kubectl port-forward` all work identically to kubeadm-backed vClusters
- **Pause and resume** — `vcluster pause` stops the backing container; `vcluster resume` restores it with all workloads intact
- **Multi-cluster isolation** — Each vind cluster runs in its own Docker container with a completely independent control plane and data plane

## Key Commands

```bash
# Switch to Docker driver
vcluster use driver docker

# Create a vind cluster
vcluster create dev-cluster

# List all clusters
vcluster list

# Pause and resume
vcluster pause dev-cluster
vcluster resume dev-cluster

# Delete
vcluster delete dev-cluster
```

## Next Steps

- Use vind locally during development to avoid spinning up cloud clusters
- Explore `experimental.docker` in `vcluster.yaml` to pin the vind image version
- Combine vind with `vcluster snapshot` (scenario 105) for portable cluster state

Reference docs:
- https://www.vcluster.com/docs/vcluster/configure/vcluster-yaml/experimental/docker
- https://github.com/loft-sh/vind

https://slack.vcluster.com
