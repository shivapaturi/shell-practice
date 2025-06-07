#!/bin/bash

TO_TEAM=$1
ALERT_TYPE=$2
IP_ADDRESS=$3
MSG=$4
TO_ADDRESS=$5
SUBJECT=$6

# Escape special characters in MSG for safe sed replacement
FINAL_MSG=$(printf '%s\n' "$MSG" | sed -e 's/[&/\]/\\&/g')

# Replace placeholders in the HTML template
FINAL_BODY=$(sed \
  -e "s|TO_TEAM|$TO_TEAM|g" \
  -e "s|ALERT_TYPE|$ALERT_TYPE|g" \
  -e "s|IP_ADDRESS|$IP_ADDRESS|g" \
  -e "s|MSG|$FINAL_MSG|g" \
  template.html)

# Send email using msmtp
{
  echo "To: $TO_ADDRESS"
  echo "Subject: $SUBJECT"
  echo "Content-Type: text/html"
  echo ""
  echo "$FINAL_BODY"
} | msmtp "$TO_ADDRESS"
