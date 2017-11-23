FILE=$1
aws s3 cp $FILE s3://bucket-scripts/kuba/$FILE --profile kubaCli
