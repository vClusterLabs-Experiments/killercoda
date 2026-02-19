# Step 1 — Switch to Docker Driver

By default, the vCluster CLI targets a Kubernetes cluster (using your current kubeconfig). The Docker driver tells it to use Docker containers as the backing infrastructure instead. This is the foundational step for running vind clusters.

## Check Docker is available

`docker version`{{exec}}

Docker is pre-installed in this environment. vind uses Docker to launch each virtual cluster as a container.

## Switch the CLI to Docker driver

`vcluster use driver docker`{{exec}}

This updates the vCluster CLI configuration to use Docker for all subsequent `vcluster create` commands. The setting is stored in `~/.vcluster/config.yaml`.

## Confirm the driver switch

`vcluster use driver docker 2>&1`{{exec}}

## Check that no vind containers are running yet

`docker ps --filter "label=vcluster" 2>/dev/null || docker ps`{{exec}}

No vCluster containers should be listed — we haven't created any clusters yet.

## What changes with the Docker driver

| | Kubernetes driver (default) | Docker driver (vind) |
|---|---|---|
| Backing infra | Kubernetes namespace | Docker container |
| Prerequisite | kubeconfig + host cluster | Docker only |
| `vcluster create` | Creates namespace + helm chart | Starts a Docker container |
| Networking | Kubernetes services | Docker networks |
| `vcluster list` | Lists by namespace | Lists by container |

> **Use case**: vind is ideal for local development, CI environments without a Kubernetes cluster, and quick experimentation. Production workloads typically use the Kubernetes driver on a real host cluster.

Reference: https://github.com/loft-sh/vind
