aws ec2 create-key-pair --key-name dev-key --query 'KeyMaterial' --output text > ~/.ssh/dev-key.pem --profile kubaCli
sudo chmod 400 ~/.ssh/dev-key.pem

