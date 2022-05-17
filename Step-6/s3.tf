resource "aws_s3_bucket" "terraform-state" {
  bucket = "canerdogan-devops-project"

  tags = {
    Name = "Terraform state"
  }
}
