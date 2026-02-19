#!/bin/bash
vcluster list 2>/dev/null | grep -q my-vcluster; [ $? -ne 0 ] && echo "done"
