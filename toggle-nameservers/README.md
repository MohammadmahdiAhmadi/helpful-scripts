# Toggle Nameserver Script

The **Toggle Nameserver Script** allows you to switch your DNS (Domain Name System) servers to Shecan's nameservers, facilitating the bypassing of certain internet restrictions and enabling access to restricted websites within Iran.

## How it Works

This script modifies the `/etc/resolv.conf` file, which is responsible for DNS resolution on your system. It allows you to switch between using the default DNS servers and Shecan's DNS servers by commenting or uncommenting the appropriate lines in the configuration file.

## Prerequisites

- This script requires administrative privileges to modify system files. Make sure you run it as root or using `sudo`.

## Usage

1. Open a terminal.
2. Clone this repository using `git clone https://github.com/MohammadmahdiAhmadi/helpful-scripts.git`.
3. Navigate to the directory containing the script: `cd helpful-scripts/01-toggle-nameservers/`.
4. Make the script executable: `chmod +x toggle-nameserver.sh`.
5. Run the script with root privileges: `sudo ./toggle-nameserver.sh`.

The script will prompt you for your password, as it needs administrative access to modify the DNS configuration.

## Configuration

You can modify the behavior of the script by adjusting the `NEW_NAMESERVERS` array. The default array contains Shecan's DNS server addresses, which are commonly used to bypass internet restrictions in Iran. If you prefer different nameservers, replace the addresses in the array accordingly.

## Caution

- Be cautious when modifying system files. Incorrect changes to the `/etc/resolv.conf` file could lead to DNS resolution issues.
- This script is designed for use within Iran. Using this script outside Iran might not yield the intended results.

---

Happy bypassing!
