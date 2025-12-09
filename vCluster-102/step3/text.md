# CRD Version Differences (Host vs vCluster)

CRDs in Kubernetes are **cluster-scoped**, meaning all Namespaces share the same CRD definitions.

But vClusters **virtualize CRDs**, so each vCluster can define:
- different CRD versions
- CRDs that don't exist on the host
- CRDs that would conflict in a shared cluster

## Check host CRDs:

`kubectl get crds`{{exec}}

## Check vCluster CRDs:

`vcluster connect my-vcluster --namespace team-x`{{exec}}

`kubectl get crds`{{exec}}

You will usually see fewer CRDs inside the vCluster unless you install some.

CRDs become a perfect demonstration of vCluster isolation.
