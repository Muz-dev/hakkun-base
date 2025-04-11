#!/bin/bash

# Usage: ./extract_symbols.sh input_binary output_file

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <input_binary> <output_file>"
    exit 1
fi

# Check if the input binary file exists
if [ ! -f "$1" ]; then
    echo "No such file $1"
    exit 1
fi

INPUT="$1"
OUTPUT="$2"

# Ensure the output file exists (create it if not)
touch "$OUTPUT"

# Extract symbol names using readelf and check for duplicates before appending
aarch64-linux-gnu-readelf -s --wide "$INPUT" |
    grep '^[[:space:]]*[0-9]\+:' |
    awk '{ print $8 }' |   # Extract only the symbol name
    sort |                # Sort symbols
    uniq |                # Remove duplicates
    while read symbol; do
        # Check if the symbol already exists in the output file
        if ! grep -Fxq "$symbol" "$OUTPUT"; then
            # If the symbol is not found, append it to the file
            echo "$symbol" >> "$OUTPUT"
        fi
    done

echo "Extracted unique symbols into $OUTPUT"
