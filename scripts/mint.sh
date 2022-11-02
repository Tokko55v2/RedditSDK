#!bin/bash
dir=$(pwd)
export MINT_PATH="$dir/.mint/Mint"

if [[ ! -z "$CI" ]]; then
    echo "running on CI"
    export MINT_PATH="/Users/runner/.mint/bin"
fi

if [ ! -d ".mint/Mint" ]; then
  git clone https://github.com/yonaskolb/Mint.git .mint/Mint
  swift run --package-path $MINT_PATH mint install yonaskolb/mint
fi

swift run --package-path $MINT_PATH mint bootstrap
