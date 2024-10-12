#!/bin/bash

# Display installation message
echo -e "\e[32mStarting the installation process...\e[0m"

# Download and move the script to /usr/local/bin
echo -e "\e[33mDownloading and installing the backup script...\e[0m"
curl -s -o /usr/local/bin/skt_backup_v1 https://raw.githubusercontent.com/raffasyaa/semvak/main/backup_marzban_v1.0.sh

# Check if the download was successful
if [ $? -eq 0 ]; then
    echo -e "\e[32mScript downloaded successfully.\e[0m"
else
    echo -e "\e[31mFailed to download the script! Exiting...\e[0m"
    exit 1
fi

# Grant executable permission to the script
chmod +x /usr/local/bin/skt_backup_v1
# Display successful installation message
echo -e "\e[32mInstallation complete. You can now use the command 'skt_backup_v1' to run the script.\e[0m"

# Run the script
echo -e "\e[33mRunning the script now...\e[0m"
exec /usr/local/bin/skt_backup_v1