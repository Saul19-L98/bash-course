# ! /bin/bash

option=0

install_postgres() {
	echo -e "\nInstalling Postgres..."
	verifyInstall=$(which psql)
	if [ $? -eq 0 ]; then
		echo -e "\nPostgres is already installed on your machine."
	else
		read -s -p "Enter sudo password: " password
		read -s -p "Enter password to use for Postgres: " pwdPostgres
		echo "$password" | sudo -S apt update
		if [ $? -ne 0 ]; then
			echo -e "\nIncorrect sudo password. Please try again."
			return
		fi
		echo "$password" | sudo -S apt-get -y install postgresql postgresql-contrib
		sudo -u postgres psql -c "ALTER USER postgres WITH PASSWORD '${pwdPostgres}';"
		echo "$password" | sudo -S systemctl enable postgresql.service
		echo "$password" | sudo -S systemctl start postgresql.service
		echo -e "\nPostgres installation completed."
	fi
	read -n 1 -s -r -p "Press {ENTER} to continue..."
}

uninstall_postgres() {
	read -s -p "Enter sudo password: " password
	echo -e "\n"
	echo "$password" | sudo -S systemctl stop postgresql.service
	echo "$password" | sudo -S apt-get -y --purge remove postgresql\*
	echo "$password" | sudo -S rm -r /etc/postgresql /etc/postgresql-common /var/lib/postgresql
	echo "$password" | sudo -S userdel -r postgres
	echo "$password" | sudo -S groupdel postgresql
	echo -e "\nPostgres uninstalled successfully."
	read -n 1 -s -r -p "Press {ENTER} to continue..."
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

while :
do	
clear
echo"Initial Menu"
echo "1. Postgress install"
echo "2. Uninstall postgress"
echo "3. Create backup"
echo "4. Backup Restart"
echo "5. Exit"

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

# install_postgress () {	
# 	echo -e "\nInstall Postgress"
# 	verifyInstall=$(which psql)
# 	if [ $? -eq 0 ]; then
# 		echo -e "\n Postgress is already installed in your machine."
# 	else
# 		read -s -p "Enter sudo password: " password
# 		read -s -p "Enter password to use postgress: " pwdPostgress
# 		echo "$password" | sudo -S apt update
# 		echo "$password" | sudo -S apt-get -y install postgresql postgresql-contrib
# 		sudo -u postgres psql -c "ALTER USER postgres WITH PASSWORD '${pwdPostgress}';"
# 		echo "$password" | sudo -S systemctl enable postgresql.service
# 		echo "$password" | sudo -S systemctl start postgresql.service
# 	fi
# 	read -n 1 -s -r -p "Press {ENTER} to continue..."
	
# }

# uninstall_postgress() {	
# 	read -s -p "Enter password with sudo:" password
# 	echo -e "\n"
# 	echo "$password" | sudo -S systemctl stop postgresql.service
# 	echo "$password" | sudo -S apt-get -y --purge remove postgresql\*
# 	echo "$password" | sudo -S rm -r /etc/postgresql
# 	echo "$password" | sudo -S rm -r /etc/postgresql-common
# 	echo "$password" | sudo -S rm -r /var/lib/postgresql
# 	echo "$password" | sudo -S userdel -r postgres
# 	echo "$password" | sudo -S groupdel postgresql
# 	read -n 1 -s -r -p "Press {ENTER} to continue..."
# }