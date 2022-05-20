This projects aim is to show a CI/CD process in AWS using CodePipeline and its services CodeCommit, CodeBuild and CodeDeploy.

The deployment gets commited to Codecommit repository via git push command which first triggers Codebuild via docker build. Accordingly, dockerized image gets pushed into ECR repository that triggers Codedeploy stage where the yaml manifest files run on fargate-ecs cluster that pulls the image from ECR repo and publishes it to web via using loadbalancer as a service.

The project uses fargate which makes the process faster, however it would be better if we spin up ec2 users with more secure options. Also the loadbalancer service is a network loadbalancer type which lacks security according to application loadbalancer.

To ssh easliy ecs cluster runs in public subnets. If more secure system is needed it is a must to make a jump host in public subnet and create a cluster in private subnets with NAT gateways.