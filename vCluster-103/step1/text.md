```markdown
# Step 1 — Overview

This scenario demonstrates that vClusters provide isolated control planes. Two tenants can use identical resource names (Deployments, Services) without colliding on the host cluster.

We'll create two vClusters: `my-vcluster-a` and `my-vcluster-b` (both in namespace `team-x`). Then we'll deploy the same application and service name `web` in both and expose them.

```
