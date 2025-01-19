# ! /bin/bash
echo "File operations"
mkdir -m 755 backupScripts

echo -e "\nCopy all scripts to a backup directory."
cp *.* backupScripts/
ls -la backupScripts/

echo -e "\nMove the directories backupScripts to a new location: $HOME"
mv backupScripts $HOME

echo -e "\nDelete all .txt files."
rm -r *.txt

