#!/bin/bash
kubectx | grep -q vcluster_my-vcluster &> /dev/null && echo "done"
