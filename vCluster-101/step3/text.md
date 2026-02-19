# Step 3 — Inspect the vCluster

Now that the vCluster has been created and we are connected, let's look at the current context:

`kubectx`{{exec}}

We are now using the `vcluster_my-vcluster_team-x_kubernetes-admin@kubernetes` context.

Let's look at the CRDs and Namespaces that exist inside the vCluster:

`kubectl get crd`{{exec}}

`kubectl get namespaces`{{exec}}

> **Stop and Think**
> You ran the same commands in Step 2 (against the host) and just now (against the vCluster) and got completely different results. Why are the CRD lists different? What would happen if Team A installed a custom CRD version into the vCluster — would it appear on the host? What would break if two teams tried to install conflicting CRD versions in a shared namespace instead of isolated vClusters?

The vCluster has its own API server and database. It doesn't inherit or share CRDs with the host — this is what makes it possible for tenants to install different operator versions or even run a different Kubernetes version than the host.

We can also list the virtual clusters that have been created:

`vcluster list`{{exec}}
