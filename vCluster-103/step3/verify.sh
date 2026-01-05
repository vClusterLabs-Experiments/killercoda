#!/usr/bin/env bash
set -euo pipefail

echo "Verify 'web' deployment exists in both vClusters"

vcluster connect my-vcluster-a --namespace team-x --command "kubectl get deploy web"
vcluster connect my-vcluster-b --namespace team-x --command "kubectl get deploy web"

echo "OK"
