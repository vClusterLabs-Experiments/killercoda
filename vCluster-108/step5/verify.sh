#!/bin/bash
vcluster list 2>/dev/null | grep -qv "dev-cluster" && echo "done"
