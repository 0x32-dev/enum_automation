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
echo "Running sC, sV, -O, -p- $host...Outputting to file 'nmap.all'"
nmap -sC -sV -p- -O "$host" | tee nmap.all

# Check if nmap command succeeded
if [ $? -eq 0 ]; then
  echo "nmap scan completed successfully."
else
  echo "nmap scan failed."
fi
