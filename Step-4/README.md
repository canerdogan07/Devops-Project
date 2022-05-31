### This step is to learn how to create an AMI in AWS with Packer that includes docker,nginx,vim softwares inside.

* Build-and-launch.sh file executes packer build using packer-example.json file.

* Packer-example.json file first creates an Instance to create an AMI, after that, executes the install_software.sh file which first creates the AMI with softwares installed.(The trick here is to give time for the softwares to be installed, else the terraform will start to spin up before AMI ID is not created.) 

* Reads the new created AMI and then passes the AMI ID to terraform with creating an amivar.tf file. So the build stage ends.

* Launch stage reads the terraform files where instance AMI is identified in amivar.tf file that is created in build stage.

* You may ssh to the instance at the end to whether check designated softwares are installed or not.