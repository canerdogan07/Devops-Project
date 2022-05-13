This projects aim is to create an app using jenkins.

Terraform init>Terraform apply

Create s3 bucket. 

Create an instance with jenkins, python, terraform and packer installed.

SSH into jenkins instace. Take the passwords an curl into jenkins website using port :8080 tag.

Create a job for jenkins which will first install the packer, then install the app for packer(nginx-nodejs installed) to create an AMI with app installed. The app will push output Hello World!. Push the created AMI to s3 bucket with tag amivar.tf

Push the .tfstate from local terraform into s3 bucket using with uncommenting the backend.tf using terraform init.

When you have amivar.tf file from packer and .tfstate pushed into your s3 bucket, create a new job for jenkins to create an app instance. The jenkins will create the instance with terraform init>terraform apply using .tfstate file from s3 bucket.

Curl into app instance IP which outputs Hello World!.

