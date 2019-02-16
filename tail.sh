#!/usr/bin/env bash

set -e

while getopts k:p: option
do
case "${option}"
in
k) KEY=${OPTARG};;
p) IP=${OPTARG};;
esac
done

[[ -z "$KEY" ]] && { echo "Please specify an SSH key, e.g., -k mykey.pem" ; exit 1; }
[[ -z "$IP" ]] && { echo "Please specify a public host IP address, e.g., -p 18.144.12.134" ; exit 1; }

# tail logs
echo "tail -f ~/.textile/repo/logs/textile.log" | ssh -i "$KEY" ec2-user@"$IP" /bin/bash
