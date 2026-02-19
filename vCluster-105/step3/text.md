# Explore Snapshot Options

Now that you've created a snapshot, let's explore the different storage protocols and options available for production use.

## Review the Snapshot

Check the snapshot status again:

`vcluster snapshot get backup-demo "container:///data/snapshot.tar.gz"`{{exec}}

## Storage Protocols

The `container://` protocol we used stores the snapshot on the vCluster's own PVC. This is great for quick backups but has a limitation — if the PVC is deleted, the snapshot is lost too.

For production environments, vCluster supports additional protocols:

| Protocol | Example URL | Use Case |
|----------|------------|----------|
| `container://` | `container:///data/snapshot.tar.gz` | Local backup on vCluster PVC — simple, no external dependencies |
| `s3://` | `s3://my-bucket/backups/snapshot.tar.gz` | AWS S3 or S3-compatible storage — durable, off-cluster |
| `oci://` | `oci://registry.example.com/snapshots:v1` | OCI-compatible container registries — versioned, portable |

## Including Persistent Volumes

By default, snapshots only capture the control plane state. If your vCluster runs stateful workloads with CSI-backed PersistentVolumes, you can include volume data:

```
vcluster snapshot create my-vcluster "s3://bucket/snapshot.tar.gz" --include-volumes
```

The `--include-volumes` flag triggers CSI volume snapshots for all PVCs in the vCluster, bundling the data with the control plane snapshot.

## Snapshot vs. Other Backup Methods

| Method | Scope | External Tools Needed |
|--------|-------|----------------------|
| `vcluster snapshot` | Full control plane + optional volumes | None (built-in) |
| YAML export (`kubectl get -o yaml`) | Resource definitions only | None |
| GitOps (ArgoCD/Flux) | Declarative state in git | GitOps tooling |

The built-in snapshot is the recommended approach for most vCluster backup scenarios because it captures everything needed to fully restore the virtual cluster.
