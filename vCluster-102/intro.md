# Welcome to **vCluster 102**, a hands-on scenario where you will explore what Kubernetes tenancy really means.

Kubernetes offers Namespaces as the default isolation method, but Namespaces alone fall short for true multitenancy. vCluster provides a lightweight virtualized control plane that isolates tenants.

In this scenario we will cover:

- Why Namespaces are limited
- How vCluster solves Namespace problems
- How CRDs behave globally vs virtually
- Running different CRD versions in host vs vCluster
- Installing alternative CRDs inside a vCluster
- vCluster Tenancy Modes:
  - Shared Nodes
  - Dedicated Nodes
  - Private Nodes
  - Private Nodes + Autonodes

By the end, you will understand how vCluster enables multi-tenant Kubernetes architectures.

If you need help, join the community Slack:

https://slack.vcluster.com
