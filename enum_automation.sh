#!/bin/bash

# Check if a host is provided as an argument
if [ -z "$1" ]; then
  echo "Use as ./enum_automation <dns> <ip>"
  exit 1
fi


# Assign the argument to a variable
host=$1
ip=$2

echo -e "\033[1;32m"
echo "###############################################"
echo "          Welcome to enum_automation           "
echo "###############################################"
echo "     Automating enumeration and discovery...   "
echo "###############################################"
echo -e "\033[0m"


# Run the nmap scan against the provided host
echo "[+] Running nmap against all ports"
nmap -sC -sV -p- -O "$host" | tee nmap.all

# Run subdomain enumeration
echo "[+] Running top 5000 domains"
wfuzz --hc 404,301,400 -H "Host: FUZZ.$host" -w /usr/share/wordlists/amass/subdomains-top1mil-5000.txt $ip

# Run nmap UDP Scan
echo "[+] Runnning UDP Scan, this may take a while..."
sudo nmap -sU $host | tee nmap.udp 

# Running nmap UDP Scan on all ports
echo "[+] Running UDP Scan on all ports, this will take even longer"
sudo nmap -sU -p- $host | tee nmap.udp.all
