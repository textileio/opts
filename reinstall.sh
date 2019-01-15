#!/usr/bin/env bash

set -e

while getopts r: option
do
case "${option}"
in
r) RELEASE=${OPTARG};;
esac
done

[[ -z "$RELEASE" ]] && { echo "Please specify a release tag, e.g., -r v1.0.0" ; exit 1; }

# install
wget https://github.com/textileio/textile-go/releases/download/"$RELEASE"/textile-go_"$RELEASE"_linux-amd64.tar.gz
tar xvfz textile-go_"$RELEASE"_linux-amd64.tar.gz
rm textile-go_"$RELEASE"_linux-amd64.tar.gz
sudo ./install.sh

sudo systemctl restart textile

# echo new node info
sleep 5
echo "version:" $(textile version)
echo "peer:   " $(textile peer)
echo "address:" $(textile address)
