# What Is a Namespace?

Namespaces are the **default isolation mechanism** in Kubernetes. They allow logical grouping of resources, controlling access, and splitting environments or teams.
However, Namespaces **share a single control plane**.

## Problems with Namespaces:

- They do **not isolate the API server**
- **CRDs are global**—all tenants share the same version
- Cluster-wide controllers can affect all Namespaces
- Tenants can break each other through:
  - RBAC misconfigurations
  - Resource quota conflicts
  - CRD version mismatches

List namespaces:

`kubectl get ns`{{exec}}

Expected output includes `kube-system`, `default`, etc.

Namespaces are helpful, but they **cannot provide full multi-tenant isolation**.
