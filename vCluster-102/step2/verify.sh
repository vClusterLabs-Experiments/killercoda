#!/bin/bash
vcluster list | grep -q tenant-1 && echo "done"
