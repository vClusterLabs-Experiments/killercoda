#!/usr/bin/env bash
set -euo pipefail

echo "Verify access to both services"

if curl -sSf http://localhost:18080 >/dev/null 2>&1; then
  echo "my-vcluster-a my-app reachable on :18080"
else
  echo "my-vcluster-a my-app not reachable on :18080"
fi

if curl -sSf http://localhost:28080 >/dev/null 2>&1; then
  echo "my-vcluster-b my-app reachable on :28080"
else
  echo "my-vcluster-b my-app not reachable on :28080"
fi

echo "Done"
