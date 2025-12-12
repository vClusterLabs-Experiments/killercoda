# CRD Version Differences (Host vs vCluster)

CRDs in Kubernetes are **cluster-scoped**, meaning all Namespaces share the same CRD definitions.

But vCluster creates a new API which can be configured with:
- Different CRD versions
- CRDs that don't exist on the host
- CRDs that would conflict in a shared cluster

## Check vCluster CRDs:

The vCluster deploys without any CRDs by default as it is a fresh Kubernetes deployment. 

`kubectl get crds`{{exec}}

## Check host CRDs:

Now we will disconnect from the vCluster and list the host CRDs.

`vcluster disconnect`{{exec}}

`kubectl get crds`{{exec}}

CRDs are a great way to demonstrate isolation in a vCluster.
