# #!/bin/bash


# PS3=" Type your Table number to delete from: "

# echo "-------Select your table number from the menu---------"

# array=($(ls))
# echo $array[*]
# select choice in ${array[@]}
# do 
#     if [ -z "$choice" ]
#     then    
#         echo "$REPLY Not in the menuf"
#         continue
#     else
    
#         echo "You selected ${array[$[REPLY-1]]} table"
#         echo
#         break
#     fi
# done

# select choice in DELETE_ALL DELETE_ROW
# do 
#     case $choice in
#         DELETE_ALL )
#             sed -i '/^[[:digit:]]/d' $table_name
#             echo "You Deleted ${array[$[REPLY-1]]} table successfully"
#             break;;
#         DELETE_ROW )
#             while true
#             do
#             read -p "Enter the row Primery Key to delete: " pk
#             row=$(awk -F':' -v pk="$pk" '$1 == pk {print $0}' $table_name)
#             if [ -z "$row" ]
#             then
#                 echo "Row not found"
#                 continue
#             else
#                 sed -i "/$row/d" $table_name
#                 echo "You Deleted row $row from $table_name table successfully"
#                 break
#             fi
#             done
#             echo "${array[$[*]]} table"
#             row_id=$REPLY
#             sed -i "/$row_id/d" ${array[$[REPLY-1]]}
#             echo "You Deleted row $row_id from ${array[$[REPLY-1]]} table successfully"
#             break;;
#         * )
#             echo "Wrong Choice"
#             continue;;
#     esac
# done

# echo 
#!/bin/bash

PS3="Type your Table number to delete from: "

echo "------- Select your table number from the menu ---------"

array=($(ls))
echo "${array[@]}"

select table_name in "${array[@]}"
do 
    if [ -z "$table_name" ]; then
        echo "$REPLY is not in the menu"
        continue
    else
        echo "You selected $table_name table"
        echo
        break
    fi
done

PS3="Choose the deletion method: "
select choice in DELETE_ALL DELETE_ROW
do 
    case $choice in
        DELETE_ALL )
            sed -i '/^[[:digit:]]/d' "$table_name"
            echo "All records in $table_name have been deleted successfully."
            break;;
        
        DELETE_ROW )
            while true; do
                read -p "Enter the row Primary Key (ID) to delete: " pk
                
                # Check if the row exists
                row=$(awk -F'|' -v pk="$pk" '$1 == pk {print $0}' "$table_name")

                if [ -z "$row" ]; then
                    echo "Row with ID $pk not found. Please try again."
                    continue
                else
                    sed -i "/^$pk|/d" "$table_name"
                    echo "Row with ID $pk has been deleted successfully from $table_name."
                    break
                fi
            done
            break;;
        
        * )
            echo "Wrong Choice, please select a valid option."
            continue;;
    esac
done
