```markdown
# Step 2 — Deploy same app name in both vClusters

We'll deploy a simple nginx Deployment named `my-app` in each vCluster's `default` namespace.

Connect to the first vCluster and deploy:

`vcluster connect my-vcluster-a --namespace team-x`{{exec}}

`kubectl create deployment my-app --image=nginx --replicas=1`{{exec}}

`kubectl expose deployment my-app --port=80 --target-port=80 --type=ClusterIP`{{exec}}

Disconnect and repeat for the second vCluster:

`vcluster disconnect`{{exec}}

`vcluster connect my-vcluster-b --namespace team-x`{{exec}}

`kubectl create deployment my-app --image=nginx --replicas=1`{{exec}}

`kubectl expose deployment my-app --port=80 --target-port=80 --type=ClusterIP`{{exec}}

`vcluster disconnect`{{exec}}

```
