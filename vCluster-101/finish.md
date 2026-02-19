### Great Job — You've Seen What vCluster Actually Does!

You've completed vCluster 101. You didn't just read about isolation — you watched a Deployment disappear from the host's view while its pod kept running, and you compared CRD lists between the virtual and host clusters to see the separation firsthand.

## Quick Self-Check

Before moving to vCluster 102, can you answer these without looking them up?

1. You deployed nginx inside the vCluster, but `kubectl get deployment -n team-x` on the host returned nothing. Why?
2. If you delete the `team-x` namespace directly on the host, what happens to the vCluster and everything inside it?
3. What command shows the host-side resources that back your vCluster?
4. Two teams both need a resource named `default` — one needs a namespace, the other needs a ServiceAccount. What's the minimum you need to create to give them both without conflict?

Answers are in the [vCluster docs](https://www.vcluster.com/docs/vcluster/).

## Where to go next

- **vCluster 102** — Multi-Tenancy Isolation: deploy the same app name into two vClusters on one host and prove they don't interfere
- **vCluster 103** — Tenancy Models & CRDs: install different cert-manager versions simultaneously in isolated vClusters
- **All scenarios**: see the [full lab series](https://killercoda.com/vcluster)

## Try vCluster on your own

- **Run vCluster locally** with [vind](https://github.com/loft-sh/vind) — spin up virtual clusters on your own machine
- **Sign up for free** at [vcluster.com/pricing](https://vcluster.com/pricing) — get started with the free tier on any Kubernetes cluster
- **Join us on Slack**: [slack.vcluster.com](https://slack.vcluster.com) — questions, feedback, and community

Thank you for working through the vCluster 101 lab!
