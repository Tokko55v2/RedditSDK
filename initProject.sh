#!/bin/bash
sh scripts/mint.sh

dir=$(pwd)
export MINT_PATH="$dir/.mint/Mint"
echo $MINT_PATH

swift run --package-path $MINT_PATH mint run yonaskolb/xcodegen@2.32.0 generate -s ./project.yml
