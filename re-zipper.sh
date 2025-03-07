#!/bin/bash

set -e

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <URL> <Output_Name>"
    exit 1
fi

URL="$1"
OUTPUT_NAME="$2"

wget "$URL" -O downloaded_file.tar
mkdir "$OUTPUT_NAME"
tar -xf downloaded_file.tar -C $OUTPUT_NAME
zip -r "$OUTPUT_NAME.zip" "$OUTPUT_NAME/"
rm -rf downloaded_file.tar $OUTPUT_NAME/
echo "Archive successfully created: $OUTPUT_NAME.zip"
