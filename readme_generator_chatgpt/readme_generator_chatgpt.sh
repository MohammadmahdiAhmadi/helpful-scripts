#!/bin/bash

# Usage: ./readme_generator_chatgpt.sh <depth> <output_file> -e <exclusions>
# <depth> is the maximum depth to traverse
# <output_file> is the file to store the output
# <exclusions> is a list of file types or directories to exclude (optional)

# Check for the minimum number of arguments
if [ "$#" -lt 2 ]; then
    echo "Usage: $0 <depth> <output_file> [-e <exclusions>...]"
    exit 1
fi

# Assign depth and output file
depth=$1
output_file=$2
shift 2

# Initialize exclusions
exclusions=()

# Parse optional -e flag and exclusions
while [[ "$1" == "-e" ]]; do
    shift
    while [[ "$1" != -* && "$1" != "" ]]; do
        exclusions+=("$1")
        shift
    done
done

# Function to check if a file or directory should be excluded
is_excluded() {
    local path=$1
    for exclusion in "${exclusions[@]}"; do
        if [[ "$path" == *"$exclusion"* ]]; then
            return 0  # Exclude this path
        fi
    done
    return 1  # Do not exclude this path
}

# Start writing to the output file
{
    # Write the initial message
    echo "Please write a suitable README file for me, in the code markdown section. These are my project codes."
    echo

    # Find and process files up to the specified depth
    find . -maxdepth "$depth" -type f | while read -r file; do
        if ! is_excluded "$file"; then
            # Print file name and relative path
            echo "===== $file ====="
            # Print file content
            cat "$file"
            # Add a newline for separation between files
            echo -e "\n"
        fi
    done

} > "$output_file"

echo "All files up to depth $depth have been written to $output_file, excluding specified types/directories."
