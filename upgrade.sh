#!/usr/bin/env bash

set -e

while getopts k:r:p: option
do
case "${option}"
in
k) KEY=${OPTARG};;
r) RELEASE=${OPTARG};;
p) IP=${OPTARG};;
esac
done

[[ -z "$KEY" ]] && { echo "Please specify an SSH key, e.g., -k mykey.pem" ; exit 1; }
[[ -z "$RELEASE" ]] && { echo "Please specify a release tag, e.g., -r v1.0.0" ; exit 1; }
[[ -z "$IP" ]] && { echo "Please specify a public host IP address, e.g., -p 18.144.12.134" ; exit 1; }

# upload installer
scp -i "$KEY" reinstall.sh ec2-user@"$IP":~/

# run installer
echo "./reinstall.sh -r $RELEASE" | ssh -i "$KEY" ec2-user@"$IP" /bin/bash
