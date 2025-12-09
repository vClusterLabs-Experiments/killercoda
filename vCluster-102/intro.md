# Welcome to **vCluster 102**, a hands-on scenario where you will explore what Kubernetes tenancy really means.

Kubernetes offers Namespaces as the default isolation method, but Namespaces alone fall short for true multitenancy. vCluster provides a lightweight virtualized control plane that isolates tenants at the API server, CRD, controller, and scheduler levels.

In this scenario we will cover:

- Why Namespaces are limited
- How vClusters solve Namespace problems
- How CRDs behave globally vs virtually
- Running different CRD versions in host vs vCluster
- Installing alternative components inside a vCluster
- vCluster Tenancy Modes:
  - Shared Nodes
  - Dedicated Nodes
  - Private Nodes
  - Private Nodes + Autonodes

By the end, you will understand how vCluster enables multi-tenant Kubernetes architectures safely and efficiently.

If you need help, join the community Slack:

https://slack.vcluster.com
