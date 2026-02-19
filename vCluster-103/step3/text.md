# Step 3 — Install Cert-Manager CRD on Host

In this step, we simulate a real-world scenario where the platform team installs Cert-Manager at the cluster level.

## Verify the context to make sure we are on the host cluster:

`kubectx`{{exec}}

The output should show kubernetes-admin@kubernetes in green.

## Install Cert-Manager v1.14 on the host:

`kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.14.0/cert-manager.crds.yaml`{{exec}}

Inspect the CRD:

`kubectl get crd certificates.cert-manager.io -o yaml | grep "app.kubernetes.io/version:"`{{exec}}

List all cert-manager CRDs:

`kubectl get crds | grep cert-manager`{{exec}}

## Result:

The host cluster now runs Cert-Manager v1.14.0.

This is a common scenario in shared cluster environments where the platform team manages a specific version.
