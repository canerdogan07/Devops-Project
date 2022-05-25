This projects aim is to spin up an EKS cluster which is on public subnets(not recommended) on AWS using terraform.

We do spin up EKS cluster first and then worker nodes. 

Choose the EKS compatible AMI's and set up the launch configuration-autoscaling group for worker nodes.

Attach user data to the worker nodes to enable them to join the cluster using bootstrap.sh.

When terraform apply is done, pass the kubeconfig file to local system to reach the cluster API.

Apply config-map-aws-auth to authenticate the nodes to the cluster.

