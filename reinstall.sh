#!/usr/bin/env bash

set -e

while getopts r:b: option
do
case "${option}"
in
r) RELEASE=${OPTARG};;
b) BRANCH=${OPTARG};;
esac
done

[[ -z "$RELEASE" && -z "$BRANCH" ]] && { echo "Please specify a release tag or a branch, e.g., -r v1.0.0 or -b master" ; exit 1; }

if [ ! -z "$RELEASE" ]; then

  # install from GH release
  wget https://github.com/textileio/go-textile/releases/download/"$RELEASE"/go-textile_"$RELEASE"_linux-amd64.tar.gz
  tar xvfz go-textile_"$RELEASE"_linux-amd64.tar.gz
  rm go-textile_"$RELEASE"_linux-amd64.tar.gz
  sudo ./install.sh

else

  # pull latest on branch, build local
  source ~/.bash_profile
  cd go/src/github.com/textileio/go-textile
  git stash
  git checkout master && git pull
  git checkout "$BRANCH" && git pull origin "$BRANCH"
  dep ensure && gx install
  go build -ldflags "-w $(govvv -flags -pkg github.com/textileio/go-textile/common)" -i -o textile textile.go
	mv textile dist/
  sudo mv dist/textile /usr/local/bin

fi

# restart service
sudo systemctl restart textile

# echo node info
sleep 5
echo $(textile version --git)
echo "peerID:" $(textile ipfs id)
echo "address:" $(textile account address)
