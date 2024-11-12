#!/bin/bash

# Switch to root if not already (avoiding full root shell for safety)
if [ "$EUID" -ne 0 ]; then
    echo "Please run as root"
    exit
fi

# Start SSH service
sudo service ssh start
echo "SSH service started."

# Prompt for Termux username and IP address
echo "Enter your Termux username: "
read uid
echo "Enter the IP of your phone: "
read ipadr

# Prompt user to start sshd in Termux
echo "Please type 'sshd' in your Termux session to enable SSH."
read -p "Press Enter to continue once 'sshd' is running..." NLC

# Attempt to connect to Termux via SSH
ssh $uid@$ipadr -p 8022

# Check connection success
if [ $? -eq 0 ]; then
    echo "You're now disconnected to your mobile phone."
else
    echo "Failed to connect. Please check your IP, username, or if 'sshd' is running."
fi
