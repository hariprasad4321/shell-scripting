USERID=$(id -u)
VALIDATE(){
if [ $1 -ne 0 ]
then
   echo "$2....failure"
   exit 1
else
    echo "$2....success"
}
fi
if [ $USERID -ne 0 ]
then 
    echo "ERROR:: throw the error you wont access root permission"
    exit 1
fi
dnf list installed mysql
if [ $? -ne 0 ]
then
dnf install mysql -y 
VALIDATE $? "Installing Mysql"
else
    echo "print mysql is already installed"
fi
dnf list installed git
if [ $? -ne 0 ]
then
dnf install git -y
VALIDATE $? "Installing Git"
else
    echo "print git alraedy installed"
fi