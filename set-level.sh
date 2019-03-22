#!/usr/bin/env bash

set -e

while getopts k:l:p: option
do
case "${option}"
in
k) KEY=${OPTARG};;
l) LEVEL=${OPTARG};;
p) IP=${OPTARG};;
esac
done

[[ -z "$KEY" ]] && { echo "Please specify an SSH key, e.g., -k mykey.pem" ; exit 1; }
[[ -z "$LEVEL" ]] && { echo "Please specify one of: debug, info, warning, error, critical, e.g., -l debug" ; exit 1; }
[[ -z "$IP" ]] && { echo "Please specify a public host IP address, e.g., -p 18.144.12.134" ; exit 1; }

# run cmd
ssh -i "$KEY" ec2-user@"$IP" "textile logs -t --level=$LEVEL"
