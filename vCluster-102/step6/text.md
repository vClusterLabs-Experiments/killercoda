# Install an Alternative or Updated CRD in the Host Cluster

The host cluster may install other CRDs for other operators or workloads.

## Example: Install Postgres Operator (which creates the CRD):

`helm repo add cnpg https://cloudnative-pg.github.io/charts`{{exec}}

`helm install postgres-operator cnpg/cloudnative-pg --namespace kube-system --create-namespace`{{exec}}

Then list all CRDs:

`kubectl get crds`{{exec}}

The host now contains both MySQL and Postgres CRDs globally.

This illustrates how CRDs accumulate in platform clusters and why isolation matters.
