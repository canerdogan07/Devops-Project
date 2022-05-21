This projects aim is to spin up an EKS cluster on AWS using terraform.

We do spin up EKS cluster first and then worker nodes. 

Choose the EKS compatible AMI's and set up the launch configuration-autoscaling group for worker nodes.

Attach the worker nodes to the cluster using bootstrap.sh.

When terraform apply is done, pass the kubeconfig file to local system to reach the cluster API.

