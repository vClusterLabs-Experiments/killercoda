# Install a Different Cert-Manager Version in the vCluster

Inside the vCluster, we can install a **completely different version** of Cert-Manager without impacting the host cluster. This demonstrates how teams can test upgrades or run legacy versions independently.

### Connect and install Cert-Manager v1.13 in the vCluster:

`vcluster connect my-vcluster --namespace team-x`{{exec}}

`kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.13.0/cert-manager.crds.yaml`{{exec}}

`kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.13.0/cert-manager.yaml`{{exec}}

List the CRDs:

`kubectl get crds | grep cert-manager`{{exec}}

Now compare the host vs vCluster:

## Host version (v1.14.0):

`vcluster disconnect`{{exec}}

`kubectl get crd certificates.cert-manager.io -o jsonpath='{.spec.names.kind}' && echo`{{exec}}

## vCluster version (v1.13.0):

`vcluster connect my-vcluster --namespace team-x`{{exec}}

`kubectl get crd certificates.cert-manager.io -o jsonpath='{.spec.names.kind}' && echo`{{exec}}

The two versions differ — and that's the point.
vClusters allow **CRD version isolation**, making testing and migration safer.
