#!/bin/bash
vcluster connect my-vcluster --namespace team-x > /dev/null 2>&1 && kubectl get crd certificates.cert-manager.io > /dev/null 2>&1 && vcluster disconnect > /dev/null 2>&1 && echo "done"
