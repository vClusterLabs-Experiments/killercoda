# Step 2 — Resource Quotas

Resource quotas cap the total amount of resources that can be consumed in the virtual cluster's default namespace. This is useful for enforcing tenant spending limits without relying on the host cluster's quota system.

## Disconnect if still connected

`vcluster disconnect`{{exec}}

## Write the vcluster.yaml

```yaml
policies:
  podSecurityStandard: baseline
  resourceQuota:
    enabled: true
    quota:
      pods: "3"
```

Save this as `vcluster.yaml` in the **Editor** tab.

This configuration caps the default namespace at 3 pods.

## Create the vCluster

`vcluster create quota-demo --namespace quota-ns --values vcluster.yaml`{{exec}}

## Verify the ResourceQuota was created

`kubectl get resourcequota`{{exec}}

You should see a quota object with `pods: 3`.

## Deploy pods up to the limit

`kubectl run pod1 --image=nginx:alpine`{{exec}}

`kubectl run pod2 --image=nginx:alpine`{{exec}}

`kubectl run pod3 --image=nginx:alpine`{{exec}}

All three should be accepted.

`kubectl get pods`{{exec}}

## Try to exceed the quota

`kubectl run pod4 --image=nginx:alpine`{{exec}}

This should fail with a message like:

```
Error from server (Forbidden): pods "pod4" is forbidden: exceeded quota: ... pods, requested: 1, used: 3, limited: 3
```

> **Operator use case**: Set per-namespace quotas per tenant vCluster to prevent any single tenant from starving shared host node resources. Combine with `limitRange` (next step) so pods without resource specs are still accounted for.

Reference: https://www.vcluster.com/docs/vcluster/configure/vcluster-yaml/policies/
