#!/din/bash

echo "All variables passed to the script: $@"
echo "Number of variables: $#"
echo "Script name: $0"
echo "Current Directory: $PWD"
echo "Use running this script: $USER"
echo "Home directory of user: $HOME"
echo "PID of the script: $$"
sleep 10 &
echo "PID of last command in background: $!"

# Output:
# sh 08-special-vars.sh devops aws azure

# All variables passed to the script: devops aws azure
# Number of variables: 3
# Script name: 08-special-vars.sh
# Current Directory: /home/ec2-user/shell-practice
# Use running this script: ec2-user
# Home directory of user: /home/ec2-user
# PID of the script: 6184
# PID of last command in background: 6185

# ps -ef | grep sleep