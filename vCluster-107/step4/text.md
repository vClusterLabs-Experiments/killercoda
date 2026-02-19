# Step 4 — Syncer RBAC — extraRules

The vCluster syncer runs on the host cluster and needs a ClusterRole to access host resources. By default, this ClusterRole covers only what the syncer needs for its built-in features. You can extend it with `rbac.clusterRole.extraRules` without replacing the defaults.

## Disconnect if still connected

`vcluster disconnect`{{exec}}

## Write the vcluster.yaml

```yaml
rbac:
  clusterRole:
    extraRules:
      - apiGroups: [""]
        resources: ["nodes"]
        verbs: ["get", "list", "watch"]
```

Save this as `vcluster.yaml` in the **Editor** tab.

This adds read-only access to host Node objects for the syncer. This is already in the default rules for most vCluster configurations, but it illustrates the pattern for adding custom permissions.

## Create the vCluster

`vcluster create rbac-demo --namespace rbac-ns --values vcluster.yaml`{{exec}}

## Inspect the syncer ClusterRole on the host

`vcluster disconnect`{{exec}}

Find the syncer ClusterRole name:

`kubectl get clusterrole | grep rbac-demo`{{exec}}

Describe it to see the rules including your extraRules:

`kubectl describe clusterrole $(kubectl get clusterrole | grep rbac-demo | awk '{print $1}' | head -1)`{{exec}}

Look for the `nodes` rule in the output — that is your extra rule merged in alongside the default syncer permissions.

> **extraRules vs overwriteRules**: `extraRules` appends to the default syncer ClusterRole rules. `overwriteRules` replaces the entire rule set — use this only when you fully understand what the syncer needs and want fine-grained control.

Reference: https://www.vcluster.com/docs/vcluster/configure/vcluster-yaml/rbac
