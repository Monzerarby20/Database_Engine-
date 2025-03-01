#!/bin/bash

PS3="Select your table to view data: "

echo "-------Select your table from the menu---------"

array=($(ls))  # Ensuring only table files are listed
echo "${array[@]}"

select choice in "${array[@]}"
do 
    if [ -z "$choice" ]; then
        echo "$REPLY is not in the menu."
        continue
    else
        echo "You have selected $choice"
        
        # Check if the file is empty
        if [[ ! -s "$choice" ]]; then
            echo "The table is empty!"
            break
        fi

        # Display table content
        echo "------------------------------------"
        echo "ID | Name | Age"
        echo "------------------------------------"
        cat "$choice" | while IFS='|' read -r id name age
        do
            echo "$id | $name | $age"
        done
        echo "------------------------------------"
        
        break
    fi
done
