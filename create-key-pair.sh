aws ec2 create-key-pair --key-name test-key --query 'KeyMaterial' --output text > ~/.ssh/test-key.pem --profile kubaCli
sudo chmod 400 ~/.ssh/test-key.pem

