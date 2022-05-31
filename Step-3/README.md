* Use your designated VPC and Subnets(both Private&Public) CIDR blocks.
* Add NAT gateway to private subnets. 
* Add route tables from IGW>ELB>Public>Private and route table associations.
* Add security group to SSH from local machine.
* Add autoscaling group with ELB connection and additional EBS. Use user_data function to pre install the cpu stressor, apache2 and MYSQL to connect MariaDB in private subnet.
* Using apache2 we will curl out the host IP and check if the ELB is working properly or not.
* Use the stressor to scale the instance up/down.
* Add RDS database(mariadb) and connect it throught jump host in public subnet>private subnet where RDS database is located.
* Add cloud watch metrics and alarms or both scaling up and down policies to follow the metrics from cloudwatch service.



