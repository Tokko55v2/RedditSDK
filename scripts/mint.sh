#!bin/bash

if [ ! -d ".mint/Mint" ]; then
  git clone https://github.com/yonaskolb/Mint.git .mint/Mint
fi

swift run --package-path .mint/Mint mint install yonaskolb/mint

swift run --package-path .mint/Mint mint bootstrap
