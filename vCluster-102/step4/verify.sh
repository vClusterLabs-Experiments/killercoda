#!/bin/bash
kubectl get crd 2>/dev/null | grep -q mysql || echo "done"
