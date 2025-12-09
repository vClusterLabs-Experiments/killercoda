# Install a Different CRD Version in the vCluster

Inside the vCluster, we can install a **completely different CRD version** without impacting the host cluster.

### Connect and install a different MySQL Operator version:

`vcluster connect my-vcluster --namespace team-x`{{exec}}

`helm repo add bitnami https://charts.bitnami.com/bitnami`{{exec}}

`helm install mysql-operator-vc bitnami/mysql-operator --namespace kube-system --create-namespace --version 0.4.0`{{exec}}

`kubectl get crd mysql.example.com -o yaml`{{exec}}

Now compare the host vs vCluster:

## Host version:

`vcluster disconnect`{{exec}}

`kubectl get crd mysqlclusters.mysql.presslabs.org -o yaml`{{exec}}

## vCluster version:

`vcluster connect my-vcluster --namespace team-x`{{exec}}

`kubectl get crd mysql.example.com -o yaml`{{exec}}

The two versions differ — and that's the point.
vClusters allow **CRD version isolation**, making testing and migration safer.
