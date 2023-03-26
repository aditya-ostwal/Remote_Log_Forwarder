#!/bin/bash

# Set the log file location
LOG_FILE=/var/log/messages

# Set the remote IP address and port number to forward logs
REMOTE_IP=192.168.1.100
REMOTE_PORT=514

# Tail the log file in real-time and forward the logs to the remote IP
tail -f $LOG_FILE | while read log; do
  echo "$log" | nc -u -w0 $REMOTE_IP $REMOTE_PORT
done
