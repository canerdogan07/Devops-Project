variable "AWS_REGION" {
  default = "eu-central-1"
}
variable "AWS_ACCESS_KEY" {
}

variable "AWS_SECRET_KEY" {
}
variable "PATH_TO_PRIVATE_KEY" {
  default = "mykey"
}

variable "PATH_TO_PUBLIC_KEY" {
  default = "mykey.pub"
}

variable "AMIS" {
  type = map(string)
  default = {
    eu-central-1 = "ami-015c25ad8763b2f11"
    us-west-2    = "ami-06b94666"
    eu-west-1    = "ami-844e0bf7"
  }
}

variable "INSTANCE_DEVICE_NAME" {
  default = "/dev/xvdh"
}

variable "RDS_PASSWORD" {
}