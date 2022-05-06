Use your designated VPC and Subnets(both Private&Public) CIDR blocks.
Add NAT gateway to private subnets. 
Add route tables from IGW>Public>Private and route table associations.
Add security group to SSH from local machine.
Add EBS volume attachment to jump host.
Add RDS database(mariadb) and connect it throught jump host in public subnet>private subnet where RDS database is located.
Add autoscaling group and stress the instances to scale up or down. User user_data function to pre install the cpu stressor.
Add cloud watch metrics and alarms or both scaling up and down policies to follow the metrics from cloudwatch service.



