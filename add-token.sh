#!/usr/bin/env bash

set -e

while getopts k:t:p: option
do
case "${option}"
in
k) KEY=${OPTARG};;
t) TOKEN=${OPTARG};;
p) IP=${OPTARG};;
esac
done

[[ -z "$KEY" ]] && { echo "Please specify an SSH key, e.g., -k mykey.pem" ; exit 1; }
[[ -z "$TOKEN" ]] && { echo "Please specify a cafe access token, e.g., -t 2GE5YWVqE...rVsncZt" ; exit 1; }
[[ -z "$IP" ]] && { echo "Please specify a public host IP address, e.g., -p 18.144.12.134" ; exit 1; }

# run cmd
ssh -i "$KEY" ec2-user@"$IP" "/bin/bash -c 'textile tokens create --token=\$TOKEN'"
