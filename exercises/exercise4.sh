# ! /bin/bash
#!/bin/bash

id=0
content=""
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

copy=${options[*]}
copyLength=${#copy[@]}
optionsLength=${#options[@]}

while :
do
  clear
  echo "Processes Menu"
  echo "-------Options-------"
  for ((i=0; i < $optionsLength; i++))
  do
    echo "$i. ${options[i]}"
  done

  read -n1 -p "Select an option: " option

  case $option in
    1)
      echo "Current Process is a bash program."
      id=0
      content=${options[0]}
      sleep 3
      ;;
    2)
      echo "60% of memory is available."
      id=1
      content=${options[1]}
      sleep 3
      ;;
    3)
      echo "30% of the disk remains available."
      id=2
      content=${options[2]}
      sleep 3
      ;;
    4)
      echo "Network data is restricted."
      id=3
      content=${options[3]}
      sleep 3
      ;;
    5)
      echo "Config Data is set for js."
      id=4
      content=${options[4]}
      sleep 3
      ;;
    6)
      echo "Program data is set to bash."
      id=5
      content=${options[5]}
      sleep 3
      ;;
    7)
      echo "Backup created."
      id=6
      content=${options[6]}
      sleep 3
      ;;
    8)
      echo "Create an option."
      id=7
      content=${options[7]}
      sleep 3
      ;;
    9)
      echo "Exiting operations"
      exit 0
      sleep 3
      ;;
  esac
done

if[[ $optionsLength == $copyLength ]]; then
  echo "The options array has been modified."
  echo "The new array is: ${options[$#options[@]]}"
else
  echo "The options array has not been modified."
    echo "The original array is: ${copy[$id]}"
fi
