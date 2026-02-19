# Welcome to vCluster 103 — Advanced CRD Management

Kubernetes offers Namespaces as the default isolation method, but Namespaces alone fall short for true multitenancy. CRDs are cluster-scoped, meaning all Namespaces share the same CRD definitions. vCluster provides a lightweight virtualized control plane that isolates tenants at the API level.

In this scenario we will cover:

- Why Namespaces are limited for CRD isolation
- How vCluster solves Namespace problems
- How CRDs behave globally vs virtually
- Running different CRD versions in host vs vCluster
- Installing alternative policy engines inside a vCluster

By the end, you will understand how vCluster enables CRD isolation for multi-tenant Kubernetes architectures.

If you need help, join the community Slack:

https://slack.vcluster.com
