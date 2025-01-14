#!/bin/bash
# Variables
USERID=$(id -u)
R="\e[31m" # Red
G="\e[32m" # Green
Y="\e[33m" # Yellow
LOGS_FOLDER="/var/log/shellscript-logs"
LOG_FILE=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE_NAME="$LOGS_FOLDER/$LOG_FILE/-$TIMESTAMP.log"

# Function to validate command success
VALIDATE() {
    if [ $1 -ne 0 ]; then
        echo -e "$2......$R failure"
        exit 1
    else
        echo -e "$2.......$G success"
    fi
}

# Create necessary directories for logs
mkdir -p "$LOGS_FOLDER/$LOG_FILE"

# Log script start
echo "script started at and executed at: $TIMESTAMP"

# Check for root access
if [ $USERID -ne 0 ]; then
    echo "Error: User does not have root access. Please run as root."
    exit 1
fi

# Check and install MySQL
dnf list installed mysql >>"$LOG_FILE_NAME" 2>&1
if [ $? -ne 0 ]; then
    dnf install mysql -y >>"$LOG_FILE_NAME" 2>&1
    VALIDATE $? "Installing MySQL"
else
    echo -e "MySQL is already......$Y installed"
fi

# Check and install Git
dnf list installed git >>"$LOG_FILE_NAME" 2>&1
if [ $? -ne 0 ]; then
    dnf install git -y >>"$LOG_FILE_NAME" 2>&1
    VALIDATE $? "Installing Git"
else
    echo -e "Git is already......$Y installed"
fi
