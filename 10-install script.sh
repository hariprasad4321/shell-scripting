USERID=$(id -u)
if [ $USERID -ne 0 ]
then 
    echo "ERROR:: throw the error you wont access root permission"
    exit 1
fi
dnf install mysql -y 
if [ $? -ne 0 ]
exit 1
then
echo "mysql installing....failure"
else
echo "mysql installing....success"
fi  
dnf install git -y 
if [ $? -ne 0 ]
exit 1
then
echo "git installing....failure"
else
echo "git installing....success"
fi