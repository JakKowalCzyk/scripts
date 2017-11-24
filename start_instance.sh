HOST=$1
ID_GROUP_SSH22=$(aws ec2 describe-security-groups --profile kubaCli --query 'SecurityGroups[?GroupName==`ssh22`].GroupId' --output text)
ID_CENTOS_AMI=$(aws ec2 describe-images --owners 'aws-marketplace' --filters 'Name=product-code,Values=aw0evgkw8e5c1q413zgy5pjce'  --query 'sort_by(Images, &CreationDate)[-1].[ImageId]'     --output 'text' --profile kubaCli)
ID_INSTANCE=$(aws ec2 run-instances --image-id $ID_CENTOS_AMI --security-group-ids $ID_GROUP_SSH22 --count 1 --instance-type t2.micro --key-name test-key --query 'Instances[0].InstanceId' --output text --profile kubaCli)
aws ec2 create-tags --resources $ID_INSTANCE --tags Key=Name,Value=$HOST --profile kubaCli

IP_INSTANCE=$(aws ec2 describe-instances --instance-ids $ID_INSTANCE --query 'Reservations[0].Instances[0].PublicIpAddress' --profile kubaCli --output text)

echo $IP_INSTANCE
echo $ID_INSTANCE

echo ' ' >> ~/.ssh/config
echo 'Host '$HOST >> ~/.ssh/config
echo 'HostName' $IP_INSTANCE >> ~/.ssh/config
echo 'Port 22' >>  ~/.ssh/config
echo 'IdentityFile ~/.ssh/test-key.pem' >>  ~/.ssh/config
echo 'User centos' >>  ~/.ssh/config


