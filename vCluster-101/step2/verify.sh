#!/bin/bash
vcluster list | grep -i my-vcluster &> /dev/null && echo "done"
