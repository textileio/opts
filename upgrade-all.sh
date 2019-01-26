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

######### US West 1

# us-west-1a (12D3KooWGBW3LfzypK3zgV4QxdPyUm3aEuwBDMKRRpCPm9FrJvar)
./upgrade.sh -k keys/cafe-us-west-1.pem -r "$RELEASE" -p 18.144.12.135

# us-west-1c (12D3KooWQue2dSRqnZTVvikoxorZQ5Qyyug3hV65rYnWYpYsNMRE)
./upgrade.sh -k keys/cafe-us-west-1.pem -r "$RELEASE" -p 13.57.23.210

######### US East 2

# us-east-2a (12D3KooWERmHT6g4YkrPBTmhfDLjfi8b662vFCfvBXqzcdkPGQn1)
./upgrade.sh -k keys/cafe-us-east-2.pem -r "$RELEASE" -p 18.221.167.133

# us-east-2b.textile.io (12D3KooWLh9Gd4C3knv4XqCyCuaNddfEoSLXgekVJzRyC5vsjv5d)
./upgrade.sh -k keys/cafe-us-east-2.pem -r "$RELEASE" -p 18.224.173.65

######### EU West 3

# eu-west-3a (12D3KooWDhSfXZCBVAK6SNQu7h6mfGCBJtjMS44PW5YA5YCjVmjB)
./upgrade.sh -k keys/cafe-eu-west-3.pem -r "$RELEASE" -p 35.180.16.103

# eu-west-3b (12D3KooWBCZEDkZ2VxdNYKLLUACWbXMvW9SpVbbvoFR9CtH4qJv9)
./upgrade.sh -k keys/cafe-eu-west-3.pem -r "$RELEASE" -p 35.180.35.45

######### AP Southeast 1

# ap-southeast-1a (12D3KooWQ5MR9Ugz9HkVU3fYFbiWbQR4jxKJB66JoSY7nP5ShsqQ)
./upgrade.sh -k keys/cafe-ap-southeast-1.pem -r "$RELEASE" -p 13.250.53.27

# ap-southeast-1b (12D3KooWDWJ473M3fXMEcajbaGtqgr6i6SvDdh5Ru9i5ZzoJ9Qy8)
./upgrade.sh -k keys/cafe-ap-southeast-1.pem -r "$RELEASE" -p 3.1.49.130
