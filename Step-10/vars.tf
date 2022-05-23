variable "cluster-name" {
  default = "terraform-eks-demo"
  type    = string
}

variable "PATH_TO_PRIVATE_KEY" {
  default = "mykey"
}

variable "PATH_TO_PUBLIC_KEY" {
  default = "mykey.pub"
}