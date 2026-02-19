# Step 1 — Configuration with vcluster.yaml

The `vcluster.yaml` file is the central configuration source for a vCluster. It controls everything from the control plane architecture to resource sync behavior.

If no `vcluster.yaml` is provided, vCluster applies defaults: embedded SQLite database, basic resource syncing (pods, services), and ClusterIP networking.

## Create a Custom Configuration

Let's create a `vcluster.yaml` that customizes our vCluster. Copy the configuration below:

```yaml
sync:
  toHost:
    ingresses:
      enabled: true
  fromHost:
    nodes:
      enabled: true
```

- **`sync.toHost.ingresses.enabled`** — Syncs ingress resources from the vCluster to the host cluster so they can be served by the host's ingress controller.
- **`sync.fromHost.nodes.enabled`** — Syncs real node information into the vCluster instead of creating fake nodes.

Save this as `vcluster.yaml` in the **Editor** tab.

## Create a vCluster with Custom Config

`vcluster create config-demo --namespace config-ns --values vcluster.yaml`{{exec}}

Verify the vCluster is running:

`vcluster list`{{exec}}

You can see the nodes synced from the host cluster:

`kubectl get nodes`{{exec}}

With the default configuration, vCluster creates fake nodes. With `sync.fromHost.nodes.enabled: true`, real host node information is visible inside the vCluster.
