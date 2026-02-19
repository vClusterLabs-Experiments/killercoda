# Simulate Disaster — Delete Workloads Inside vCluster

Now let's simulate a disaster by deleting all the workloads inside the vCluster. Since our snapshot is stored on the vCluster's PVC using `container://`, we'll keep the vCluster itself running and instead destroy the resources inside it.

## Connect to the vCluster

`vcluster connect backup-demo`{{exec}}

## Verify Current State

Before we break things, confirm everything is running:

`kubectl get deployments,services,configmaps,secrets`{{exec}}

## Delete Everything

Delete all workloads in the default namespace to simulate accidental deletion or corruption:

`kubectl delete deployment --all`{{exec}}

`kubectl delete service nginx`{{exec}}

`kubectl delete configmap app-config`{{exec}}

`kubectl delete secret app-secret`{{exec}}

## Verify Destruction

`kubectl get deployments,services,configmaps,secrets`{{exec}}

The nginx deployment, service, configmap, and secret are gone. Only default Kubernetes resources (like the `kubernetes` service) remain.

In a real scenario, this could happen due to an accidental `kubectl delete`, a faulty CI/CD pipeline, or a misconfigured operator wiping out resources.

## Disconnect

`vcluster disconnect`{{exec}}

Our snapshot is still safely stored on the vCluster's PVC. Let's restore from it.
