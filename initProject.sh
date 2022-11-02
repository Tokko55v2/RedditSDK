#!/bin/bash
sh scripts/mint.sh

swift run --package-path $MINT_PATH mint run yonaskolb/xcodegen@2.32.0 generate -s ./project.yml
