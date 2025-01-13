USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
LOGS_FOLDER="var/log/shellscript-logs"
LOG_FILE=$(echo $0 | cut -d "." -f1 )
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE_NAME="$LOGS_FOLDER/$LOG_FILE-$TIMESTAMP.log"
VALIDATE(){
if [ $1 -ne 0 ]
then
   echo -e "$2....$R failure"
   exit 1
else
    echo -e "$2....$G success"
fi
}
echo "script started and excuted at:: $TIMESTAMP" &>>$LOG_FILE_NAME

if [ $USERID -ne 0 ]
then 
    echo "ERROR:: throw the error you wont access root permission"
    exit 1
fi
dnf list installed mysql &>>$LOG_FILE_NAME
if [ $? -ne 0 ]
then
dnf install mysql -y &>>$LOG_FILE_NAME
VALIDATE $? "Installing Mysql"
else
    echo -e "print mysql is already.... $Y installed"
fi
dnf list installed git &>>$LOG_FILE_NAME
if [ $? -ne 0 ]
then
dnf install git -y
VALIDATE $? "Installing Git" &>>$LOG_FILE_NAME
else
    echo -e "print git alraedy.... $Y installed"
fi