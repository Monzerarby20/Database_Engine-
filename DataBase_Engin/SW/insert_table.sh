#!/bin/bash

PS3="Type your Table number to update: "

echo "-------Select your table number from the menu---------"

array=($(ls ))  # Ensuring only table files are listed
echo "${array[@]}"

select choice in "${array[@]}"
do 
    if [ -z "$choice" ]; then
        echo "$REPLY Not in the menu"
        continue
    else
        echo "You have selected $choice"
        
        while true; do
            # Ask for the ID to update
            echo "Enter the ID of the record you want to update:"
            read id

            # Check if the ID exists in the table
            if ! grep -q "^$id|" "$choice"; then
                echo "Error: ID not found in the table."
                continue
            fi

            # Extract old values
            old_record=$(grep "^$id|" "$choice")
            IFS='|' read -r old_id old_name old_age <<< "$old_record"

            # Ask for new values (leave empty to keep current values)
            echo "Enter new Name (leave empty to keep '$old_name'):"
            read name
            new_name=${name:-$old_name}

            echo "Enter new Age (leave empty to keep '$old_age'):"
            read age
            new_age=${age:-$old_age}

            # Ensure Age is an integer if changed
            if [[ -n "$age" && ! "$age" =~ ^[0-9]+$ ]]; then
                echo "Error: Age must be an integer."
                continue
            fi

            # Replace the old record with the updated one
            sed -i "/^$id|/c\\$id|$new_name|$new_age" "$choice"
            echo "Record updated successfully!"
            break
        done
    fi
done
