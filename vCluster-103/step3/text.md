```markdown
# Step 3 — Expose both apps

We will expose each `my-app` service so they can be reached independently.

Option A: NodePort (if allowed): connect to each vCluster and patch the service to NodePort.

`vcluster connect my-vcluster-a --namespace team-x`{{exec}}

`kubectl patch svc my-app -p '{"spec": {"type": "NodePort"}}'`{{exec}}

`vcluster disconnect`{{exec}}

`vcluster connect my-vcluster-b --namespace team-x`{{exec}}

`kubectl patch svc my-app -p '{"spec": {"type": "NodePort"}}'`{{exec}}

`vcluster disconnect`{{exec}}

Option B: port-forward locally from each vCluster context (works everywhere):

`vcluster connect my-vcluster-a --namespace team-x`{{exec}}

`kubectl port-forward svc/my-app 18080:80 &`{{exec}}

`vcluster disconnect`{{exec}}

`vcluster connect my-vcluster-b --namespace team-x`{{exec}}

`kubectl port-forward svc/my-app 28080:80 &`{{exec}}

`vcluster disconnect`{{exec}}

```
