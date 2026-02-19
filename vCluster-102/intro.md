# vCluster 102 — Multi-Tenancy Isolation

In this scenario we are going to deploy two applications, using the same deployment YAML and naming. Since we are deploying each in its own vCluster, it doesn't matter if the naming overlaps. We are even going to deploy to the default namespace in each vCluster.

This short scenario shows how vCluster prevents name conflicts. Two tenants can deploy the same application and service names and run them independently because each vCluster has its own control plane and API.

What you'll do:

- Create two vClusters (`my-vcluster-a` in `team-x` and `my-vcluster-b` in `team-y`)
- Deploy the same `my-app` Deployment and Service in each vCluster
- Expose each service (Port-Forwarding)
- Verify both services work without interfering with each other
