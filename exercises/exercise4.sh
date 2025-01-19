# ! /bin/bash
#!/bin/bash

id=0
option=""
options=(
  "Current Processes"
  "Available Memory"
  "Disk Space"
  "Network Information"
  "Env. config."
  "Program Information"
  "Backup Information"
  "Blank option"
  "Exit"
)

optionsLength=${#options[@]}
copy=()
for option in "${options[@]}"
do
	copy+=("$option")
done
copyLength=${#copy[@]}

while :
do
  clear
  echo "Processes Menu"
  echo "-------Options-------"
  for ((i=0; i < $optionsLength; i++))
  do
	  echo "$((i + 1)). ${options[i]}"
  done

  read -n1 -p "Select an option: " option

  case $option in
    1)
      echo -e "\nCurrent Process is a bash program."
      id=0
      content=${options[0]}
      sleep 3
      ;;
    2)
      echo -e "\n60% of memory is available."
      id=1
      content=${options[1]}
      sleep 3
      ;;
    3)
      echo -e "\n30% of the disk remains available."
      id=2
      content=${options[2]}
      sleep 3
      ;;
    4)
      echo -e "\nNetwork data is restricted."
      id=3
      content=${options[3]}
      sleep 3
      ;;
    5)
      echo -e "\nConfig Data is set for js."
      id=4
      content=${options[4]}
      sleep 3
      ;;
    6)
      echo -e "\nProgram data is set to bash."
      id=5
      content=${options[5]}
      sleep 3
      ;;
    7)
      echo -e "\nBackup created."
      id=6
      content=${options[6]}
      sleep 3
      ;;
    8)
      echo -e "\nCreate an option."
      read -p "Add a new option: " newOption
      options+=("$newOption")
      sleep 3
      ;;
    9)
      echo -e "\nExiting operations"
      break
      sleep 3
      ;;
  esac
done

if [[ ${#options[*]} = $copyLength ]] then
  echo "The options array has not been modified."
  echo "The original array is: ${copy[id]}"
else
  echo "The options array has been modified."
  echo "The new array is: ${options[-1]}"
fi
