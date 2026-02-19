# Step 5 — Monitoring vCluster Resources

Understanding vCluster resource consumption is important for capacity planning and troubleshooting.

## Check vCluster Pod Status

`kubectl get pods -n config-ns`{{exec}}

## View Control Plane Logs

The vCluster control plane runs as a statefulset. You can view its logs to troubleshoot issues:

`kubectl logs statefulset/config-demo -n config-ns --tail=20`{{exec}}

## Describe the vCluster Pod

Get detailed information about the vCluster pod including resource usage, events, and container status:

`kubectl describe pod -n config-ns -l app=vcluster`{{exec}}

## Check Resource Consumption

View the resources backing the vCluster:

`kubectl get all -n config-ns`{{exec}}

`kubectl get pvc -n config-ns`{{exec}}

## vCluster Status

The vCluster CLI also provides status information:

`vcluster list`{{exec}}

This shows all vClusters, their status, namespace, and age. The `STATUS` column tells you if the vCluster is running and healthy.
