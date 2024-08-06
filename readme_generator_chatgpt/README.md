# Readme Generator ChatGPT Script

The **readme_generator_chatgpt.sh** script is a Bash utility designed to assist in generating README files by listing and displaying the content of files within a specified directory structure. It supports exclusions for certain file types or directories, allowing for more focused content extraction.

## Usage

1. **Make the Script Executable**:
   ```bash
   chmod +x readme_generator_chatgpt.sh
    ```
2. **Run the Script**
    ```bash
    ./readme_generator_chatgpt.sh <depth> <output_file> [-e <exclusions>...]
    ```

## Arguments
- <depth>: Specifies the maximum depth of directories to traverse. This helps limit how deep the script will go when searching for files.

- <output_file>: The file where the output will be saved. This includes the filenames and content of the files found within the specified depth.

- [-e <exclusions>...]: (Optional) A list of file types or directories to exclude. For instance, to exclude all .log files and node_modules directory, use -e .log node_modules.

## Example
To run the script and generate an output file README_output.md, traversing up to a depth of 3 and excluding .log files and the node_modules directory:
```bash
./readme_generator_chatgpt.sh 3 output.txt -e .log node_modules
```

## Functionalitys
- Exclusions: The script can exclude files and directories based on the specified patterns. The is_excluded function checks if a file or directory matches any of the exclusion criteria.

- File Content Display: The script not only lists the filenames but also displays the content of each file, which can be helpful for reviewing or creating documentation.
