# ! /bin/bash

echo "Files - Directories"
if [ $1 = "d" ]; then
	mkdir -m 755 $2
	echo "Directory created successfuly"
	ls -la $2
elif [ $1 = "f" ]; then
	touch $2
	echo "File created successfuly"
	ls -la $2
else 
	echo "Invalid option: $1"
fi
