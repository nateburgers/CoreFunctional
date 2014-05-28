#!/usr/bin/env sh
curl --silent https://raw.githubusercontent.com/nateburgers/CoreFunctional/master/RFSCoreFunctional.h > "$1/RFSCoreFunctional.h"
curl --silent https://raw.githubusercontent.com/nateburgers/CoreFunctional/master/RFSCoreFunctional.m > "$1/RFSCoreFunctional.m"
echo "copied RFSCoreFunctional into $1"
