#!/bin/bash
stackname=awscracknip   #Rename if you want another name for the stack

case "$1" in
  "-install")
    key=$2
    instance=${3:-g5.xlarge}
  #  profile=${4:-default}

    echo "Deploying stack"
    aws cloudformation create-stack --template-body file://crack.yaml --stack-name $stackname --parameters ParameterKey=KeyName,ParameterValue=$key ParameterKey=InstanceType,ParameterValue=$instance --output text 
    sleep 2
    echo "Stack is in creation, wait a few seconds. You can check stack status via"
    echo "-info"
    sleep 1
    echo "After stack is deployed, install is performed on the instance, this takes approx 5 min till hashcat is ready"
    ;;

  "-start")
    echo "Start order is given"
    instanceid=$(aws cloudformation describe-stacks --stack-name $stackname --query Stacks[*].Outputs[0].OutputValue --output text)
    aws ec2 start-instances --instance-ids $instanceid 
    ;;

  "-stop")
    echo "Instance is stopped"
    instanceid=$(aws cloudformation describe-stacks --stack-name $stackname --query Stacks[*].Outputs[0].OutputValue --output text)
    aws ec2 stop-instances --instance-ids $instanceid 
    ;;

  "-kill")
    echo "Stack is beeing deleted this takes a up to a few minutes"
    aws cloudformation delete-stack --stack-name $stackname --output text
    aws cloudformation describe-stacks --stack-name $stackname --query Stacks[*].StackStatus --output text
    ;;

  "-info")
    echo "Stack status:"
    aws cloudformation describe-stacks --stack-name $stackname --query Stacks[*].StackStatus --output text
    echo 'Outputs'
    aws cloudformation describe-stacks --stack-name $stackname  --query Stacks[*].Outputs --output text
    ;;

  "-connect")
    stringec2=$(aws cloudformation describe-stacks --stack-name $stackname --query Stacks[*].Outputs[1].OutputValue --output text)
    setkey=$(aws cloudformation describe-stacks --stack-name awscracknip --query Stacks[*].Parameters[0].ParameterValue --output text)
    ssh -i $setkey.pem admin@$stringec2
    ;;

  *)
    echo "Usage of awscracknip"
    echo "First -install, then you can -connect, display -info, -stop and -start the ec2 instance and -kill the stack."
    echo "-install needs a key, and you can select the ec2 instance, by default"
    echo "a g5.xlarge instance gets deployed"
    echo "Example usage:"
    echo "bash awscracknip.sh -install ssh-keyname t2.small"
    exit 1
    ;;
esac
