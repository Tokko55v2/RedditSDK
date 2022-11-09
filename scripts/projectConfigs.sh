#!/bin/bash

teamid=${teamid:-none}
clientId=${clientId:-none}
bundleid=${bundleid:-tokko55v2.redditSDK}
bundleidhost=${bundleidhost:-tokko55v2.redditSDKTests}
username=${username:-none}
password=${password:-none}

while [ $# -gt 0 ]; do
   if [[ $1 == *"--"* ]]; then
        param="${1/--/}"
        declare $param="$2"
   fi
  shift
done

export BUNDLE_ID=${bundleid}
export BUNDLE_ID_TESTHOST=${bundleidhost}
export SDK_NAME="RedditSDK"
export TEAM_ID=${teamid}
export CI_PIPELINE_ID="1"
export SDK_VERSION="0.1"
export NS_HUMAM_READABLE="RedditSDK"
export CLIENT_ID=${clientId}
export USERNAME=${username}
export PASSWORD=${password}
