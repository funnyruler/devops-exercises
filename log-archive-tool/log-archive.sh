#!/bin/bash

LOG_DIR=$1
OUTPUT_DIR=$2

if [ -d "$OUTPUT_DIR" ] && [ "$OUTPUT_DIR" != "" ]; then
  FINAL_TAR=$OUTPUT_DIR/logs_archive_$(date +%Y%m%d_%H%M%S).tar.gz
else
  FINAL_TAR=logs_archive_$(date +%Y%m%d_%H%M%S).tar.gz
fi

for file in "$LOG_DIR"/*; do
  tar -rf "$FINAL_TAR" "$file"
done
