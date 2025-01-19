# ! /bin/bash
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

