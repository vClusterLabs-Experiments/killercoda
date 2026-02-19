# Step 6 — Remove the vCluster

In this last step we will delete the vCluster. A vCluster can be ephemeral if needed as it is fast to spin up and fast to delete.

`vcluster delete my-vcluster`{{exec}}

Then we can use `vcluster list` to see the status, or we can use kubectl to list the resources.

`vcluster list`{{exec}}

`kubectl get all -n team-x`{{exec}}
