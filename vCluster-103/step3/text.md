# Step 3 — Expose both apps (port-forward)

We will port-forward each `my-app` service so they can be reached locally.

`vcluster connect my-vcluster-a`{{exec}}

`kubectl port-forward svc/my-app 18080:80 &`{{exec}}

`vcluster disconnect`{{exec}}

`vcluster connect my-vcluster-b`{{exec}}

`kubectl port-forward svc/my-app 28080:80 &`{{exec}}

`vcluster disconnect`{{exec}}
