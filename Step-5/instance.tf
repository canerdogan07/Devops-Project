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

resource "aws_instance" "jenkins-instance" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.small"
  subnet_id = aws_subnet.public-1.id
  vpc_security_group_ids = [aws_security_group.jenkins-securitygroup.id]
  key_name = aws_key_pair.mykeypair.key_name
  user_data = data.cloudinit_config.cloudinit-jenkins.rendered
  iam_instance_profile = aws_iam_instance_profile.jenkins-role.name
}

resource "aws_ebs_volume" "jenkins-data" {
  availability_zone = "eu-central-1a"
  size              = 20
  type              = "gp2"
  tags = {
    Name = "jenkins-data"
  }
}

resource "aws_volume_attachment" "jenkins-data-attachment" {
  device_name  = var.INSTANCE_DEVICE_NAME
  volume_id    = aws_ebs_volume.jenkins-data.id
  instance_id  = aws_instance.jenkins-instance.id
  skip_destroy = true
}

resource "aws_instance" "app-instance" {
  count         = var.APP_INSTANCE_COUNT
  ami           = var.APP_INSTANCE_AMI
  instance_type = "t2.micro"
  subnet_id = aws_subnet.public-1.id
  vpc_security_group_ids = [aws_security_group.app-securitygroup.id]
  key_name = aws_key_pair.mykeypair.key_name
}

