# Step 3 — Sync Configuration

vCluster syncs resources between the virtual cluster and the host cluster. Understanding and configuring sync behavior is key to a well-functioning vCluster.

## Default Sync Behavior

By default, vCluster syncs these resources from the virtual cluster **to the host**:
- Pods
- Services
- ConfigMaps (referenced by pods)
- Secrets (referenced by pods)
- Endpoints
- PersistentVolumeClaims

And from the host **to the virtual cluster**:
- Events
- Storage classes (if enabled)

## Connect and Explore Current Sync

`vcluster connect config-demo --namespace config-ns`{{exec}}

Create some resources to see sync in action:

`kubectl create deployment sync-test --image=nginx`{{exec}}

`kubectl expose deployment sync-test --port=80 --type=ClusterIP`{{exec}}

`kubectl create configmap test-config --from-literal=key=value`{{exec}}

Check resources in the vCluster:

`kubectl get deployments,services,configmaps`{{exec}}

Now disconnect and see what was synced to the host:

`vcluster disconnect`{{exec}}

`kubectl get pods -n config-ns`{{exec}}

`kubectl get services -n config-ns`{{exec}}

Notice that **pods** and **services** are synced to the host namespace, but the **deployment** object stays in the vCluster. This is by design — vCluster syncs the workload resources (pods) but the higher-level abstractions (deployments, replicasets) remain virtual.
