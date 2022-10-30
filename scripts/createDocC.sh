#!/bin/bash

mkdir ./DocC

xcodebuild docbuild \
-scheme RedditSDK \
-destination 'platform=OS X,arch=x86_64' \
-derivedDataPath DocC

pathToDoc=$(find DocC -type d -name '*.doccarchive')
echo $pathToDoc

mkdir ./.public

$(xcrun --find docc) process-archive \
transform-for-static-hosting $pathToDoc \
--output-path ./.public \
--hosting-base-path RedditSDK

rm -rf ./DocC


