#!/bin/bash

LOG_PATH=$1
TOP_N=$2
if [ -z "$LOG_PATH" ]; then
  echo "Please provide a log file path"
  exit 1
fi

if [ -z "$TOP_N" ]; then
  TOP_N=5
fi

TOP_IP_ADDRESSES=$(awk '{print $1}' "$LOG_PATH" | sort | uniq -c | sort -nr | head -$TOP_N)
TOP_ENDPOINTS=$(awk '{print $7}' "$LOG_PATH" | sort | uniq -c | sort -nr | head -$TOP_N)
TOP_STATUS_CODES=$(awk '{print $7}' "$LOG_PATH" | sort | uniq -c | sort -nr | head -$TOP_N)
TOP_USER_AGENTS=$(awk '{print $12}' "$LOG_PATH" | sort | uniq -c | sort -nr | head -$TOP_N | tr -d '"')
echo "Top $TOP_N IP addresses with the most requests"
echo "$TOP_IP_ADDRESSES" | awk '{print $2, "Requests:"$1}' && echo ""
echo "Top $TOP_N most requested paths:"
echo "$TOP_ENDPOINTS" | awk '{print $2, "Requests:"$1}' && echo ""
echo "Top $TOP_N most requested status codes:"
echo "$TOP_STATUS_CODES" | awk '{print $2, "Requests:"$1}' && echo ""
echo "Top $TOP_N most requested user agents:"
echo "$TOP_USER_AGENTS" | awk '{print $2, "Requests:"$1}'