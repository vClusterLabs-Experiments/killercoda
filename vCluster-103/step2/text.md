# Step 2 — Create a vCluster

A **vCluster (virtual cluster)** is a lightweight Kubernetes control plane that runs **inside** a Namespace but behaves as an independent Kubernetes cluster.

A vCluster has its own:
- API server
- Controllers
- CRDs

This isolates tenants at the *control plane level*, not just at the Namespace level.

Let's create a vCluster so that we can see what happens when we install different CRD versions on the host cluster and the vCluster.

`vcluster create my-vcluster --namespace team-x`{{exec}}

When connected, your kubeconfig points to the **vCluster API server**, not the host.

The vCluster deploys without any CRDs by default as it is a fresh Kubernetes deployment.

`kubectl get crds`{{exec}}

Now disconnect so we can install CRDs on the host first:

`vcluster disconnect`{{exec}}
