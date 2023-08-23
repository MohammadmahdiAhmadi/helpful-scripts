#!/bin/bash

RESOLV_FILE="/etc/resolv.conf"
NEW_NAMESERVERS=("178.22.122.100" "185.51.200.2") # Modify this array with your desired nameservers

# Function to comment out nameservers
comment_nameservers() {
    sudo sed -i '/^nameserver/ s/^/#/' "$RESOLV_FILE"
}

# Function to uncomment nameservers
uncomment_nameservers() {
    sudo sed -i '/^#nameserver/ s/^#//' "$RESOLV_FILE"
}

# Check if the script is being run with root privileges
if [ "$EUID" -ne 0 ]; then
    echo "Please run this script as root or using sudo."
    exit 1
fi

# Check if new nameservers exist in the file
if grep -qE "${NEW_NAMESERVERS[0]}|${NEW_NAMESERVERS[1]}" "$RESOLV_FILE"; then
    # Remove the lines containing new nameservers
    sudo sed -i "/${NEW_NAMESERVERS[0]}/d;/${NEW_NAMESERVERS[1]}/d" "$RESOLV_FILE"
    uncomment_nameservers
else
    comment_nameservers
    # Add new nameservers to the resolv.conf file
    for nameserver in "${NEW_NAMESERVERS[@]}"; do
        echo "nameserver $nameserver" | sudo tee -a "$RESOLV_FILE" >/dev/null
    done
fi

echo "Nameservers have been toggled."
