# vCluster 103 — Multi-Tenancy Isolation via Same Application Names

This short scenario shows why vCluster exists: two tenants can run the exact same application name and service name without colliding, because each vCluster provides an isolated control plane and API surface.

You will create two vClusters, deploy the same app and service names into both, expose them, and confirm they operate independently.

Prerequisites: `vcluster` CLI and `kubectl` available in the environment.
