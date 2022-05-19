#
# cache s3 bucket
#
resource "aws_s3_bucket" "codebuild-cache" {
  bucket = "canerdogan-devops-build"
}

resource "aws_s3_bucket" "demo-artifacts" {
  bucket = "canerdogan-devops-project"

  # lifecycle moved to aws_s3_bucket_lifecycle_configuration (Change starting from AWS Provider 4.x)
}

resource "aws_s3_bucket_lifecycle_configuration" "demo-artifacts-lifecycle" {
  bucket = aws_s3_bucket.demo-artifacts.id

  rule {
    id     = "clean-up"
    status = "Enabled"

    expiration {
      days = 30
    }
  }
}

