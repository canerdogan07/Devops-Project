##In this project, the aim is to create an ECS cluster using jenkins an run our app in it.

1)First, we run terraform apply to create an ***ecs cluster*** and instance which includes *docker*, *terraform* and *jenkins* in it.
'''
    terraform apply --auto-approve
'''

We do ssh to jenkins and install necessary plug-ins. 
'''
    ssh -i mykey ubuntu@ip
'''
---
2)Then create 2 *jobs in jenkins*. First one is to *dockerize* the app and push it to ECR. 2nd one is to run the terraform code and create a app instance in ECS using the dockerized App AMI from ECR.

You need to pass the AWS credentials to Jenkins instance via SSH for the terraform to work on AWS.

###First job details would be having the shell script;
'''
Docker build -t appname .
aws ecr get-login-password
docker push xxxx.awsamazon.com
'''
will be triggering the 2nd job when it is done.

###2nd job shell script would be using;
'''
creating key pairs
terraform init
terraform apply -target 'the service/instance you want to create/change' -auto-approve
'''
