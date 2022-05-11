resource "aws_s3_bucket" "mybucket" {
  bucket = "canerdogan-devops-project"

  tags = {
    Name = "Terraform state"
  }
}

