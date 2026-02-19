# Step 5 — Layered Defense and Cleanup

In production you want all three policy layers active together. PSS blocks unsafe pods, resource quotas cap total consumption, and limit ranges ensure every pod has resource specs. This step combines all three in one `vcluster.yaml`.

## Disconnect if still connected

`vcluster disconnect`{{exec}}

## Write the vcluster.yaml

```yaml
policies:
  podSecurityStandard: baseline
  resourceQuota:
    enabled: true
    quota:
      pods: "5"
      requests.cpu: "2"
      requests.memory: "1Gi"
      limits.cpu: "4"
      limits.memory: "2Gi"
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

Save this as `vcluster.yaml` in the **Editor** tab.

## Create the vCluster

`vcluster create layered-demo --namespace layered-ns --values vcluster.yaml`{{exec}}

## Verify all three policy objects exist

`kubectl get resourcequota`{{exec}}

`kubectl get limitrange`{{exec}}

## Test all three layers

**Layer 1 — PSS blocks privileged pod:**

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: bad-pod
spec:
  containers:
  - name: c
    image: nginx:alpine
    securityContext:
      privileged: true
```

Save this as `bad-pod.yaml` in the **Editor** tab.

`kubectl apply -f bad-pod.yaml 2>&1 || true`{{exec}}

**Layer 2 — LimitRange injects defaults:**

`kubectl run compliant --image=nginx:alpine`{{exec}}

`kubectl get pod compliant -o jsonpath='{.spec.containers[0].resources}' | python3 -m json.tool`{{exec}}

**Layer 3 — Quota tracks usage:**

`kubectl describe resourcequota`{{exec}}

You should see the Used column is non-zero for CPU and memory requests.

## Cleanup all vClusters

`vcluster disconnect`{{exec}}

`vcluster delete layered-demo --namespace layered-ns`{{exec}}

`vcluster delete rbac-demo --namespace rbac-ns`{{exec}}

`vcluster delete limits-demo --namespace limits-ns`{{exec}}

`vcluster delete quota-demo --namespace quota-ns`{{exec}}

`vcluster delete security-demo --namespace security-ns`{{exec}}

> **Summary**: `policies.*` provides tenant-facing admission controls inside each vCluster. `rbac.*` adjusts what the syncer can do on the host. Together they give platform teams both tenant safety and precise syncer permissions.
