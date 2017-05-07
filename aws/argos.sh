set -ex

aws --region eu-central-1 cloudformation create-stack --stack-name argos --template-body file://argos.yml
aws --region eu-central-1 cloudformation wait stack-create-complete --stack-name argos
instance_id=$(aws --region eu-central-1 cloudformation describe-stack-resources --stack-name argos | jq -r .StackResources[0].PhysicalResourceId)
ip_address=$(aws --region eu-central-1 ec2 describe-instances --instance-ids $instance_id | jq -r .Reservations[0].Instances[0].PublicIpAddress)
ssh -i ~/.ssh/otrera ubuntu@$ip_address "wget -O- https://raw.githubusercontent.com/mazerty/idem/master/build/mazerty/ubuntu-server-16.04.2.sh | sh"
ssh -i ~/.ssh/otrera ubuntu@$ip_address -t "sh -c 'cd ~/workspace/kantoku/docker/ && ./build.sh'"
aws --region eu-central-1 cloudformation delete-stack --stack-name argos
