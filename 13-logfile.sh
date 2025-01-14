USERID=(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
LOGS_FOLDER="/var/log/shellscript-logs"
LOG_FILE=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE_NAME="$LOGS_FOLDER/$LOG_FILE/-$TIMESTAMP.log"

VALIDATE(){
if [ $1 -ne 0 ]
then
    echo -e "$2......$R failure"
    exit 1
else
    echo -e "$2.......$G success"
fi
}

echo "script started at and excuted at: $TIMESTAMP"

if [ USERID -ne 0 ]
then  
    echo "Error:throw the error message user does not have root access"
    exit 1
fi

dnf list installed mysql &>>$LOG_FILE_NAME
if [ $? -ne 0 ]
then
    dnf install mysql -y &>>$LOG_FILE_NAME
VALIDATE $? "Installing mysql"
else
    echo -e "print mysql is already...... $Y insatlled" 
fi

dnf list installed git &>>$LOG_FILE_NAME
if [ $? -ne 0 ]
then
    dnf install git -y &>>LOG_FILE_NAME
VALIDATE $? "Installing git" 
else  
    echo -e "print mysql is already.....$Y installed" 
fi



