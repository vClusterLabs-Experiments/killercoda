# Install Kyverno in the Host Cluster

The host cluster can run a policy controller such as Kyverno. Kyverno adds policy CRDs (`ClusterPolicy`, `Policy`, etc.) and is straightforward to install via manifest.

## Verify Context

Let's make sure we are on the host cluster before deploying Kyverno.

`kubectx`{{exec}}

If not then run disconnect

`vcluster disconnect`

## Install Kyverno on the host:

`kubectl apply -f https://github.com/kyverno/kyverno/releases/download/v1.11.1/install.yaml`{{exec}}

List Kyverno CRDs:

`kubectl get crds | grep -i kyverno`{{exec}}

The host now contains Kyverno CRDs and the controller.

This illustrates how policy CRDs accumulate in platform clusters and why isolation matters.
