# Private Nodes

Private Nodes give a vCluster **exclusive ownership** of its own worker nodes, completely separate from the host cluster's node pool. The vCluster control plane runs on the host cluster, but workloads run on private nodes that are not shared with any other tenant.

![Private Nodes](../assets/private_nodes.png)

```
┌──────────────────────────────┐
│      Host Cluster            │
│                              │
│  ┌────────────────────────┐  │
│  │  vCluster A            │  │
│  │  (control plane)       │  │
│  └────────┬───────────────┘  │
└───────────│──────────────────┘
            │ Konnectivity tunnel
            ▼
┌──────────────────────────────┐
│  Private Node Pool (A)       │
│  ┌────────┐ ┌────────┐      │
│  │ Node 1 │ │ Node 2 │      │
│  │  [A]   │ │  [A]   │      │
│  └────────┘ └────────┘      │
│  Exclusive — not shared      │
└──────────────────────────────┘
```

## Configuration

Private Nodes requires additional configuration for the control plane distribution, networking, and service exposure:

```yaml
privateNodes:
  enabled: true
controlPlane:
  distro:
    k8s:
      image:
        tag: v1.31.2
  service:
    spec:
      type: LoadBalancer
networking:
  podCIDR: 10.64.0.0/16
  serviceCIDR: 10.128.0.0/16
```

Key configuration sections:

- **`privateNodes.enabled`** — Enables the private nodes feature
- **`controlPlane.distro`** — Sets the Kubernetes distribution and version for the private nodes
- **`controlPlane.service.spec.type`** — Exposes the vCluster control plane so private nodes can reach it (typically `LoadBalancer`)
- **`networking.podCIDR` / `serviceCIDR`** — Defines non-overlapping network ranges for the private node pool

## Autonodes

Autonodes is a related feature that allows a vCluster to automatically **provision and remove nodes** based on workload demand, using [Karpenter](https://karpenter.sh/) under the hood.

> **Note:** Autonodes requires **vCluster Platform** (the commercial product) and a properly configured Karpenter installation. It is not a simple YAML toggle in open-source vCluster.

When available, Autonodes enables true per-tenant auto-scaling — each vCluster can dynamically grow and shrink its own node pool independently of other tenants.

## Benefits

- Highest level of isolation — hardware is not shared between tenants
- Dedicated node pools per virtual cluster
- Supports multi-cloud deployments where tenants need nodes in different regions
- Full control over Kubernetes version on worker nodes

## When to Use

- Strict compliance or security requirements demand hardware-level separation
- Workloads that must not share physical infrastructure with other tenants
- Multi-cloud deployments where tenants need nodes in different regions or providers
- Scenarios requiring independent Kubernetes version control per tenant
