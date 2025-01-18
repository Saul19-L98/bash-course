# ! /bin/bash
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
