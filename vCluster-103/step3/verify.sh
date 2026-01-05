#!/usr/bin/env bash
set -euo pipefail

echo "Verify 'my-app' deployment exists in both vClusters"

vcluster connect my-vcluster-a --namespace team-x --command "kubectl get deploy my-app"
vcluster connect my-vcluster-b --namespace team-x --command "kubectl get deploy my-app"

echo "OK"
