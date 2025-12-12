# Install OPA (Gatekeeper) inside the vCluster

Inside the vCluster, tenants can run a different policy engine to manage policies using its own CRDs. This shows that host and vCluster can run different tools with similar responsibilities.

## Install Gatekeeper (OPA) in the vCluster:

`vcluster connect my-vcluster --namespace team-x`{{exec}}

`kubectl apply -f https://raw.githubusercontent.com/open-policy-agent/gatekeeper/master/deploy/gatekeeper.yaml`{{exec}}

List Gatekeeper/OPA CRDs in the vCluster:

`kubectl get crds | grep -i "gatekeeper"`{{exec}}

Also list all CRDs to see that Kyverno is not installed in the vCluster.

`kubectl get crds`{{exec}}

This shows:
- Host cluster runs Kyverno
- vCluster runs OPA Gatekeeper