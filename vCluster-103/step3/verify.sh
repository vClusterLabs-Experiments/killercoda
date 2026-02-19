#!/bin/bash
kubectl get crd certificates.cert-manager.io > /dev/null 2>&1 && echo "done"
