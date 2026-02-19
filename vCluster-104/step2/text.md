# Step 2 — Resource Limits and Requests

In production environments, you should set resource limits on the vCluster control plane to prevent it from consuming too many host cluster resources.

## Disconnect and Update Configuration

First, disconnect from the vCluster:

`vcluster disconnect`{{exec}}

Create an updated configuration with resource limits. Copy the YAML below:

```yaml
sync:
  toHost:
    ingresses:
      enabled: true
  fromHost:
    nodes:
      enabled: true
controlPlane:
  statefulSet:
    resources:
      limits:
        cpu: "1"
        memory: "512Mi"
      requests:
        cpu: "200m"
        memory: "256Mi"
```

The `controlPlane.statefulSet.resources` section sets CPU and memory limits on the vCluster control plane pod, just like you would for any Kubernetes workload.

Save this as `vcluster.yaml` in the **Editor** tab (overwriting the previous configuration).

## Apply the Updated Configuration

Use the `--upgrade` flag to update the existing vCluster:

`vcluster create config-demo --namespace config-ns --upgrade --values vcluster.yaml`{{exec}}

## Verify Resource Limits

Disconnect from the vCluster so we can query the host cluster:

`vcluster disconnect`{{exec}}

Check the statefulset to confirm resource limits are applied:

`kubectl get statefulset -n config-ns -o jsonpath='{range .items[*]}{.metadata.name}{"\n"}{.spec.template.spec.containers[0].resources}{"\n"}{end}'`{{exec}}

You should see the CPU and memory limits we configured. Setting resource limits is a best practice for production vClusters to ensure fair resource sharing on the host cluster.
