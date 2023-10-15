#!/bin/bash

# Define the function to process each file
process_file() {
    local file="$1"
    echo "Processing $file."
    ../tools/HardwareSimulator.sh $file
    # Your function logic here
}

# Iterate over all .tst files in the current directory and call the function
for file in $1/*.tst; do
    # If no .tst files exist, then *.tst is passed as an argument, so we need to avoid that
    if [[ -f "$file" ]]; then
        process_file "$file"
    fi
done
