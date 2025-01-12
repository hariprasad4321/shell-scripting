USERID=$(id -u)
if [ $USERID -ne 0 ]
then 
    echo "ERROR:: throw the error you wont access root permission"
    exit 1
fi
dnf list installed mysql
if [ $? -ne 0 ]
then
dnf install mysql -y 
if [ $? -ne 0 ]
then
echo "mysql installing....failure"
exist 1
else
echo "mysql installing....success"
fi  
else
echo "print mysql is already installed"
fi
dnf install git -y 
dnf list installed git
if [ $? -ne 0 ]
then
echo "git installing....failure"
exit 1
else
    echo "git installing....success"
fi
else
    echo "print git alraedy installed"
fi