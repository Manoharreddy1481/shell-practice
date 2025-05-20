#!/bin/bash

# Check if a filename is passed
if [ $# -ne 1 ]; then
    echo "Usage: $0 <filename>"
    exit 1
fi

# Check if the file exists
if [ ! -f "$1" ]; then
    echo "File '$1' not found!"
    exit 1
fi

# Use awk to transpose
awk '
{
    for (i = 1; i <= NF; i++) {
        # Store each field in a 2D array-like structure
        matrix[NR, i] = $i
        if (i > max_col) max_col = i   # Track max columns
    }
    if (NF > max_fields) max_fields = NF  # Track widest row
    max_row = NR  # Track total number of rows
}
END {
    for (i = 1; i <= max_col; i++) {
        for (j = 1; j <= max_row; j++) {
            # Print each value in column-major order
            printf "%s%s", matrix[j, i], (j == max_row ? ORS : OFS)
        }
    }
}
' OFS='\t' "$1"
