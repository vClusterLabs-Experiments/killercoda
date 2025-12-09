#!/bin/bash
vcluster connect tenant-1 -n tenant-1 > /dev/null 2>&1 && kubectl get crd > /dev/null 2>&1 && echo "done"
