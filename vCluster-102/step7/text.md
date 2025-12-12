# Install OPA (Gatekeeper) inside the vCluster

Inside the vCluster, tenants can run a different policy engine — for example, OPA Gatekeeper — to manage policies using its own CRDs. This shows that host and vCluster can run different tools with similar responsibilities.

## Install Gatekeeper (OPA) in the vCluster:

`vcluster connect my-vcluster --namespace team-x`{{exec}}

`kubectl apply -f https://raw.githubusercontent.com/open-policy-agent/gatekeeper/master/deploy/gatekeeper.yaml`{{exec}}

List Gatekeeper/OPA CRDs in the vCluster:

`kubectl get crds | grep -i "gatekeeper"`{{exec}}

This shows:
- Host cluster runs Kyverno
- vCluster runs OPA Gatekeeper
- No conflicts between their CRDs

This demonstrates full tenant autonomy for policy enforcement tools.
