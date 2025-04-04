#!/bin/bash

# Check if a host is provided as an argument
if [ -z "$1" ]; then
  echo "Use as ./enum_automation <dns> <ip>"
  exit 1
fi


# Assign the argument to a variable
host=$1
ip=$2

# Run the nmap scan against the provided host
echo "Running sC, sV, -O, -p- $host...Outputting to file 'nmap.all'"
nmap -sC -sV -p- -O "$host" | tee nmap.all


