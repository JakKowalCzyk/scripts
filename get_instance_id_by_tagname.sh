NAME=$1
aws ec2 describe-instances --filter Name="tag-value",Values=$NAME --query 'Reservations[0].Instances[0].InstanceId' --output text --profile kubaCli
