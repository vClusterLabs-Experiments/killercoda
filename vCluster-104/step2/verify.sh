#!/bin/bash
kubectl get statefulset -n config-ns -o jsonpath='{.items[0].spec.template.spec.containers[0].resources}' 2>/dev/null | grep -q limits && echo "done"
