#!/bin/bash
vcluster snapshot get backup-demo "container:///data/snapshot.tar.gz" &> /dev/null && echo "done"
