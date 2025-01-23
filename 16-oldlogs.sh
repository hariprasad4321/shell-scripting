USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
SOURCE_DIR="/home/ec2-user/app-logs"
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
CHECK_ROOT(){
if [ $USERID -ne 0 ]
then  
    echo "Error:throw the error message user does not have root access"
    exit 1
fi
}

FILES_TO_DELETE=$(find $SOURCE_DIR -name "*.log" -mtime +14)
echo "files to deleted is : $FILES_TO_DELETE"

