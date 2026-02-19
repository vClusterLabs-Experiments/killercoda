#!/bin/bash
kubectl get pods -n config-ns 2>/dev/null | grep -q sync-test && echo "done"
