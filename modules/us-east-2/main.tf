provider "aws" {
 region = "us-east-2"
 }

resource "aws_s3_bucket" "b" {
  bucket = "cosmic-my-tf-test-bucket-us-east-2"
  acl    = "private"
  versioning {
    enabled = true
  }
  tags = {
    Name        = "us-east-2 bucket"
    Environment = "Dev"
  }
}
