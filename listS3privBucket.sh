BUCKET=$1
aws s3 ls s3://$BUCKET --recursive --human-readable --profile kubaCli
