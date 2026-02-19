# Step 5 — Install Kyverno on the Host Cluster

The host cluster can run a policy controller such as Kyverno. Kyverno adds policy CRDs (`ClusterPolicy`, `Policy`, etc.) and is straightforward to install via manifest.

## Verify Context

Let's make sure we are on the host cluster before deploying Kyverno.

`kubectx`{{exec}}

If at any time you need to swap to the Host Cluster from the vCluster you can run:

`vcluster disconnect`{{exec}}

## Install Kyverno on the host:

`kubectl create -f https://github.com/kyverno/kyverno/releases/download/v1.11.1/install.yaml`{{exec}}

List Kyverno CRDs:

`kubectl get crds | grep -i kyverno`{{exec}}

The host now contains Kyverno CRDs.
