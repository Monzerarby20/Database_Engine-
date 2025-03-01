#!/bin/bash


cd ../Data
echo "Chose database To Connect"
array=($(ls -F | grep / | tr -d '/'))

select choaice in ${array[*]}
do
    if [ $REPLY -gt ${#array[*]} ]
    then
        echo "$REPLY Not in The menu"
        continue
    else
        cd ${array[${REPLY}-1]}
        echo "
        ...You Connected to  ${array[${REPLY}-1]} DataBase"

        select choice in CREATE_TABLE LIST_TABLE DROP_TABLE INSERT_INTO_TABLE SELECT_FROM_TABLE DELETE_FROM_TABLE UPDATE_FROM_TABLE
        do 
            case $choice in 
                CREATE_TABLE )
                echo " Creating Table.."
                    source ../../SW/create_table.sh
                    ;;
                LIST_TABLE )
                echo " Listing Table.."
                    source ../../SW/list_table.sh
                    ;;
                DROP_TABLE )
                echo " Drop Table.."
                    source ../../SW/drop_table.sh
                    ;;
                INSERT_INTO_TABLE )
                echo " Insert Into Table.."
                    source ../../SW/insert_table.sh
                    ;;
                SELECT_FROM_TABLE )
                echo " Select From Table.."
                    source ../../SW/select_table.sh
                    ;;
                DELETE_FROM_TABLE )
                echo " Delete From Table.."
                    source ../../SW/delete_table.sh
                    ;;
                UPDATE_FROM_TABLE )
                echo " Update From Table.."
                    source ../../SW/update_table.sh
                    ;;
                * ) 
                echo "Wrong Choice"
                    continue 
                    ;;
                esac
        done
        break 2
    fi
done
cd - &>~/../../dev/null