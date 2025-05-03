#!/bin/bash

USERS=("user1" "user2" "user3")

for username in "${USERS[@]}"; do
    if [ -d "/home/$username" ]; then
         echo "User $username already exists, skipping..."
         continue
    fi

    sudo mkdir -p /home/"$username"
    sudo useradd -m -d /home/"$username" "$username"

    PASSWORD=$(openssl rand -base64 12)
    echo "$usernsme:$PASSWORD" | sudo chpasswd
    echo "$PASSWORD" > "${username}_password.txt"

   sudo -u "$username" ssh-keygen -t rsa -b 2048 -f "/home/$username/.ssh/id_rsa" -N ""

   echo "User $username has been created. Password sawed to ${username}_password.txt"
done
