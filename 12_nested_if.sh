# ! /bin/bash
age=0
country=""
filePath=""

read -p "Enter person age: " age
read -p "Enter person country: " country
read -p "Enter the file path: " filePath

echo -e "\nContiditional Expression."
if [ $age -lt 10 ]; then
	echo "This person is a child"
elif [ $age -ge 10 ] && [ $age -le 17 ]; then
	echo "This is person is a teenager"
else
	echo "This person is an adult"
fi

echo -e "\nContionals with strings"
if [ $country = 'EEUU' ]; then
	echo "This person is an American citizen."
elif [ $country = 'ElSalvador' ]; then
	echo "This person is a Salvadorian citizen."
else
	echo "Unknown nationality"
fi

echo -e "\nConditionals in files."
if [ -d $filePath ]; then
	echo "This directory $filePath exists."
else
	echo "This directory $filePath does not exists."
fi
