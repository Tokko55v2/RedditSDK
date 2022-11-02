#!/bin/bash
sh scripts/mint.sh

echo $MINT_PATH
ls

#swift run --package-path $MINT_PATH mint run yonaskolb/xcodegen@2.32.0 generate -s ./project.yml
