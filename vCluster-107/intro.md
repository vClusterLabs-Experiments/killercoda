# Welcome to vCluster 107 — RBAC and Security Policies

vCluster exposes two distinct security configuration areas in `vcluster.yaml`:

- **`policies.*`** — Admission controls enforced *inside* the virtual cluster (Pod Security Standards, resource quotas, limit ranges)
- **`rbac.*`** — Adjusts the syncer's permissions on the *host* cluster (extraRules, overwriteRules on the syncer ClusterRole)

In this scenario you will:

- Enforce the `baseline` Pod Security Standard inside a vCluster
- Set resource quotas to cap how many pods tenants can run
- Apply limit ranges to inject default CPU and memory requests/limits
- Extend syncer host permissions using `rbac.clusterRole.extraRules`
- Combine all three policy layers in a single vcluster.yaml

By the end, you will know how to apply defense-in-depth security controls to vClusters in production.

Reference: https://www.vcluster.com/docs/vcluster/configure/vcluster-yaml/rbac

Reference: https://www.vcluster.com/docs/vcluster/configure/vcluster-yaml/policies/

If you need help, join the community Slack:

https://slack.vcluster.com
