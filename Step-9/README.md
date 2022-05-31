##This projects aim is to deploy yaml files on EKS cluster.

###Learn concepts;

-Namespace,
-Replicasets,
-Deployment,
-Loadbalancers
---
Create a **jump host** in case you want to SSH to the worker nodes(which is not preffered) or can be used as *jenkins* instace as well.
---
Spin up an hello-world **deployment** with 3 **replicasets** on default **namespace** with **readiness** and **liveness** probes. Expose it with **Loadbalancer** as a service.

*The authentication and kubeconfig steps will be repeated in step-8*