#!/usr/bin/env bash

set -e

while getopts r:u:p: option
do
case "${option}"
in
r) RELEASE=${OPTARG};;
u) URL=${OPTARG};;
p) IP=${OPTARG};;
esac
done

[[ -z "$RELEASE" ]] && { echo "Please specify a release tag, e.g., -r v1.0.0" ; exit 1; }
[[ -z "$URL" ]] && { echo "Please specify a public host URL, e.g., -u https://mycafe.com" ; exit 1; }
[[ -z "$IP" ]] && { echo "Please specify a public host IP address, e.g., -p 18.144.12.134" ; exit 1; }

# install
wget https://github.com/textileio/textile-go/releases/download/"$RELEASE"/textile-go_"$RELEASE"_linux-amd64.tar.gz
tar xvfz textile-go_"$RELEASE"_linux-amd64.tar.gz
rm textile-go_"$RELEASE"_linux-amd64.tar.gz
sudo ./install.sh

# init
textile init -s $(textile wallet init | tail -n1) --server --cafe-open --cafe-url="$URL" --cafe-public-ip="$IP" --cafe-bind-addr=0.0.0.0:40601 --gateway-bind-addr=0.0.0.0:5050 --swarm-ports=4001

# textile systemctl service
sudo bash -c 'cat >/lib/systemd/system/textile.service <<EOL
[Unit]
Description=textile
[Service]
ExecStart=/usr/local/bin/textile daemon
Restart=always
User=ec2-user
Group=ec2-user
[Install]
WantedBy=multi-user.target
EOL'

# enable the new services
sudo systemctl daemon-reload
sudo systemctl enable textile.service
sudo systemctl start textile

# echo new node info
sleep 5
echo "version:" $(textile version)
echo "peer   :" $(textile peer)
echo "address:" $(textile address)
