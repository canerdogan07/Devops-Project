data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"]
}


resource "aws_instance" "jumphost" {
  ami             = data.aws_ami.ubuntu.id
  instance_type   = "t2.micro"
  subnet_id       = module.vpc.public_subnets[0]
  security_groups = [aws_security_group.jumphost.id]
  key_name        = aws_key_pair.mykey.key_name
}

