#!/bin/bash

# Define the path to the resolv.conf file
resolv_conf="/etc/resolv.conf"

# Display the current nameserver entry
current_dns_server=$(grep '^nameserver' "$resolv_conf" | awk '{print $2}')
echo "Current DNS server: $current_dns_server"

# Prompt the user for DNS server input or use default
read -p "Enter new DNS server IP (default is 1.1.1.1): " dns_server
dns_server=${dns_server:-1.1.1.1}

# Backup the original resolv.conf file
cp "$resolv_conf" "$resolv_conf.bak"

# Replace nameserver entries with the user-provided or default DNS server
sed -i "s/nameserver.*/nameserver $dns_server/" "$resolv_conf"

# Display the updated resolv.conf
echo "Updated /etc/resolv.conf:"
cat "$resolv_conf"