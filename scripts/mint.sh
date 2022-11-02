#!bin/bash
dir=$(pwd)
echo $dir

export MINT_PATH="$dir/.mint/Mint"

if [ ! -d ".mint/Mint" ]; then
  git clone https://github.com/yonaskolb/Mint.git .mint/Mint
  swift run --package-path $MINT_PATH mint install yonaskolb/mint
fi

if [[ ! -z "$CI" ]]; then
    echo "running on CI"
    export PATH="$PATH:/Users/runner/.mint/bin"
    export MINT_PATH="/Users/runner/.mint/Mint"
fi

swift run --package-path $MINT_PATH mint bootstrap
