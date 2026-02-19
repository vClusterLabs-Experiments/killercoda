# Step 4 — Control Plane Options

vCluster supports different control plane configurations to match your requirements.

## Distro Options

vCluster can use different Kubernetes distributions for the virtual control plane:

- **k8s** — Full Kubernetes with kube-apiserver, kube-controller-manager, and etcd
- **k3s** — Lightweight Kubernetes (default) with embedded SQLite
- **k0s** — Zero-friction Kubernetes distribution
- **eks** — Amazon EKS distribution

The distro is set at creation time and **cannot be changed** after deployment.

### Example: k8s distro configuration

```yaml
controlPlane:
  distro:
    k8s:
      enabled: true
```

## Backing Store Options

The backing store determines where the vCluster stores its data:

- **Embedded SQLite** (default for k3s) — Simple, no additional components needed
- **Embedded etcd** — Distributed, production-ready
- **External etcd** — Separate etcd cluster for high availability

### Example: embedded etcd configuration

```yaml
controlPlane:
  backingStore:
    etcd:
      embedded:
        enabled: true
```

## Persistence Options

By default, vCluster uses a PersistentVolumeClaim to store data. For testing, you can use an emptyDir:

```yaml
controlPlane:
  statefulSet:
    persistence:
      volumeClaim:
        enabled: false
```

**Note:** Using emptyDir means data is lost when the pod restarts. Only use this for testing.

## View Current Configuration

Let's check the current vCluster's control plane configuration:

`kubectl get statefulset -n config-ns -o yaml | head -50`{{exec}}

`kubectl get pvc -n config-ns`{{exec}}

You can see the PersistentVolumeClaim that stores the vCluster's data and the statefulset running the control plane.
