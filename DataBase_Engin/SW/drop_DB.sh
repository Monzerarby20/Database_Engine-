#!/bin/bash
cd ../Data
while true
do

echo "Enter Database Name to drop..."
read dbname

case $dbname in
 '')
    echo "Can't Drop Empty DataBase"
    continue ;;
 *[a-zA-Z_]*[a-zA-Z_] | [a-zA-Z_] )
  if (find $dbname `ls -F | grep /` &>~/../../dev/null )
  then
        rmdir "$dbname"
    echo "You Drop DataBase With Name $dbname "
        break
    else
    echo "No DataBase With This Name"
    continue
    fi
    ;;
* )
   echo "Wrong Name"
   continue ;;
 esac
done

cd - &>~/../../dev/null