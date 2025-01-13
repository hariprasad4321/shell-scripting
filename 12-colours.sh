USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
VALIDATE(){
if [ $1 -ne 0 ]
then
   echo -e "$2....$R failure"
   exit 1
else
    echo -e "$2....$G success"
fi
}

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
    echo -e "print mysql is already.... $Y installed"
fi
dnf list installed git
if [ $? -ne 0 ]
then
dnf install git -y
VALIDATE $? "Installing Git"
else
    echo -e "print git alraedy.... $Y installed"
fi