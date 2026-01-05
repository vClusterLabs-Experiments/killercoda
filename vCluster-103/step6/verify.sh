#!/usr/bin/env bash
set -euo pipefail

echo "Verify vClusters deleted"

if vcluster list | grep my-vcluster-a; then
  echo "my-vcluster-a still present"
else
  echo "my-vcluster-a removed"
fi

if vcluster list | grep my-vcluster-b; then
  echo "my-vcluster-b still present"
else
  echo "my-vcluster-b removed"
fi

echo "Done"
