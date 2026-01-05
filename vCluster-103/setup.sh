#!/usr/bin/env bash
set -euo pipefail

# Minimal setup: ensure vcluster and kubectl are available (Killercoda usually provides these)
command -v vcluster >/dev/null 2>&1 || echo "vcluster not found"
command -v kubectl >/dev/null 2>&1 || echo "kubectl not found"

echo "vCluster-103 setup complete"
