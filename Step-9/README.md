This projects aim is to spin up an EKS cluster on AWS using terraform.

Create a jump host in case you want to SSH to the worker nodes(which is not preffered) or can be used as jenkins instace as well.

We do spin up EKS cluster first and then worker nodes. 

Choose the EKS compatible AMI's and set up the launch configuration-autoscaling group for worker nodes.

Attach user data to the worker nodes to enable them to join the cluster using bootstrap.sh.

When terraform apply is done, pass the kubeconfig file to local system to reach the cluster API.

Apply config-map-aws-auth to authenticate the nodes to the cluster.

Spin up a kubernetes deployment nginx with 3 replicasets and rollingUpdate strategy. Expose it with loadbalancer service.