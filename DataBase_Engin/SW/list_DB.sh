#!/bin/bash
echo "
----------------All Database----------------
"
cd ../Data
ls -F | grep / | tr / " "

cd - &>~/../../dev/null
