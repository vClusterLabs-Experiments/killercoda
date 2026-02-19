#!/bin/bash
kubectl get crds 2>/dev/null | grep -q kyverno && echo "done"
