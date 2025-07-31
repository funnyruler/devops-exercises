#!/bin/bash

LOG_DIR=$1
OUTPUT_DIR=$2
if [ -d $OUTPUT_DIR && $OUTPUT_DIR != ""]; then
  FINAL_TAR=$OUTPUT_DIR/logs_archive_$(date +%Y%m%d_%H%M%S).tar.gz
else
  FINAL_TAR=logs_archive_$(date +%Y%m%d_%H%M%S).tar.gz
fi

tar -cf $FINAL_TAR

for file in $(ls $LOG_DIR); do
  tar -rf $FINAL_TAR $LOG_DIR/$file
done
