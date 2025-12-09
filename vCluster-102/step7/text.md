# Install an Alternative Component Inside the vCluster

Inside the vCluster, tenants can install operators or components that conflict with host components—without affecting the cluster.

### Example: Install a Postgres Operator inside the vCluster:

`vcluster connect my-vcluster --namespace team-x`{{exec}}

`helm repo add cnpg https://cloudnative-pg.github.io/charts`{{exec}}

`helm install postgres-operator-vc cnpg/cloudnative-pg --namespace kube-system --create-namespace`{{exec}}

`kubectl get crds | grep postgres`{{exec}}

This shows:
- Host cluster uses MySQL
- vCluster uses Postgres
- No conflicts

This demonstrates full tenant autonomy.
