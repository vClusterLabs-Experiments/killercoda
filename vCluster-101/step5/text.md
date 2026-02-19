# Step 5 — Inspect the Host Cluster

It's time to disconnect from the vCluster and see what the host cluster actually sees.

`vcluster disconnect`{{exec}}

In Step 2, you took a "before" snapshot of the host. Now let's compare. List the namespaces:

`kubectl get namespaces`{{exec}}

The `team-x` namespace appeared — that's where the vCluster lives on the host.

In Step 4 you created an nginx Deployment inside the vCluster. Try to find it on the host:

`kubectl get deployment -n team-x`{{exec}}

Nothing. The deployment only exists inside the vCluster's virtual API server. Now check for pods:

`kubectl get pods -n team-x`{{exec}}

The nginx pod is here — with a name that includes the vCluster name as a prefix. The vCluster syncer wrote this pod to the host so it could be scheduled on real nodes, but stripped away the Deployment object. From the host's perspective, it's just a pod, not something managed by a Deployment.

List everything in the namespace to see the full picture of what backs the vCluster:

`kubectl get all -n team-x`{{exec}}

> **Stop and Think**
> You created a Deployment inside the vCluster two minutes ago. On the host, the Deployment doesn't exist — only the pod does. Why does vCluster sync pods but not Deployments? What's the design reason for this split? If you deleted the pod directly on the host, what do you think would happen?

## Optional Challenge

Pods sync to the host. Deployments don't. What about ReplicaSets?

Connect back to the vCluster, scale nginx to 3 replicas, then disconnect and check:

`vcluster connect my-vcluster`{{exec}}

`kubectl scale deployment nginx --replicas=3`{{exec}}

`vcluster disconnect`{{exec}}

`kubectl get pods -n team-x`{{exec}}

`kubectl get replicasets -n team-x`{{exec}}

How many pods appear on the host? Does the ReplicaSet appear? What does this tell you about which resource types vCluster treats as "virtual-only" versus "synced to host"?
