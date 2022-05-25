This projects aim is to deploy yaml files on EKS cluster.

Learn concepts;

Namespace,
Replicasets,
Deployment,
Loadbalancers,
Nodeport

Create a jump host in case you want to SSH to the worker nodes(which is not preffered) or can be used as jenkins instace as well.

Spin up an nginx deployment with 3 replicasets on default namespace with rollingUpdate strategy. Expose it with loadbalancer service.