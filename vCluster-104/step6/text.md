# Step 6 — Cleanup

Let's clean up the vCluster and configuration files.

`vcluster delete config-demo`{{exec}}

Verify the cleanup:

`vcluster list`{{exec}}

`kubectl get all -n config-ns`{{exec}}

## Summary

In this scenario you learned how to:

- Create a `vcluster.yaml` configuration file
- Apply custom configurations with `--values`
- Set resource limits on the control plane
- Configure resource sync behavior
- Understand distro and backing store options
- Monitor vCluster resource consumption and logs

These configuration options are essential for production deployments where you need control over resource usage, sync behavior, and data persistence.
