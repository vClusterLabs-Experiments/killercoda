# Step 1 — Understanding CRDs and Namespaces

Namespaces are the **default isolation mechanism** in Kubernetes. They allow logical grouping of resources, controlling access, and splitting environments or teams. However, Namespaces **share a single control plane**.

## Problems with Namespaces:

- They do **not isolate the API server**
- **CRDs are global** — all tenants share the same version
- Cluster-wide controllers can affect all Namespaces
- Tenants can break each other through RBAC misconfigurations or resource quota conflicts

Namespaces are helpful, but they **may not provide full multi-tenant isolation**.

Let's take a look at the CRDs on the host cluster. These CRDs are shared by all Namespaces:

`kubectl get crds`{{exec}}

`kubectl get namespaces`{{exec}}

Notice how CRDs exist at the cluster level, not within a Namespace. This is the fundamental limitation we will solve with vCluster.
