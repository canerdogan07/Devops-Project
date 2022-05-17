variable "AWS_REGION" {
  default = "eu-central-1"
}

variable "PATH_TO_PRIVATE_KEY" {
  default = "mykey"
}

variable "PATH_TO_PUBLIC_KEY" {
  default = "mykey.pub"
}

variable "ECS_INSTANCE_TYPE" {
  default = "t2.micro"
}

variable "ECS_AMIS" {
  type = map(string)
  default = {
    eu-central-1 = "ami-0e096576601cb24f3"
    us-west-2    = "ami-56ed4936"
    eu-west-1    = "ami-c8337dbb"
  }
}

variable "MYAPP_SERVICE_ENABLE" {
  default = "0"
}

variable "MYAPP_VERSION" {
  default = "0"
}

variable "AMIS" {
  type = map(string)
  default = {
    us-east-1 = "ami-01b996646377b6619"
    us-west-2 = "ami-0637e7dc7fcc9a2d9"
    eu-central-1 = "ami-02584c1c9d05efa69"
  }
}

variable "INSTANCE_DEVICE_NAME" {
  default = "/dev/xvdh"
}

variable "JENKINS_VERSION" {
  default = "2.319.3"
}

variable "TERRAFORM_VERSION" {
  default = "1.1.0"
}