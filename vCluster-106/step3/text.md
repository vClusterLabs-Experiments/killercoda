# Dedicated Nodes

Dedicated Nodes ensure pods from a vCluster run **only** on specific nodes assigned to that virtual cluster. This is accomplished by syncing only nodes with matching labels into the vCluster.

![Dedicated Nodes](../assets/dedicated_nodes.png)

```
┌──────────────────────────────────────────────┐
│              Host Cluster                     │
│                                               │
│  ┌──────────────┐    ┌──────────────┐        │
│  │  vCluster A  │    │  vCluster B  │        │
│  │ (control     │    │ (control     │        │
│  │  plane)      │    │  plane)      │        │
│  └──────┬───────┘    └──────┬───────┘        │
│         │                   │                 │
│         ▼                   ▼                 │
│  ┌─────────────┐    ┌─────────────────┐      │
│  │ label:      │    │ label:          │      │
│  │ team=a      │    │ team=b          │      │
│  │ ┌─────────┐ │    │ ┌────┐ ┌────┐  │      │
│  │ │  Node 1 │ │    │ │ N2 │ │ N3 │  │      │
│  │ │  [A][A] │ │    │ │[B] │ │[B] │  │      │
│  │ └─────────┘ │    │ └────┘ └────┘  │      │
│  └─────────────┘    └─────────────────┘      │
│    Pods scheduled only to labeled nodes       │
└──────────────────────────────────────────────┘
```

## Configuration

To dedicate nodes to a vCluster, label your host nodes (e.g., `team=team-a`) and configure the vCluster to sync only those nodes using `sync.fromHost.nodes.selector.labels`:

```yaml
sync:
  fromHost:
    nodes:
      enabled: true
      selector:
        labels:
          team: team-a
```

This tells vCluster to only sync host nodes that have the label `team=team-a`. Since the vCluster's scheduler only sees these nodes, all workloads are placed exclusively on the dedicated node pool.

To use this configuration, you would create the vCluster with:

```
vcluster create my-vcluster --namespace team-a --values vcluster.yaml
```

You can also combine label selectors with taints and tolerations on the host nodes to prevent other workloads from being scheduled onto dedicated nodes.

## Benefits

- Strong workload separation at the node level
- Predictable performance — no noisy neighbor issues
- Teams get dedicated compute resources
- Great for nodes with specialized hardware (GPUs, high-memory)

## When to Use

- Teams need guaranteed resources (GPU, high-memory)
- Compliance requires workload separation at the node level
- You want predictable performance for specific tenants
