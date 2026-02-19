# Create a Snapshot

vCluster has a built-in `vcluster snapshot` command that captures the complete state of a virtual cluster — including the backing store data (etcd or SQLite), Helm release information, and `vcluster.yaml` configuration.

## Disconnect from the vCluster

Before creating a snapshot, disconnect from the vCluster so the commands run against the host cluster:

`vcluster disconnect`{{exec}}

## Create the Snapshot

We'll use the `container://` protocol, which saves the snapshot to a local path within the vCluster's PersistentVolume. This is convenient for learning since it requires no external storage.

`vcluster snapshot create backup-demo "container:///data/snapshot.tar.gz"`{{exec}}

Let's break down this command:

- `vcluster snapshot create` — creates a new snapshot
- `backup-demo` — the name of the vCluster to snapshot
- `"container:///data/snapshot.tar.gz"` — the destination URL using the `container://` protocol, which writes to a path inside the vCluster's own PVC

## Check the Snapshot Status

`vcluster snapshot get backup-demo "container:///data/snapshot.tar.gz"`{{exec}}

The status should show the snapshot as completed. The snapshot captures the full control plane state, so all deployments, services, configmaps, secrets, and other resources are included.

## What Gets Captured

A `vcluster snapshot` includes:

- **Backing store data** — the complete etcd or SQLite database
- **Helm release info** — so the vCluster can be recreated with the same configuration
- **vcluster.yaml config** — the values used to create the vCluster
