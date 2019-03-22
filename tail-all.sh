#!/usr/bin/env bash

( ./tail.sh -k keys/cafe-us-west-1.pem -p 18.144.12.135 & ./tail.sh -k keys/cafe-us-west-1.pem -p 13.57.23.210 & ./tail.sh -k keys/cafe-us-east-2.pem -p 18.221.167.133 & ./tail.sh -k keys/cafe-us-east-2.pem -p 18.224.173.65 & ./tail.sh -k keys/cafe-eu-west-3.pem -p 35.180.16.103 & ./tail.sh -k keys/cafe-eu-west-3.pem -p 35.180.35.45 & ./tail.sh -k keys/cafe-ap-southeast-1.pem -p 13.250.53.27 & ./tail.sh -k keys/cafe-ap-southeast-1.pem -p 3.1.49.130 ; ) | cat | grep -Ev '(health)'
