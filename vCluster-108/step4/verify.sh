#!/bin/bash
vcluster list 2>/dev/null | grep -q "dev-cluster" && echo "done"
