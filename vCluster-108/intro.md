# Welcome to vCluster 108 — vind: vCluster in Docker

**vind** is the Docker driver for vCluster. It lets you run virtual Kubernetes clusters using Docker containers as the backing infrastructure — no host Kubernetes cluster required. The same `vcluster` CLI you already know switches modes with a single command.

In this scenario you will:

- Switch the vCluster CLI to use the Docker driver with `vcluster use driver docker`
- Create a virtual cluster backed by a Docker container instead of a Kubernetes namespace
- Deploy and access workloads exactly as you would with a kubeadm-backed vCluster
- Pause and resume a vind cluster to save resources
- Run two isolated vind clusters simultaneously and confirm they share nothing

By the end, you will be able to create fully functional Kubernetes clusters on any machine with Docker installed — no kubeadm, no cloud provider, no additional tooling.

Reference: https://www.vcluster.com/docs/vcluster/configure/vcluster-yaml/experimental/docker

GitHub: https://github.com/loft-sh/vind

If you need help, join the community Slack:

https://slack.vcluster.com
