#!/bin/bash
vcluster list 2>/dev/null | grep -q config-demo; [ $? -ne 0 ] && echo "done"
