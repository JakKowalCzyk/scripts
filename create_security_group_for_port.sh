PORT=$1
NAME=$2
aws ec2 create-security-group --group-name $NAME --description "security group for connecting" --profile kubaCli
aws ec2 authorize-security-group-ingress --group-name $NAME --protocol tcp --port $PORT --cidr 0.0.0.0/0 --profile kubaCli
