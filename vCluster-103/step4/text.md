# Step 4 — Install a Different Cert-Manager Version in the vCluster

Inside the vCluster, we can install a **completely different version** of Cert-Manager without impacting the host cluster. This demonstrates how teams can test upgrades or run legacy versions independently.

### Connect and Install Cert-Manager v1.13 in the vCluster:

`vcluster connect my-vcluster --namespace team-x`{{exec}}

`kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.13.0/cert-manager.crds.yaml`{{exec}}

List the CRDs:

`kubectl get crds`{{exec}}

Now compare the vCluster vs Host:

## vCluster version (v1.13.0):

`kubectl get crd certificates.cert-manager.io -o yaml | grep "app.kubernetes.io/version:"`{{exec}}

## Host version (v1.14.0):

`vcluster disconnect`{{exec}}

`kubectl get crd certificates.cert-manager.io -o yaml | grep "app.kubernetes.io/version:"`{{exec}}

The two versions are different and that's the point. vCluster allows **CRD version isolation**, making testing and migration safer.
