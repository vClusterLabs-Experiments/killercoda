# Step 1 — Create two vClusters

Create two vClusters in separate namespaces. We'll name them `my-vcluster-a` in the `team-x` namespace and `my-vcluster-b` in the `team-y` namespace.

`kubectl create namespace team-x`{{exec}}

`vcluster create --connect=false my-vcluster-a --namespace team-x`{{exec}}

`kubectl create namespace team-y`{{exec}}

`vcluster create --connect=false my-vcluster-b --namespace team-y`{{exec}}

Verify both are running:

`vcluster list`{{exec}}
