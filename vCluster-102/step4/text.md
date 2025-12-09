# Install CRD in the Host Cluster

In this step, we simulate a real-world scenario where the platform team installs a MySQL Operator CRD at the cluster level.

## Install MySQL Operator (which creates the CRD):

`helm repo add bitnami https://charts.bitnami.com/bitnami`{{exec}}

`helm install mysql-operator bitnami/mysql-operator --namespace kube-system --create-namespace`{{exec}}

Inspect it:

`kubectl get crd mysql.example.com -o yaml`{{exec}}

Now attempt to install a different version:

`kubectl get crd mysqlclusters.mysql.presslabs.org -o yaml`{{exec}}

## Result:

The host cluster now uses the updated CRD, potentially breaking workloads that expect v1.

This is a common issue in shared cluster environments.
