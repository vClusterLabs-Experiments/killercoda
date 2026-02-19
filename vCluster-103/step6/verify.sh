#!/bin/bash
vcluster connect my-vcluster --namespace team-x > /dev/null 2>&1 && kubectl get crds 2>/dev/null | grep -q gatekeeper && vcluster disconnect > /dev/null 2>&1 && echo "done"
