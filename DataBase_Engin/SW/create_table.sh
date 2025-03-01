#!/bin/bash

# Display already existing tables
echo "-------------already existing tables-------------"
ls 

# Table creation loop
while true 
do
    read -p "Enter your table name: "
    table_name=$REPLY

    case $table_name in
        '' )
            echo "Table name can't be empty"
            continue;;
        *[[:space:]]* )  
            echo "The name can't have spaces"
            continue;;
        [0-9]* )  
            echo "The name can't start with a digit"
            continue ;;
        * )
            # Check if the table already exists 
            if [ -d "$table_name" ]; then
                echo "This name already exists"
                continue 
            else
                touch "$table_name"
                echo "Table $table_name created"
                break
            fi
    esac
done


while true 
do
    read -p "Insert number of fields for $table_name table: "
    fields_num=$REPLY

    case $fields_num in
        '' )  
            echo "Number of columns can't be empty"
            continue;;
        0 )
            echo "Number of columns can't be zero"
            continue;;
        [1-9] | [1-9][0-9] )
            echo "Your table number of fields is $fields_num"
            break;;
        * ) 
            echo "Write a valid number"
            continue;;
    esac
done


row_name="id:(INEGER)(PRIMARY KEY)"

# Column names loop
echo "----------------Enter column names for $table_name table----------------"

for ((i=2; i<=$fields_num; i++))
do
    while true
    do
        read -p "Enter column $i name: "
        col_name=$REPLY

        case $col_name in
            '' )
                echo "Column name can't be empty"
                continue;;
            *[[:space:]]* )  # Detects spaces in the column name
                echo "The name can't have spaces"
                continue;;
            [0-9]* )  # Column name can't start with a digit
                echo "The name can't start with a digit"
                continue ;;
            * )
                # Check if the column already exists in the table (file)
                if grep -q "^$col_name:" "$table_name"; then
                    echo "The column name '$col_name' already exists"
                    continue
                else
                    # Append the column name to row_name
                    echo "Chose Data Type For $col_name "
                    select datatype in INTEGER VARCHAR
                    do
                        if [[ -n "$datatype" ]]
                        then
                            row_name+="$col_name:($datatype)"
                            break
                        else    
                            echo "Invalid option, Please select again."
                        fi
                    done
                    break
                fi
        esac
    done
done

# Write the row_name (column names) to the table file
echo "$row_name" > "$table_name"

echo "Columns added to $table_name: $row_name"
