# ! /bin/bash
echo "Write inside a file"

echo "Test values." >> $1

#Multi line addition
cat <<EOM >>$1
$2
EOM
