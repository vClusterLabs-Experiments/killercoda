# Tenancy Model Overview

vCluster supports multiple models depending on your isolation needs.

## The Three Main Tenancy Modes:

1. **Shared Nodes** — All vCluster workloads run on the same worker nodes  
2. **Dedicated Nodes** — Each vCluster gets specific worker nodes via nodeSelectors  
3. **Private Nodes** — vCluster gets exclusive worker nodes
   1. **Auto Node** - Feature of Private Nodes that uses Karpenter for auto-scaling

Each model balances cost, performance, and security differently.

This is what you'll explore in the next steps.
