#!/bin/bash

teamid=${teamid:-none}
bundleid=${bundleid:-none}
bundleidhost=${bundleidhost:-none}

while [ $# -gt 0 ]; do
   if [[ $1 == *"--"* ]]; then
        param="${1/--/}"
        declare $param="$2"
   fi
  shift
done

echo "teamid: ${teamid} - bundleid: ${bundleid} - bundleidhost: ${bundleidhost}"

export BUNDLE_ID=${bundleid}
export BUNDLE_ID_TESTHOST=${bundleidhost}
export SDK_NAME="RedditSDK"
export TEAM_ID=${teamid}
export CI_PIPELINE_ID="1"
export SDK_VERSION="0.1"
export NS_HUMAM_READABLE="RedditSDK"

sh scripts/mint.sh

dir=$(pwd)
export MINT_PATH="$dir/.mint/Mint"

swift run --package-path $MINT_PATH mint run yonaskolb/xcodegen@2.32.0 generate -s ./project.yml
