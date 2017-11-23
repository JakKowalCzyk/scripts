ID=$1
NAME=$(aws ec2 describe-instances --instance-ids  $ID  --query 'Reservations[0].Instances[0].Tags[?Key==`Name`].Value' --output text --profile kubaCli)
VOL_ID=$(aws ec2 describe-volumes --filter Name="attachment.instance-id",Values=$ID --query 'Volumes[0].VolumeId' --output text  --profile kubaCli)
aws ec2 terminate-instances --instance-ids $ID --profile kubaCli

CODE=$(aws ec2 describe-instances --instance-ids $ID --query 'Reservations[0].Instances[0].State.Code' --output text --profile kubaCli)
while [ $CODE != "48" ]
do
	sleep 10s
	CODE=$(aws ec2 describe-instances --instance-ids $ID --query 'Reservations[0].Instances[0].State.Code' --output text --profile kubaCli)	
done

aws ec2 delete-volume --volume-id $VOL_ID --profile kubaCli
echo '/Host '"$NAME"'/,+5d'
sed -i '/Host '"$NAME"'/,+5d' ~/.ssh/config
