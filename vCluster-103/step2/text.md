```markdown
# Step 2 — Create two vClusters

Create two vClusters in the `team-x` namespace. We'll name them `my-vcluster-a` and `my-vcluster-b`.

Commands:

`kubectl create namespace team-x 2>/dev/null || true`{{exec}}

`vcluster create my-vcluster-a --namespace team-x`{{exec}}

`vcluster create my-vcluster-b --namespace team-x`{{exec}}

Verify both are running with `vcluster list`.

```
