USERID=$(id -u)
if [ $USERID -ne o]
then 
    echo "ERROR:: throw the error you wont access root permission"
fi
dnf install mysql -y    