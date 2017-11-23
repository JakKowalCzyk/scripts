aws ec2 create-security-group --group-name ssh22 --description "security group for connecting via ssh" --profile kubaCli
aws ec2 authorize-security-group-ingress --group-name ssh22 --protocol tcp --port 22 --cidr 0.0.0.0/0 --profile kubaCli
