# ! /bin/bash

option=0
currentDate=`date +%Y%m%d`

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
	echo "List all dbs"
	sudo -u postgres psql -c "\l"
	read -p "Choose the db to backup: " dbBackup
	read -p "Sudo password: " password
	read -p "Backup dir: " backupPath
	echo "dir: $backupPath"
	echo -e "\n"
	if [ -d "$backupPath" ]; then
		echo "Stablish directory permissions."
		echo "$password" | sudo -S chmod 755 ${backupPath}
		echo "Backup initiated..."
		sudo -u postgres pg_dump -Fc $dbBackup > "$backupPath/bdBackup${currentDate}.bak"
		echo "Backup created successfuly in the path: $backupPath/dbBackup${currentDate}.bak"
	else 
		echo "Directory does not exists."
	fi	
	read -n 1 -s -r -p "Press {ENTER} to continue..."
}

restore_backup(){
	echo -e "List Backups"
	read -p "Enter the directory where the backups are: " directory
	ls -la $directory
	read -p "Choose backup to restore: " backupToRestore
       	echo -e "\n"
	read -p "Choose the destination db name: " destination
    	#Verify is db exists
	verifyDb=$(sudo -u postgres psql -lqt | cut -d \| -f 1 | grep -wq $destination)
	if [ $? -eq 0  ]; then
		echo "Restoring in destination db: $destination"
	else
		sudo -u postgresql psql -c "create database $destination"
	fi

	if [ -f "$backupToRestore" ]; then
		echo "Resotring backup..."
		sudo -u postgres pg_restore -Fc -d $destination "$directory/$backupToRestore"
		echo "List all dbs"
		sudo -u postgres psql -c "\l"
	else
		echo "The backup $backupToRestore does not exists."
	fi
	read -n 1 -s -r -p "Press {ENTER} to continue..."
}

exit_program(){	
	echo -e "\nExiting program"
	exit 0
	sleep 3
}

while :
do	
clear
echo "Initial Menu"
echo "1. Postgress install"
echo "2. Uninstall postgress"
echo "3. Create backup"
echo "4. Restore backup"
echo "5. Exit"

read -n1 -p "Enter options [1-5]:" option
case $option in
	1) 
		install_postgres
		;;
	2)
	       	uninstall_postgres	
		;;
	3) 
		create_backup
		;;

	4) 
		restore_backup
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
