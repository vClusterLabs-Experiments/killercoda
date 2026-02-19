# Step 2 — Deploy a vCluster

Before we deploy the vCluster, let's record what the host cluster looks like right now. This gives you a baseline to compare against when you look at the host again in Step 5.

Check what namespaces exist on the host:

`kubectl get namespaces`{{exec}}

Check what CRDs are registered on the host:

`kubectl get crds`{{exec}}

Note what you see — the namespace list and CRD list are your "before" snapshot. A vCluster creates its own virtual API server and etcd, so its namespace and CRD lists will be completely independent of these.

Now create the vCluster:

`vcluster create my-vcluster --namespace team-x`{{exec}}

After the command finishes and the vCluster is available, you'll be automatically connected to it. This demo environment has Docker installed, which spins up a proxy container to handle the connection.

At this point your `kubectl` context has switched to the vCluster. In Step 5 you'll disconnect and inspect the host to see what actually appeared there when you ran this command.
