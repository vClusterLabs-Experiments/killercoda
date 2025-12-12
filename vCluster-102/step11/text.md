# Private Nodes + Autonodes

Private Nodes give a vCluster **exclusive ownership** of nodes.

Autonodes allow the vCluster to automatically **create and remove nodes** based on workload demand using Karpenter.

These features provide the **strongest form of isolation**.

### Example Configuration:

```yaml
privateNodes:
  enabled: true
  autonodes:
    enabled: true
```

### Benefits:

- Highest isolation
- Auto-scaling node pools per tenant
- Ideal for:
  - Compliance environments
  - Sensitive workloads
  - GPU Clouds
  - Multi-Cloud