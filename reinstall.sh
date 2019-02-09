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
  wget https://github.com/textileio/textile-go/releases/download/"$RELEASE"/textile-go_"$RELEASE"_linux-amd64.tar.gz
  tar xvfz textile-go_"$RELEASE"_linux-amd64.tar.gz
  rm textile-go_"$RELEASE"_linux-amd64.tar.gz
  sudo ./install.sh

else

  # pull latest on branch, build local
  source ~/.bash_profile
  cd go/src/github.com/textileio/textile-go
  git stash
  git checkout master && git pull
  git checkout "$BRANCH" && git pull origin "$BRANCH"
  dep ensure && gx install
  go build -ldflags "-w $(govvv -flags -pkg github.com/textileio/textile-go/common)" -i -o textile textile.go
	mv textile dist/
  sudo mv dist/textile /usr/local/bin

fi

# restart service
sudo systemctl restart textile

# echo node info
sleep 5
echo $(textile version)
echo "peer:   " $(textile peer)
echo "address:" $(textile address)
