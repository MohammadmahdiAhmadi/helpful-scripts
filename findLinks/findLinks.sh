#!/usr/bin/bash

# Color codes for output
RED="\033[0;31m"
GREEN="\033[0;32m"
NC="\033[0m"

# Check for command line arguments
if [ "$#" -lt 2 ]; then
    echo -e "${RED}Error: Please provide at least two arguments: directory name and page URL.${NC}"
    exit 1
fi

# Extract command line arguments
DIR_NAME="$1"
PAGE_URL="$2"
FILE_FORMAT="${3:-.rar}"  # Default to .rar if not provided as the third argument

# Check if the directory already exists
if [ -d "$DIR_NAME" ]; then
    echo -e "${RED}Error: Directory '$DIR_NAME' already exists.${NC}"
    exit 1
fi

# Create directory and navigate to it
mkdir "$DIR_NAME" && cd "$DIR_NAME"

# Download page source
wget -O page_source "$PAGE_URL"

# Process the page source to extract links
sed -e "s/http/\nhttp/g" -e "s/$FILE_FORMAT/$FILE_FORMAT\n/g" page_source | egrep -o "http.+($FILE_FORMAT)$" | sort -u > links.txt

# Clean up intermediate files
rm page_source

# Display links for review in Vim
echo -e "${GREEN}Here are the links. Please review them in Vim:${NC}"
sleep 1
vim links.txt

# Prompt user for download confirmation
read -p "Do you want to download all links now? (Y/n): " is_dl
if [ "$is_dl" != "n" ]; then
    # Create a 'downloads' directory if it doesn't exist
    mkdir -p downloads

    # Download all links
    echo "Downloading links..."
    while IFS= read -r link; do
        wget -P ./downloads/ "$link"
    done < links.txt

    echo -e "${GREEN}Downloads successfully completed.${NC}"
else
    echo -e "${GREEN}Your URLs have been saved in $(pwd)/links.txt.${NC}"
fi
