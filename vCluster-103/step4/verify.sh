#!/usr/bin/env bash
set -euo pipefail

echo "Check services and ports for both vClusters"

vcluster connect my-vcluster-a --namespace team-x --command "kubectl get svc web -o wide"
vcluster connect my-vcluster-b --namespace team-x --command "kubectl get svc web -o wide"

echo "OK"
