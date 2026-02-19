# DR Planning Summary and Cleanup

## Backup Strategies for vClusters

| Strategy | What It Captures | Recovery Speed | Complexity |
|----------|-----------------|----------------|------------|
| **`vcluster snapshot`** | Full control plane + optional volumes | Fast | Low |
| **`vcluster snapshot` + S3/OCI** | Full control plane (off-cluster) | Fast | Low-Medium |
| **YAML Export** | Resource definitions only | Medium | Low |
| **GitOps (ArgoCD/Flux)** | Declarative state in git | Fast | Medium |

## Recommendations

- **Development/Testing**: Use `vcluster snapshot` with `container://` for quick local backups. Simple and requires no external storage.
- **Production**: Use `vcluster snapshot` with `s3://` or `oci://` to store backups off-cluster. Combine with a GitOps approach for declarative vCluster configurations.
- **Stateful Workloads**: Add `--include-volumes` to capture CSI-backed PersistentVolume data alongside the control plane snapshot.
- **Backup Frequency**: Align backup frequency with your Recovery Point Objective (RPO). Critical production workloads may need frequent snapshots; development environments may only need daily backups.

## Key Commands Reference

| Command | Purpose |
|---------|---------|
| `vcluster snapshot create <name> "<url>"` | Create a snapshot |
| `vcluster snapshot get <name> "<url>"` | Check snapshot status |
| `vcluster restore <name> "<url>"` | Restore to an existing vCluster |
| `vcluster create <name> --restore "<url>"` | Clone snapshot to a new vCluster |

## Cleanup

`vcluster disconnect`{{exec}}

`vcluster delete backup-demo`{{exec}}

`vcluster list`{{exec}}
