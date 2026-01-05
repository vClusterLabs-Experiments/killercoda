```markdown
# Step 3 — Deploy same app name in both vClusters

We'll deploy a simple nginx Deployment named `web` in each vCluster's `default` namespace.

Connect to the first vCluster and deploy:

`vcluster connect my-vcluster-a --namespace team-x`{{exec}}

`kubectl create deployment web --image=nginx --replicas=1`{{exec}}

`kubectl expose deployment web --port=80 --target-port=80 --type=ClusterIP`{{exec}}

Disconnect and repeat for the second vCluster:

`vcluster disconnect`{{exec}}

`vcluster connect my-vcluster-b --namespace team-x`{{exec}}

`kubectl create deployment web --image=nginx --replicas=1`{{exec}}

`kubectl expose deployment web --port=80 --target-port=80 --type=ClusterIP`{{exec}}

`vcluster disconnect`{{exec}}

```
