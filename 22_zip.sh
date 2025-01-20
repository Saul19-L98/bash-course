# ! /bin/bash

echo "Compressing all scripts and transferring them to the windows 11 machine."
host=""
user=""
zip_name="scripts.zip"

read -p "Host: " host
read -p "User: " user
read -p "Password: " password
echo -e "\n"

echo "Creating a password-protected zip file: $zip_name"
zip -P "$password" $zip_name *.sh

echo "Transferring the zip file to the windows machine..."
scp $zip_name ${user}@${host}:/home/salla/testing

echo "Cleaning up local ZIP file..."
rm $zip_name
