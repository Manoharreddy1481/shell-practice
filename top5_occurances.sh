#!/bin/bash

# Check if a filename is passed as an argument
if [ $# -ne 1 ]; then
    echo "Usage: $0 <filename>"
    exit 1
fi

# Check if the file exists
if [ ! -f "$1" ]; then
    echo "File '$1' not found!"
    exit 1
fi

# Process the file to count words and display top 5
tr -s '[:space:][:punct:]' '\n' < "$1" | \
tr 'A-Z' 'a-z' | \
grep -v '^$' | \
sort | uniq -c | sort -nr | head -n 5
