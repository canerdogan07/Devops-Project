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


