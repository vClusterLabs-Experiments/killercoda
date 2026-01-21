# Dedicated Nodes

Dedicated Nodes ensure Pods from a vCluster run **only** on specific nodes assigned to that vCluster.

This is accomplished with nodeSelectors, taints, and tolerations.

### Example vcluster.yaml:

```yaml
sync:
  nodes:
    enabled: true

scheduler:
  nodeSelector:
    dedicated: team-x
```

### Benefits:

- Strong workload separation
- Great for putting teams on nodes with GPUs

![Scan Results](../assets/dedicated_nodes_killercoda.png)