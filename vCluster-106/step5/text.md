# Choosing a Tenancy Model

Here is a summary to help you choose the right tenancy model:

| Model | Isolation | Cost | Complexity | Best For |
|-------|-----------|------|------------|----------|
| **Shared Nodes** | Control plane | Low | Low | Dev, test, preview, general production |
| **Dedicated Nodes** | Control plane + node | Medium | Medium | GPU teams, performance-sensitive workloads |
| **Private Nodes** | Full (exclusive nodes) | High | High | Compliance, sensitive data, multi-cloud |
| **Private + Autonodes** | Full + auto-scaling | High | Medium | Dynamic workloads, GPU clouds |

## Key Takeaways:

- Start with **Shared Nodes** — it covers most use cases
- Move to **Dedicated Nodes** when you need resource guarantees or hardware separation
- Use **Private Nodes** when compliance or security mandates full isolation
- Add **Autonodes** when you need dynamic scaling per tenant

For more details on configuring tenancy models, see the vCluster documentation:

https://www.vcluster.com/docs/vcluster/configure/vcluster-yaml/
