# Step 2 — Create First vind Cluster

With the Docker driver active, `vcluster create` spins up a virtual cluster backed by a Docker container. No namespace flags needed — vind manages its own naming scheme.

## Create the cluster

`vcluster create dev-cluster`{{exec}}

This command:
1. Pulls the vind container image (if not cached)
2. Starts a Docker container named `dev-cluster`
3. Waits for the virtual API server to become ready
4. Connects your kubeconfig to the new cluster

This may take a minute on first run while the image downloads.

## Verify the cluster is ready

`kubectl get nodes`{{exec}}

You should see one node with status `Ready`. This is the virtual node inside your vind cluster.

`kubectl cluster-info`{{exec}}

## Check the backing Docker container

Open a second perspective — view the Docker container that backs this cluster:

`docker ps`{{exec}}

You should see a container named `dev-cluster` (or similar). That single container hosts the entire virtual Kubernetes cluster: API server, etcd, and the kubelet that manages workloads.

## List vind clusters with the CLI

`vcluster list`{{exec}}

The output shows `dev-cluster` with status `Running`.

> **How it works**: The vind container runs a minimal Kubernetes distribution (k3s-based) inside Docker. The vCluster syncer runs inside this container, and the virtual API server is accessible via the kubeconfig that `vcluster create` writes for you.

Reference: https://www.vcluster.com/docs/vcluster/configure/vcluster-yaml/experimental/docker
