# Dedicated Nodes

Dedicated Node tenancy ensures Pods from a vCluster run **only** on specific nodes assigned to that vCluster.

This is accomplished with nodeSelectors, taints, and tolerations.

### Example vcluster.yaml:

```yaml
sync:
  nodes:
    enabled: true

scheduler:
  nodeSelector:
    dedicated: tenant-1
```

### Benefits:

- Strong workload separation
- Reduced noisy-neighbor issues

### Downsides:

- Requires capacity planning
- Slightly more operational overhead
