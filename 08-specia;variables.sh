echo "All varaiables passed: $@"
echo "number of varaiables: $#"
echo "present script name: $0"
echo "present working directory: $PWD"
echo "present home directory: $HOME"
echo "which user is running script: $USER"
echo "process id of current script: $$"
sleep 60 &
echo "process id of background script: $!"