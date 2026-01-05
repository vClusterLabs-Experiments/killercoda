Congratulations — you saw how vClusters let tenants run identical application and service names independently.

You created two vClusters, deployed the same application and service name into each, exposed them, and verified independent access.

Cleanup: remove vClusters with `vcluster delete my-vcluster-a --namespace team-x` and `vcluster delete my-vcluster-b --namespace team-x`.
