#!/bin/bash

PS3="Select your table to update: "

echo "-------Select your table number from the menu---------"

array=($(ls))  
echo "${array[@]}"

select choice in "${array[@]}"
do 
    if [ -z "$choice" ]; then
        echo "$REPLY is not in the menu."
        continue
    else
        echo "You have selected $choice"
        
        while true; do

            echo "Enter the ID of the record you want to update:"
            read id

            
            if ! grep -q "^$id|" "$choice"; then
                echo "Error: ID not found in the table."
                continue
            fi

            
            old_record=$(grep "^$id|" "$choice")
            IFS='|' read -r old_id old_name old_age <<< "$old_record"

        
            echo "Enter new Name (leave empty to keep '$old_name'):"
            read name
            new_name=${name:-$old_name}

            echo "Enter new Age (leave empty to keep '$old_age'):"
            read age
            new_age=${age:-$old_age}

            
            if [[ -n "$age" && ! "$age" =~ ^[0-9]+$ ]]; then
                echo "Error: Age must be an integer."
                continue
            fi


            sed -i "/^$id|/c\\$id|$new_name|$new_age" "$choice"
            echo "Record updated successfully!"
            break
        done
    fi
done