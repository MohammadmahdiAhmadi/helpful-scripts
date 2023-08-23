# Link Finder Script

This script is designed to download specific file format links from a given web page. It extracts links from the page source, allowing you to download files of a specific format. The script is written in bash.

## Prerequisites

Make sure you have the following tools installed before using the script:

- `wget`
- `sed`
- `egrep`
- `vim`

## Usage

1. Open a terminal.
2. Clone this repository using `git clone https://github.com/MohammadmahdiAhmadi/helpful-scripts.git`.
3. Navigate to the directory containing the script: `cd helpful-scripts/findLinks/`.
5. Make the script executable: `chmod +x findLinks.sh`.
6. Run the script with the following arguments: `./findLinks.sh <directory_name> <page_url> [file_format]`
- `<directory_name>`: The name of the directory where downloaded files and intermediate data will be stored.
- `<page_url>`: The URL of the web page containing the links to download.
- `[file_format]`: (Optional) The file format you're interested in (e.g., `.rar`, `.zip`). Defaults to `.rar` if not provided.

## Example

To download all `.rar` files from a webpage and store them in a directory named `my_downloads`, use the following command: `./findLinks.sh my_downloads https://example.com/files.html .rar`

## Workflow

1. The script checks if the correct number of command line arguments is provided.
2. It creates a new directory and navigates into it.
3. The page source is downloaded using `wget` and saved as `page_source`.
4. The script processes the page source using `sed` and `egrep` to extract links matching the provided file format. The links are stored in `links.txt`.
5. Intermediate files are cleaned up.
6. The extracted links are displayed for review in `vim`.
7. The user is prompted for download confirmation.
8. If confirmed, a 'downloads' directory is created (if not exists) and the links are downloaded using `wget`.
9. A success message is displayed once the downloads are completed.

## Important Notes

- If you decide not to proceed with the downloads, the extracted links will be saved in `links.txt` in the script's directory.
- The script assumes that the provided URL contains the links you want to download.
- The script is provided as-is and may require adjustments based on your specific needs.
