#!/bin/bash

cd ../Data

while true
do
echo "Write your DataBase Name"
read dbname
case $dbname in
 '' )
    echo "The Name Can't Be Empty"
     continue ;;
  *[[:space:]] | *[[:space:]]* | [[:space:]]* )
    echo "The Name Can't have Spaces "
     continue ;;
  [0-9]* ) 
        echo "The Name Can't Start With Integr"
        continue ;;
  *[a-zA-Z_]*[a-zA-Z_] | [a-zA-Z_] )
  if (find $dbname `ls -F | grep /` &>~/../../dev/null )
  then
    echo "This Name is Exsits"
        continue 
        else
        mkdir "$dbname"
        break
        fi
        ;;

 * )
    echo "write a balid name"
    continue ;;
    esac
done

cd - &>~/../../dev/null