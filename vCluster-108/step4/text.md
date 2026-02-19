# Step 4 — Pause and Resume

vind clusters can be paused to save resources. When paused, the Docker container is stopped — no CPU or network overhead. When resumed, the container restarts and all workloads return to their previous state.

## Check current state

`vcluster list`{{exec}}

`docker ps`{{exec}}

Both show `dev-cluster` as running.

## Pause the cluster

`vcluster pause dev-cluster`{{exec}}

## Confirm the container is stopped

`docker ps`{{exec}}

The `dev-cluster` container should no longer appear in the running containers list.

`docker ps -a | grep dev-cluster`{{exec}}

With `-a` (all containers including stopped) you can see it exists but is stopped.

## Confirm the cluster is paused in vcluster list

`vcluster list`{{exec}}

The status column should show `Paused` or `Stopped`.

## Resume the cluster

`vcluster resume dev-cluster`{{exec}}

This starts the container back up and waits for the API server to be ready.

## Verify workloads are restored

`kubectl get pods`{{exec}}

The nginx pod should return to `Running` status. The deployment, service, and all other resources are preserved exactly as they were before the pause.

`kubectl get all`{{exec}}

> **Use case**: Pause vind clusters overnight or between work sessions. Resume them in seconds without losing any cluster state. This is especially useful when running multiple development clusters locally.
