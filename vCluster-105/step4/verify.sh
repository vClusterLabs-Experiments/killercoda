#!/bin/bash
vcluster connect backup-demo &> /dev/null && kubectl get deployment nginx &> /dev/null; result=$?; vcluster disconnect &> /dev/null; [ $result -ne 0 ] && echo "done"
