variable "AWS_ACCESS_KEY" {
}

variable "AWS_SECRET_KEY" {
}

variable "AWS_REGION" {
  default = "eu-central-1"
}

variable "AMIS" {
  type = map(string)
  default = {
    eu-central-1 = "ami-09439f09c55136ecf"
    us-west-2    = "ami-06b94666"
    eu-west-1    = "ami-844e0bf7"
  }
}

