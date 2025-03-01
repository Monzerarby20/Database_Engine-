#!/bin/bash

PS3="Type your Table number to insert into: "

echo "-------Select your table number from the menu---------"

array=($(ls ))  
echo "${array[@]}"

select choice in "${array[@]}"
do 
    if [ -z "$choice" ]; then
        echo "$REPLY Not in the menu"
        continue
    else
        echo "You have selected $choice"

        while true; do
            
            last_id=$(awk -F'|' 'NR>1 {print $1}' "$choice" | sort -n | tail -1)
            new_id=$((last_id + 1))

            
            if [ -z "$last_id" ]; then
                new_id=1
            fi

            
            while true; do
                echo "Enter Name:"
                read name
                if [[ -z "$name" ]]; then
                    echo "Error: Name cannot be empty!"
                else
                    break
                fi
            done

            
            while true; do
                echo "Enter Age:"
                read age
                if ! [[ "$age" =~ ^[0-9]+$ ]]; then
                    echo "Error: Age must be an integer!"
                else
                    break
                fi
            done

           
            echo "$new_id|$name|$age" >> "$choice"
            echo "Record inserted successfully! (ID: $new_id)"
            break
        done
    fi
done
