# Shared Nodes

With Shared Nodes, all workloads from multiple virtual clusters run on the same underlying worker nodes. This is the **default** tenancy model — no special configuration is needed.

![Shared Nodes](../assets/shared_nodes.png)

```
┌─────────────────────────────────────────────┐
│              Host Cluster                    │
│                                              │
│  ┌──────────────┐   ┌──────────────┐        │
│  │  vCluster A  │   │  vCluster B  │        │
│  │ (control     │   │ (control     │        │
│  │  plane)      │   │  plane)      │        │
│  └──────┬───────┘   └──────┬───────┘        │
│         │                  │                 │
│         ▼                  ▼                 │
│  ┌─────────┐ ┌─────────┐ ┌─────────┐       │
│  │  Node 1 │ │  Node 2 │ │  Node 3 │       │
│  │ [A][B]  │ │ [A][B]  │ │ [A][B]  │       │
│  └─────────┘ └─────────┘ └─────────┘       │
│    Pods from A and B mixed across all nodes  │
└─────────────────────────────────────────────┘
```

## Benefits

- Very cost-efficient — maximizes node utilization
- Minimal complexity — works out of the box
- Perfect for dev, test, preview, and production environments

## Configuration

Shared Nodes is the default, so a basic `vcluster create` uses this model with no extra configuration.

If you want the vCluster to see **all** host nodes (not just nodes that have scheduled pods), you can enable full node syncing:

```yaml
sync:
  fromHost:
    nodes:
      enabled: true
      selector:
        all: true
```

This syncs all host nodes into the virtual cluster, giving workloads inside the vCluster visibility into the full node topology. Without this setting, vCluster only syncs nodes that are actively running pods for that virtual cluster.

## When to Use

- Development and testing environments
- Preview environments for pull requests
- Cost-sensitive workloads where isolation at the node level is not required
- Any scenario where the default scheduling behavior is acceptable
