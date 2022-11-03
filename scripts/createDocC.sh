#!/bin/bash
removeDoC="${1:-true}"

dir=$(pwd)
mkdir "$dir/DocC"

xcodebuild docbuild \
-scheme RedditSDK \
-destination 'platform=OS X,arch=x86_64' \
-derivedDataPath "$dir/DocC"

pathToDoc=$(find "$dir/DocC" -type d -name '*.doccarchive')
echo $pathToDoc

mkdir "$dir/.public"

$(xcrun --find docc) process-archive \
transform-for-static-hosting $pathToDoc \
--output-path "$dir/.public" \
--hosting-base-path RedditSDK

if $removeDoC ; then
    rm -rf "$dir/DocC"
fi


