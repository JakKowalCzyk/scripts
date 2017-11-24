NAME=$1
aws ec2 describe-instances --filter Name="tag-value",Values=$NAME --query 'Reservations[*].Instances[*].{ID:InstanceId,State:State.Name}' --output text --profile kubaCli
