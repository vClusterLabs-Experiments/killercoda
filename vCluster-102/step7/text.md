# Install Kyverno inside the vCluster

Inside the vCluster, tenants can run a different policy engine — for example, Kyverno — to manage policies using its own CRDs (`ClusterPolicy`, `Policy`, etc.). This shows that host and vCluster can run different tools with similar responsibilities.

## Install Kyverno in the vCluster:

`vcluster connect my-vcluster --namespace team-x`{{exec}}

`kubectl apply -f https://raw.githubusercontent.com/kyverno/kyverno/main/config/release/install.yaml`{{exec}}

List Kyverno CRDs in the vCluster:

`kubectl get crds | grep kyverno.io || true`{{exec}}

This shows:
- Host cluster runs OPA Gatekeeper
- vCluster runs Kyverno
- No conflicts between their CRDs

This demonstrates full tenant autonomy for policy enforcement tools.
