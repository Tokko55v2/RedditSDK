#!bin/bash
dir=$(pwd)
echo $dir
export MINT_PATH="$dir/.mint/Mint"

if [ ! -d "$MINT_PATH" ]; then
  git clone https://github.com/yonaskolb/Mint.git $MINT_PATH
  swift run --package-path $MINT_PATH mint install yonaskolb/mint
fi

if [[ ! -z "$CI" ]]; then
  echo "running on CI"
  export PATH="$PATH:/Users/runner/.mint/bin"
fi

swift run --package-path $MINT_PATH mint bootstrap
