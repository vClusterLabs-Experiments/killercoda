#!/bin/bash
vcluster list 2>/dev/null | grep -q "dev-cluster" && kubectl get deployment nginx &>/dev/null && echo "done"
