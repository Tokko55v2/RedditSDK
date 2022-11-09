#!/bin/bash

teamid=${teamid:-none}

username=${username:-none}
password=${password:-none}
clientId=${clientId:-none}

while [ $# -gt 0 ]; do
   if [[ $1 == *"--"* ]]; then
        param="${1/--/}"
        declare $param="$2"
   fi
  shift
done

source ./scripts/projectConfigs.sh --teamid ${teamid} --username ${username} --password ${password} --clientId ${clientId}

echo "teamid: ${teamid} - bundleid: ${bundleid} - bundleidhost: ${bundleidhost} - clientId: ${clientId} - username: ${username}"

sh scripts/mint.sh

dir=$(pwd)
export MINT_PATH="$dir/.mint/Mint"

swift run --package-path $MINT_PATH mint run yonaskolb/xcodegen@2.32.0 generate -s ./project.yml
