# Congratulations — vCluster 107 Complete!

You have successfully applied security policies and RBAC controls to vClusters.

## What You Learned

- **Pod Security Standards** — `policies.podSecurityStandard: baseline` blocks privileged workloads at admission time inside the vCluster
- **Resource Quotas** — `policies.resourceQuota` caps how many pods (and other resources) tenants can create in the virtual cluster
- **Limit Ranges** — `policies.limitRange` automatically injects default CPU and memory requests/limits into pods that don't specify them
- **Syncer RBAC extraRules** — `rbac.clusterRole.extraRules` adds custom host-level permissions to the syncer's ClusterRole without replacing the defaults
- **Layered Defense** — All three policy types can be combined in a single `vcluster.yaml` for defense-in-depth

## Key vcluster.yaml Patterns

```yaml
policies:
  podSecurityStandard: baseline
  resourceQuota:
    enabled: true
    quota:
      pods: "3"
  limitRange:
    enabled: true
    default:
      cpu: "500m"
      memory: "256Mi"
    defaultRequest:
      cpu: "100m"
      memory: "128Mi"

rbac:
  clusterRole:
    extraRules:
      - apiGroups: [""]
        resources: ["nodes"]
        verbs: ["get", "list", "watch"]
```

## Next Steps

- **vCluster 108** — Run vClusters inside Docker using `vind` (no host Kubernetes cluster required)
- Explore `policies.networkPolicy` for virtual-network-level isolation
- Combine `rbac.overwriteRules` when you need to replace (not extend) the default syncer permissions

Reference docs:
- https://www.vcluster.com/docs/vcluster/configure/vcluster-yaml/policies/
- https://www.vcluster.com/docs/vcluster/configure/vcluster-yaml/rbac

https://slack.vcluster.com
