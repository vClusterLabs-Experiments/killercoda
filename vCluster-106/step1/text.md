# Tenancy Model Overview

vCluster supports multiple models depending on your isolation needs.

## The Three Main Tenancy Modes:

1. **Shared Nodes** — All vCluster workloads run on the same worker nodes
2. **Dedicated Nodes** — Each vCluster gets specific worker nodes via nodeSelectors
3. **Private Nodes** — vCluster gets exclusive worker nodes
   1. **Autonodes** — Feature of Private Nodes that uses Karpenter for auto-scaling

Each model balances cost, performance, and security differently.

In the following steps we will explore each model in detail. Since this lab runs on a single-node environment, the Shared Nodes model is the only one we can fully demonstrate hands-on. For Dedicated and Private Nodes, we will review the configuration options.
