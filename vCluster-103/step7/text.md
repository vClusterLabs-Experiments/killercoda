# Step 7 — Cleanup and Summary

Let's clean up by deleting the vCluster.

`vcluster delete my-vcluster`{{exec}}

Verify the vCluster has been removed:

`vcluster list`{{exec}}

## What We Learned

In this scenario we demonstrated CRD isolation with vCluster:

- **Cert-Manager v1.14** on the host vs **v1.13** in the vCluster — different teams can run different versions without conflict
- **Kyverno** on the host vs **OPA Gatekeeper** in the vCluster — teams can choose their own policy engines independently
- CRDs are cluster-scoped in Kubernetes, but vCluster gives each tenant their own cluster-scope

This isolation is key to enabling multi-tenant Kubernetes environments where teams need independence without the cost of separate physical clusters.
