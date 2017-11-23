NAME=$1
aws ec2 describe-instances --filter Name="tag-value",Values=$NAME   --profile kubaCli
