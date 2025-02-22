12_nested_if.sh                                                                                     0000775 0001750 0001750 00000001403 14742520013 011777  0                                                                                                    ustar   sam                             sam                                                                                                                                                                                                                    # ! /bin/bash
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
                                                                                                                                                                                                                                                             13_case.sh                                                                                          0000775 0001750 0001750 00000000417 14742521070 010763  0                                                                                                    ustar   sam                             sam                                                                                                                                                                                                                    # ! /bin/bash

option=""
echo "Example sentence case"
read -p "Choose an option from a-z: " option
echo -e "\n"
case $option in 
	"a") echo -e "\nSave file opertion";;
	"b") echo "Delete file operation";;
	[c-d]) echo "Missin operation";;
	"*") echo "Wrong option"
esac

                                                                                                                                                                                                                                                 14_arrays.sh                                                                                        0000775 0001750 0001750 00000001536 14742774176 011376  0                                                                                                    ustar   sam                             sam                                                                                                                                                                                                                    # ! /bin/bash

numbersArray=(1 2 3 4 5 6)
stringsArray=(Marco, Antonio, Pedro, Susana)
rangeArray=({A..Z} {10..20})

#Print all items in an array.
echo "Print numbers array: ${numbersArray[*]}"
echo "Print strings array: ${stringsArray[*]}"
echo "Print range array: ${rangeArray[*]}"

#Print an array size.
echo "Print numbers array size: ${#numbersArray[*]}"
echo "Print strings array size: ${#stringsArray[*]}"
echo "Print range array size: ${#rangeArray[*]}"

#Print items in specific array positions.
echo "Print numbers array: ${numbersArray[3]}"
echo "Print strings array: ${stringsArray[3]}"
echo "Print range array: ${rangeArray[3]}"

echo "Before unset, numbers array size: ${#numbersArray[*]}"
#Add and delete array values
numbersArray[7]=20
unset numbersArray[0]
echo "Numbers array: ${numbersArray[*]}"
echo "Numbers array size: ${#numbersArray[*]}"
                                                                                                                                                                  15_for_loop.sh                                                                                      0000774 0001750 0001750 00000001124 14743004753 011671  0                                                                                                    ustar   sam                             sam                                                                                                                                                                                                                    # ! /bin/bash
# For loop, first iteration with bash.

numbersArray=(1 2 3 4 5 6)
stringsArray=(Marco, Polo, Denis, Pedro)

echo "Iteration through a list of numbers"
for num in ${numbersArray[*]}
do
	echo "Number: $num"
done

echo "Iteration through a list of strings"
for str in ${stringsArray[*]}
do
	echo "String: $str"
done

echo "Iteration through files"
for file in *
do
	echo "File name: $file"
done

echo "Iteration using commands"
for file in $(ls)
do
	echo "File name: $file"
done

echo "Iteration using traditioanl formats"
for ((i=1; i<10; i++))
do
	echo "Current iteration: $i"
done
                                                                                                                                                                                                                                                                                                                                                                                                                                            16_files_directories.sh                                                                             0000774 0001750 0001750 00000000364 14743042640 013553  0                                                                                                    ustar   sam                             sam                                                                                                                                                                                                                    # ! /bin/bash

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
                                                                                                                                                                                                                                                                            17_file_writing.sh                                                                                  0000774 0001750 0001750 00000000160 14743043212 012526  0                                                                                                    ustar   sam                             sam                                                                                                                                                                                                                    # ! /bin/bash
echo "Write inside a file"

echo "Test values." >> $1

#Multi line addition
cat <<EOM >>$1
$2
EOM
                                                                                                                                                                                                                                                                                                                                                                                                                18_read_files.sh                                                                                    0000774 0001750 0001750 00000000474 14743046346 012165  0                                                                                                    ustar   sam                             sam                                                                                                                                                                                                                    # ! /bin/bash
echo "Read a file"
cat $1
echo -e "\nSave file values into varriables."
catValue=`cat $1`
echo "$catValue"

# Use special value IFS (Internal Field Separator) to prevent the empty spaces to be suppressed

echo -e "\nRead File line by line using while."
while IFS= read line
do
	echo "$line"
done < $1

                                                                                                                                                                                                    19_move_files.sh                                                                                    0000774 0001750 0001750 00000000462 14743046322 012210  0                                                                                                    ustar   sam                             sam                                                                                                                                                                                                                    # ! /bin/bash
echo "File operations"
mkdir -m 755 backupScripts

echo -e "\nCopy all scripts to a backup directory."
cp *.* backupScripts/
ls -la backupScripts/

echo -e "\nMove the directories backupScripts to a new location: $HOME"
mv backupScripts $HOME

echo -e "\nDelete all .txt files."
rm -r *.txt

                                                                                                                                                                                                              20_package.sh                                                                                       0000774 0001750 0001750 00000000416 14743065655 011454  0                                                                                                    ustar   sam                             sam                                                                                                                                                                                                                    # /bin/bash

echo "Package all scripts in one directory named shellCourse"
tar -cvf shellCourse.tar *.sh

#When you use gzip to make a package, this command deletes the previous package
gzip shellCourse.tar

echo "Package one file with a 9 ratio."
gzip -9 9_options.sh

                                                                                                                                                                                                                                                  21_package_pbzip2.sh                                                                                0000774 0001750 0001750 00000000354 14743066527 012743  0                                                                                                    ustar   sam                             sam                                                                                                                                                                                                                    # /bin/bash

echo "Package all scripts in one directory named shellCourse"
tar -cvf shellCourse.tar *.sh
pbzip2 -f shellCourse.tar

echo "Make a package directory with the help of tar and pbzip2"
tar -cf *.sh -c > shellCourseTwo.tar.bz
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
