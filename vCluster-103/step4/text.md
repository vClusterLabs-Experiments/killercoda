```markdown
# Step 4 — Expose both apps

We will expose each `web` service so they can be reached independently.

Option A: NodePort (if allowed): connect to each vCluster and patch the service to NodePort.

`vcluster connect my-vcluster-a --namespace team-x`{{exec}}

`kubectl patch svc web -p '{"spec": {"type": "NodePort"}}'`{{exec}}

`vcluster disconnect`{{exec}}

`vcluster connect my-vcluster-b --namespace team-x`{{exec}}

`kubectl patch svc web -p '{"spec": {"type": "NodePort"}}'`{{exec}}

`vcluster disconnect`{{exec}}

Option B: port-forward locally from each vCluster context (works everywhere):

`vcluster connect my-vcluster-a --namespace team-x`{{exec}}

`kubectl port-forward svc/web 18080:80 &`{{exec}}

`vcluster disconnect`{{exec}}

`vcluster connect my-vcluster-b --namespace team-x`{{exec}}

`kubectl port-forward svc/web 28080:80 &`{{exec}}

`vcluster disconnect`{{exec}}

```
