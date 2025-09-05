#!/bin/bash

for f in *.mp4; do
  duration=$(ffprobe -v quiet -show_entries format=duration -of csv=p=0 -sexagesimal "$f" | sed 's/\..*//')
  echo "$duration $f"
done
