#!/bin/bash

for f in $@
do ffprobe -v quiet -of csv=p=0 -show_entries format=duration "$f"
done | awk '{sum += $f}; END{print sum}'
