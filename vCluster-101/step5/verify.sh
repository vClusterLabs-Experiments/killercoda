#!/bin/bash
kubectl get pods -n team-x 2>/dev/null | grep -q nginx && echo "done"
