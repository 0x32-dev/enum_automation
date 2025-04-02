#!/bin/bash

# Check if a host is provided as an argument
if [ -z "$1" ]; then
  echo "Usage: $0 <host>"
  echo "Example: $0 192.168.1.1"
  exit 1
fi

# Assign the argument to a variable
host=$1

# Run the nmap scan against the provided host
echo "Running nmap scan against $host..."
nmap "$host"

# Check if nmap command succeeded
if [ $? -eq 0 ]; then
  echo "nmap scan completed successfully."
else
  echo "nmap scan failed."
fi
