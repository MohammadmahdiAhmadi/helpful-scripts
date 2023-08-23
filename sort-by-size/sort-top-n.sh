#!/usr/bin/bash

num="${2:-10}"

sudo du -aBm $1 | sort -nr | head -n $num
