# Welcome to vCluster 101

Imagine your platform team gets three requests on the same day: the ML team needs a cluster with custom CRDs, the security team needs a hardened environment to test policy changes, and a new product squad needs somewhere safe to break things without touching production. Provisioning three real clusters takes hours and costs real money. Telling everyone to share namespaces on one cluster means one team's CRD install or RBAC mistake can affect everyone else.

vCluster is a third option: a full Kubernetes control plane that runs inside a single namespace on your existing cluster. It spins up in seconds, gives each tenant their own isolated API server and etcd, and disappears cleanly when it's no longer needed — all without touching the host cluster's configuration.

In this lab you'll create a vCluster, deploy an application into it, then disconnect and look at what the host cluster actually sees. That moment — realizing the deployment you created has vanished from the host's view while the pod is still running — is what makes the isolation real.

![Shared Nodes](./assets/shared-nodes.png)

## What you'll do

- Install the vCluster CLI
- Deploy a vCluster into a namespace on the host cluster
- Inspect how the vCluster's resources differ from the host's
- Create a Deployment inside the vCluster
- Disconnect and observe what the host cluster sees (and doesn't see)
- Delete the vCluster and confirm everything cleans up

We keep this lab focused on the fundamentals. The follow-on labs (102–108) go deeper into multi-tenancy, CRD isolation, backup/restore, security policies, and more.

Thanks for checking this out — we think vCluster is pretty cool and would love to hear from you on [Slack](https://slack.vcluster.com) if you have feedback.
