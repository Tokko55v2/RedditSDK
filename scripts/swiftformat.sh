export PATH="$PATH:/opt/homebrew/bin/swiftformat"

if which swiftformat > /dev/null; then
    swiftformat Sources/
else
    echo "error: SwiftFormat not installed, download from https://github.com/nicklockwood/SwiftFormat"
    exit 1
fi
