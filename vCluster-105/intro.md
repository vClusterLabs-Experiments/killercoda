# Welcome to vCluster 105 — Backup and Disaster Recovery

Having a backup and recovery strategy is essential for any production environment. vCluster provides a built-in `vcluster snapshot` command that captures the complete state of a virtual cluster and enables fast recovery.

In this scenario we will cover:

- Creating a vCluster with workloads worth backing up
- Using `vcluster snapshot create` to back up the vCluster
- Exploring snapshot options and storage protocols
- Simulating a disaster by deleting workloads inside the vCluster
- Restoring from a snapshot with `vcluster restore`
- Planning a DR strategy

By the end, you will understand how to protect your vCluster workloads and recover from failures using the built-in snapshot functionality.

If you need help, join the community Slack:

https://slack.vcluster.com
