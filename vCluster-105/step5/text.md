# Restore from Snapshot

Now let's use `vcluster restore` to recover the vCluster to the state captured in our snapshot.

## Restore the Snapshot

`vcluster restore backup-demo "container:///data/snapshot.tar.gz"`{{exec}}

The restore process:

1. **Pauses** the vCluster
2. **Scales** all vCluster pods to zero
3. **Runs a restore pod** that replaces the backing store data with the snapshot contents
4. **Resumes** the vCluster with the restored state

This may take a minute to complete as the vCluster restarts.

## Connect and Verify

Connect to the restored vCluster:

`vcluster connect backup-demo`{{exec}}

Check that the workloads are back:

`kubectl get deployments`{{exec}}

`kubectl get services`{{exec}}

`kubectl get configmaps`{{exec}}

`kubectl get secrets`{{exec}}

Wait for the pods to be running:

`kubectl get pods`{{exec}}

You should see the nginx deployment with 2 replicas, the nginx service, the `app-config` configmap, and the `app-secret` secret — all restored from the snapshot.

## Verify Data Integrity

Check that the configmap data was preserved:

`kubectl get configmap app-config -o jsonpath='{.data}'`{{exec}}

The original values (`environment=production`, `log_level=info`) should be intact, confirming that the full control plane state was restored.
