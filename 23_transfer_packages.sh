# ! /bin/bash

echo "Package all the scripts in a directory named shellcoruse and transfer them throw the network to another device using rsync command."

host=""
user=""

read -p "Host: " host
read -p "User: " user
echo -e "\nPackaging process has started."

rsync -avz $(pwd) $user@$host:/home/salla/testing

echo -e "\nTransfer completed"
