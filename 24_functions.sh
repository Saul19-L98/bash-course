# ! /bin/bash

option=0
while :
do	
clear
echo"Initial Menu"
echo "1. Postgress install"
echo "2. Uninstall postgress"
echo "3. Create backup"
echo "4. Backup Restart"
echo "5. Exit"

install_postgress () {	
	echo -e "\nInstall Postgress"
	sleep 3
}

uninstall_postgress() {	
	echo -e "\nUninstall Postgress"
	sleep 3
}

create_backup(){	
	echo -e "\nCreate Postgress backup"
	sleep 3
}

restart_backup(){
	echo -e "\nRestarting Postgress backup"
	sleep 3
}

exit_program(){	
	echo -e "\nExiting program"
	exit 0
	sleep 3
}

read -n1 -p "Enter options [1-5]:" option
case $option in
	1) 
		install_postgress
		;;
	2)
	       	uninstall_postgress	
		;;
	3) 
		create_backup
		;;

	4) 
		restart_backup
		;;

	5)
	       exit_program	
		;;
    esac
done
