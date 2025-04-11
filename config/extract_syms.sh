#!/bin/bash

# Usage: ./extract_symbols.sh input_binary output_file

# Check args
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <input_binary> <output_file>"
    exit 1
fi

INPUT="$1"
OUTPUT="$2"

# Extract symbol names using objdump, filter with awk
aarch64-linux-gnu-readelf --wide -s $1 \
    | awk '/: / { print $8 }' \
    | grep -v '^$' \
    | sort -u > $2

