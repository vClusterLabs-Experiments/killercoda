Step 6 — Cleanup & Wrap-up

Remove the resources and vClusters when done.

Delete deployments/services inside vClusters then delete the vClusters themselves:

`vcluster connect my-vcluster-a --namespace team-x`{{exec}}

`kubectl delete svc,deployment -l app=web --ignore-not-found`{{exec}}

`vcluster disconnect`{{exec}}

`vcluster connect my-vcluster-b --namespace team-x`{{exec}}

`kubectl delete svc,deployment -l app=web --ignore-not-found`{{exec}}

`vcluster disconnect`{{exec}}

Delete the virtual clusters from the host:

`vcluster delete my-vcluster-a --namespace team-x`{{exec}}

`vcluster delete my-vcluster-b --namespace team-x`{{exec}}

```

Thank you — you successfully demonstrated same-name isolation with vClusters.
