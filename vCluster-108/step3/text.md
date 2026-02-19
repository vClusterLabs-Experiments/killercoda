# Step 3 — Deploy and Access Workloads

A vind cluster is a fully functional Kubernetes cluster. Standard `kubectl` commands work without modification.

## Confirm you are connected to dev-cluster

`kubectl config current-context`{{exec}}

The context should reference `dev-cluster`.

## Deploy nginx

`kubectl create deployment nginx --image=nginx:alpine`{{exec}}

`kubectl rollout status deployment/nginx`{{exec}}

## Expose the deployment

`kubectl expose deployment nginx --port=80 --target-port=80`{{exec}}

`kubectl get svc nginx`{{exec}}

## Verify the pod is running

`kubectl get pods`{{exec}}

## Access the workload via port-forward

`kubectl port-forward svc/nginx 8080:80 &`{{exec}}

Wait a moment, then test:

`curl -s -o /dev/null -w "%{http_code}" http://localhost:8080/`{{exec}}

You should get `200`. The request travels through the Docker container's virtual network to the nginx pod.

## Stop the port-forward

`kill %1 2>/dev/null || true`{{exec}}

## Inspect cluster resources

`kubectl get all`{{exec}}

Everything — deployments, replicasets, pods, services — is running inside the Docker container. The host Kubernetes cluster (from previous scenarios) is unaffected.

> **Same workflow, different backing**: The commands you used in scenarios 101–107 work identically here. The Docker driver is transparent to anyone using kubectl against the cluster.
