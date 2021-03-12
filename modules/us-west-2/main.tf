provider "aws" {
 region = "us-west-2"
 }

resource "aws_s3_bucket" "b" {
  bucket = "cosmic-my-tf-test-bucket-us-west-2"
  acl    = "private"
  versioning {
    enabled = true
  }
  tags = {
    Name        = "us-west-2 bucket"
    Environment = "Dev"
  }
}
