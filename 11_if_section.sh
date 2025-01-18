# ! /bin/bash

score=0
age=0
echo "If else example"
read -n1 -p "Choose your score (1-9): " score
echo -e "\n"

if [[ ! "$score" =~ ^[0-9]+$ ]] then
	echo "Invalid input. Please enter a numeric value."
	exit 1
fi
echo -e "\n"

if (( $score >= 7)); then
	echo "You have approved"
else
	echo "You failed the subject"
fi
read -p "Tell us your age: " age
if [[ $age < 18 ]]; then
	echo "You can't vote"
else 
	echo "You can vote"
fi

