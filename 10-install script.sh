USERID=$(id -u)
if [ $USERID -ne 0 ]
then 
    echo "ERROR:: throw the error you wont access root permission"
fi
dnf install mysql -y   
dnf install git -y 