# Create a vCluster with Workloads

First, let's create a vCluster and deploy several resources to simulate a real environment with workloads worth backing up.

## Create the vCluster

`vcluster create backup-demo --namespace backup-ns`{{exec}}

## Deploy Workloads

Create a deployment:

`kubectl create deployment nginx --image=nginx --replicas=2`{{exec}}

Create a service:

`kubectl expose deployment nginx --port=80 --target-port=80 --type=ClusterIP`{{exec}}

Create a configmap with application configuration:

`kubectl create configmap app-config --from-literal=environment=production --from-literal=log_level=info`{{exec}}

Create a secret:

`kubectl create secret generic app-secret --from-literal=api-key=demo-key-12345`{{exec}}

## Verify Everything Is Running

`kubectl get deployments,services,configmaps,secrets`{{exec}}

`kubectl get pods`{{exec}}

We now have a vCluster with a deployment, service, configmap, and secret — a representative set of resources to back up.
