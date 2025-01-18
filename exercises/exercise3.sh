# ! /bin/bash
play=0
selectedRex='^[1-5]{1}$'
echo  "Select your current playstation console."
echo -e "\n"
read -n1 -p "Console numeration (1-5): " play
echo -e "\n"
if [[  "$play" =~ "$selectedRex" ]] then
	echo "Is not valid value"
	exit 1
fi
if (( $play <=3 )); then
	echo "You have a classic console"
fi
if (($play > 3)); then
	echo "You play games in a modern hardware"
fi
