# Step 4 — Create a Deployment

We're still connected to the vCluster. Check what's running inside it right now:

`kubectl get pods`{{exec}}

Nothing — the vCluster is empty. Now create an nginx deployment:

`kubectl create deployment nginx --image=nginx`{{exec}}

Check that the deployment and pod now exist inside the vCluster:

`kubectl get deployment`{{exec}}

`kubectl get pods`{{exec}}

The deployment and pod are visible here. Behind the scenes, the vCluster's syncer is writing the pod object down to the host cluster so it can actually be scheduled. You can describe the pod to see events and confirm it started correctly:

`kubectl describe pod nginx`{{exec}}

In Step 5 you'll disconnect and look at the host cluster directly. You'll see the nginx pod listed there — but the Deployment object won't appear at all. That distinction is the core of vCluster's isolation model.
