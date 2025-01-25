
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
SOURCE_DIR=$1
DEST_DIR=$2
DAYS=${3:-14}
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

USAGE(){
    echo -e "$R USAGE:: sh backup.sh <SOURCE_DIST> <DEST_DIR> <DAYS(optional)>"
}
if [ $# -lt 2 ]
then
    USAGE   
fi


echo "script started at and excuted at: $TIMESTAMP"
