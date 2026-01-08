#!/usr/bin/env bash
set -euo pipefail

echo "Verifying vClusters exist"
vcluster list | grep my-vcluster-a
vcluster list | grep my-vcluster-b

echo "OK"
