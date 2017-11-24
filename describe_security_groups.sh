aws ec2 describe-security-groups --profile kubaCli --query 'SecurityGroups[*].{Id:GroupId,Name:GroupName}' --output text
