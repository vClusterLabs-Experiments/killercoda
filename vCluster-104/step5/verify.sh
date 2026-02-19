#!/bin/bash
kubectl get pods -n config-ns > /dev/null 2>&1 && echo "done"
