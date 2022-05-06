resource "aws_key_pair" "mykey" {
  key_name   = "mykey"
  public_key = file(var.PATH_TO_PUBLIC_KEY)
}

resource "aws_instance" "webserver" {
  ami           = var.AMIS[var.AWS_REGION]
  instance_type = "t2.micro"
  user_data = file("./script.sh")
 
  key_name               = aws_key_pair.mykey.key_name
}
