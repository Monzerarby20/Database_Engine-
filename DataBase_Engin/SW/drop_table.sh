#!/bin/bash

PS3=" Type your Table number to Drop: "

echo "-------Select your table number from the menu---------"

array=($(ls))
echo $array[*]
select choice in ${array[@]}
do 
    if [ -z "$choice" ]
    then    
        echo "$REPLY Not in the menuf"
        continue
    else
        rm $choice
        echo "You Droped ${array[$[REPLY-1]]} successfully"
        echo
        break
    fi
done