# What Is a vCluster?

A **vCluster (virtual cluster)** is a lightweight Kubernetes control plane that runs **inside** a Namespace but behaves as an independent Kubernetes cluster.

A vCluster has its own:
- API server
- Scheduler
- Controllers
- CRDs

This isolates tenants at the *control plane level*, not just at the Namespace level.

## Create a vCluster:

`vcluster create my-vcluster --namespace team-x`{{exec}}

When connected, your kubeconfig points to the **virtual API server**, not the host.
