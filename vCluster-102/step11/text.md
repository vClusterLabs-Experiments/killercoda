# Private Nodes + Autonodes

Private Nodes give a vCluster **exclusive ownership** of nodes.
Autonodes allow the vCluster to automatically **create and remove nodes** based on workload demand.

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
  - Dynamic ephemeral testing

### Downsides:

- Highest cost
- Nodes are not shared with other teams
