# Install OPA (Gatekeeper) in the Host Cluster

The host cluster can run a policy controller such as OPA Gatekeeper. Gatekeeper adds a small set of CRDs (ConstraintTemplate, Constraint, etc.) that demonstrate how policy CRDs live at the cluster level.

## Install Gatekeeper (OPA) on the host:

`vcluster disconnect`{{exec}}

`kubectl apply -f https://raw.githubusercontent.com/open-policy-agent/gatekeeper/master/deploy/gatekeeper.yaml`{{exec}}

List the Gatekeeper/OPA CRDs:

`kubectl get crds | grep -E "Constraint|ConstraintTemplate|gatekeeper" || true`{{exec}}

The host now contains OPA Gatekeeper CRDs and the controller.

This illustrates how policy CRDs accumulate in platform clusters and why isolation matters.
