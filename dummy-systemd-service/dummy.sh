#!/bin/bash
COUNTER=0
while true; do
  MESSAGE="Dummy service is running... $COUNTER"
  echo "$MESSAGE" | tee -a /var/log/dummy-service.log
  COUNTER=$((COUNTER + 1))
  sleep 10
done