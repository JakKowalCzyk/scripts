ID=$1
aws ec2 terminate-instances --instance-ids $ID --profile kubaCli
