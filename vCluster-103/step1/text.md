# Step 1 — Create two vClusters

Create two vClusters in the `team-x` namespace. We'll name them `my-vcluster-a` and `my-vcluster-b`.

Commands:

`kubectl create namespace team-x`{{exec}}

`vcluster create --connect=false my-vcluster-a --namespace team-x`{{exec}}

`kubectl create namespace team-y`{{exec}}

`vcluster create --connect=false my-vcluster-b --namespace team-y`{{exec}}

Verify both are running with `vcluster list`{{exec}}.
