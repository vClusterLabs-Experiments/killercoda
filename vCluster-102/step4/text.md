# Install Cert-Manager CRD in the Host Cluster

In this step, we simulate a real-world scenario where the platform team installs Cert-Manager at the cluster level. Cert-Manager is a widely-used certificate management operator that has evolved through multiple CRD versions.

## Disconnect from the vCluster and verify context:

`vcluster disconnect`{{exec}}

`kubectx`{{exec}}

## Install Cert-Manager v1.14 on the host:

`kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.14.0/cert-manager.crds.yaml`{{exec}}

`kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.14.0/cert-manager.yaml`{{exec}}

Inspect the CRD:

`kubectl get crd certificates.cert-manager.io -o yaml | head -30`{{exec}}

List all cert-manager CRDs:

`kubectl get crds | grep cert-manager`{{exec}}

## Result:

The host cluster now runs Cert-Manager v1.14.0 with its corresponding CRD versions.

This is a common scenario in shared cluster environments where the platform team manages a specific version.
