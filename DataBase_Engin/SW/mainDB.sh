#!/bin/bash
select choaice in CREATE_DATABASE LIST_DATABASE CONNECT_DATABASE DROP_DATABASE
do 
case $choaice in
CREATE_DATABASE )
    echo "Type DataBase Name\n"
    source ./create_DB.sh
    ;;
LIST_DATABASE )
    echo "Listing database..."
    source ./list_DB.sh
    ;;
CONNECT_DATABASE )
    echo "CONNECT to database..."
    source ./connect_DB.sh
    ;;
DROP_DATABASE )
    echo "Drop databas..."
    source ./drop_DB.sh
    ;;
* ) 
    echo "Wrong Choice "
    continue ;;
    esac
done
