resource "aws_instance" "example" {
  ami           = var.AMI_ID
  instance_type = "t2.micro"
  subnet_id = aws_subnet.public-1.id
  vpc_security_group_ids = [aws_security_group.example-instance.id]
  key_name = aws_key_pair.mykeypair.key_name
}

