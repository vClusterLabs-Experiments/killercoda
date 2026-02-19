# Step 3 — Limit Ranges

Limit ranges inject default CPU and memory requests and limits into pods that don't specify them. Without limit ranges, pods with no resource spec are unaccounted for in quota calculations and can overconsume node resources.

## Disconnect if still connected

`vcluster disconnect`{{exec}}

## Write the vcluster.yaml

```yaml
policies:
  limitRange:
    enabled: true
    default:
      cpu: "500m"
      memory: "256Mi"
    defaultRequest:
      cpu: "100m"
      memory: "128Mi"
```

Save this as `vcluster.yaml` in the **Editor** tab.

- `default` — applied as the **limit** when a container doesn't specify one
- `defaultRequest` — applied as the **request** when a container doesn't specify one

## Create the vCluster

`vcluster create limits-demo --namespace limits-ns --values vcluster.yaml`{{exec}}

## Verify the LimitRange was created

`kubectl get limitrange`{{exec}}

`kubectl describe limitrange`{{exec}}

## Create a pod with no resource spec

`kubectl run bare-pod --image=nginx:alpine`{{exec}}

`kubectl get pod bare-pod`{{exec}}

Wait for it to run, then inspect the actual resource spec:

`kubectl get pod bare-pod -o jsonpath='{.spec.containers[0].resources}' | python3 -m json.tool`{{exec}}

You should see that the pod has `requests` of `cpu: 100m, memory: 128Mi` and `limits` of `cpu: 500m, memory: 256Mi` — injected automatically by the LimitRange.

> **Why this matters**: Resource quotas only account for pods that declare resource requests. Without a LimitRange, an unlimited pod would not consume quota, making quota enforcement unreliable. Use both together.

Reference: https://www.vcluster.com/docs/vcluster/configure/vcluster-yaml/policies/
