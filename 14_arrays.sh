# ! /bin/bash

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
