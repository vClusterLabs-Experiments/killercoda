#!/bin/bash
curl -sSf http://localhost:18080 >/dev/null 2>&1 && curl -sSf http://localhost:28080 >/dev/null 2>&1 && echo "done"
