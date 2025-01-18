# ! /bin/bash

option=""
echo "Example sentence case"
read -p "Choose an option from a-z: " option
echo -e "\n"
case $option in 
	"a") echo -e "\nSave file opertion";;
	"b") echo "Delete file operation";;
	[c-d]) echo "Missin operation";;
	"*") echo "Wrong option"
esac

