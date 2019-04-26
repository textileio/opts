#!/usr/bin/env bash

set -e

while getopts k:r:b:p: option
do
case "${option}"
in
k) KEY=${OPTARG};;
r) RELEASE=${OPTARG};;
b) BRANCH=${OPTARG};;
p) IP=${OPTARG};;
esac
done

[[ -z "$KEY" ]] && { echo "Please specify an SSH key, e.g., -k mykey.pem" ; exit 1; }
[[ -z "$RELEASE" && -z "$BRANCH" ]] && { echo "Please specify a release tag or a branch, e.g., -r v1.0.0 or -b master" ; exit 1; }
[[ -z "$IP" ]] && { echo "Please specify the host IP address, e.g., -p 18.144.12.134" ; exit 1; }

# upload installer
scp -i "$KEY" reinstall.sh ec2-user@"$IP":~/

# run installer
if [ ! -z "$RELEASE" ]; then
  echo "./reinstall.sh -r $RELEASE" | ssh -i "$KEY" ec2-user@"$IP" /bin/bash
else
  echo "./reinstall.sh -b $BRANCH" | ssh -i "$KEY" ec2-user@"$IP" /bin/bash
fi
