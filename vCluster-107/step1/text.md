# Step 1 — Pod Security Standards

Pod Security Standards (PSS) define three policy levels: `privileged`, `baseline`, and `restricted`. When configured in vcluster.yaml, the selected standard is enforced by the vCluster's internal admission webhook — not the host cluster's admission system. This means each vCluster can have its own independent security policy.

## Write the vcluster.yaml

```yaml
policies:
  podSecurityStandard: baseline
```

Save this as `vcluster.yaml` in the **Editor** tab.

The `baseline` standard blocks the most common privilege escalation paths — hostPID, hostNetwork, hostIPC, privileged containers, and unsafe volume types — while allowing most legitimate workloads through.

## Create the vCluster

`vcluster create security-demo --namespace security-ns --values vcluster.yaml`{{exec}}

This command creates the vCluster and connects to it automatically.

## Deploy a compliant pod

A standard nginx pod has no privileged settings, so it passes `baseline`:

`kubectl run nginx --image=nginx:alpine`{{exec}}

`kubectl get pod nginx`{{exec}}

The pod should be `Running`.

## Try to deploy a privileged pod

Now try a pod that requests `privileged: true`:

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: priv-pod
spec:
  containers:
  - name: priv
    image: nginx:alpine
    securityContext:
      privileged: true
```

Save this as `priv-pod.yaml` in the **Editor** tab.

`kubectl apply -f priv-pod.yaml`{{exec}}

The admission webhook should reject this with an error mentioning the `baseline` policy violation. The pod will not be created.

`kubectl get pod priv-pod 2>&1 || true`{{exec}}

> **What's happening?** The `policies.podSecurityStandard` setting installs a vCluster-internal admission controller. The host cluster's own admission policies are separate — the host may allow privileged pods, but tenants using this vCluster cannot create them.

Reference: https://www.vcluster.com/docs/vcluster/configure/vcluster-yaml/policies/
