# Step 5 — Second Cluster, Isolation, and Cleanup

One Docker host can run multiple independent vind clusters simultaneously. Each cluster gets its own Docker container, its own control plane, and its own workloads — completely isolated from each other.

## Create a second cluster

`vcluster create dev-cluster-2`{{exec}}

You are now connected to `dev-cluster-2`.

## Confirm two Docker containers are running

`docker ps`{{exec}}

You should see two containers — one for each vind cluster.

## Deploy a different workload in dev-cluster-2

`kubectl create deployment redis --image=redis:alpine`{{exec}}

`kubectl rollout status deployment/redis`{{exec}}

## Confirm isolation — dev-cluster-2 does not see dev-cluster's nginx

`kubectl get pods`{{exec}}

Only the `redis` pod is here. The `nginx` pod from `dev-cluster` does not appear.

`kubectl get deployments`{{exec}}

Only `redis` is visible.

## Optional: Custom vcluster.yaml for vind

You can pin the vind image version via `experimental.docker`:

`cat <<'EOF' > /tmp/vind-config.yaml
experimental:
  docker:
    image: ghcr.io/loft-sh/vcluster:latest
EOF`{{exec}}

This would be passed with `vcluster create <name> --values /tmp/vind-config.yaml` to use a specific image.

## List all clusters

`vcluster list`{{exec}}

Both `dev-cluster` and `dev-cluster-2` appear with their own status.

## Cleanup — delete both clusters

`vcluster delete dev-cluster-2`{{exec}}

`vcluster delete dev-cluster`{{exec}}

## Confirm all containers are gone

`docker ps`{{exec}}

`vcluster list`{{exec}}

Both clusters and their backing containers have been removed.

> **Summary**: vind turns any Docker host into a multi-cluster Kubernetes development environment. Each cluster is fully isolated, lightweight, and manageable with the same `vcluster` CLI you use for production Kubernetes-backed clusters.

Reference: https://github.com/loft-sh/vind
