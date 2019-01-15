#!/usr/bin/env bash

set -e

while getopts k:r:u:p: option
do
case "${option}"
in
k) KEY=${OPTARG};;
r) RELEASE=${OPTARG};;
u) URL=${OPTARG};;
p) IP=${OPTARG};;
esac
done

[[ -z "$KEY" ]] && { echo "Please specify an SSH key, e.g., -k mykey.pem" ; exit 1; }
[[ -z "$RELEASE" ]] && { echo "Please specify a release tag, e.g., -r v1.0.0" ; exit 1; }
[[ -z "$URL" ]] && { echo "Please specify a public host URL, e.g., -u https://mycafe.com" ; exit 1; }
[[ -z "$IP" ]] && { echo "Please specify a public host IP address, e.g., -p 18.144.12.134" ; exit 1; }

# upload installer
scp -i "$KEY" install.sh ec2-user@"$IP":~/

# run installer
echo "./install.sh -r $RELEASE -u $URL -p $IP" | ssh -i "$KEY" ec2-user@"$IP" /bin/bash