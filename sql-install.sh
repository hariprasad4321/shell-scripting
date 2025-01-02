#!/bin/bash
USERID=$(id -u)
if [ $USERID ne 0 ]
then
    echo "ERROR: you must have sudo access to run the script"
    exit 1
fi
dnf installed mysql
if [ $? -ne 0 ]
then
    dnf install mysql -y
    if [ $? -ne 0 ]
    then
        echo "then show mysql .....failure"
        exit 1
    else
        echo "then show mysqql .....success"
    fi
else 
echo "show mysql installed alraedy"     
fi       