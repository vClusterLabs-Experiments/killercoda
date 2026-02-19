#!/bin/bash
vcluster list | grep -q my-vcluster-a && vcluster list | grep -q my-vcluster-b && echo "done"
