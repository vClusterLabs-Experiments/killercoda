#!/bin/bash
vcluster list 2>/dev/null | grep -q backup-demo; [ $? -ne 0 ] && echo "done"
