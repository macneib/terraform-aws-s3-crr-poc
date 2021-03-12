provider "aws" {
 region = "eu-west-2"
 }

resource "aws_s3_bucket" "b" {
  bucket = "cosmic-my-tf-test-bucket-eu-west-2"
  acl    = "private"

  tags = {
    Name        = "eu-west-2 bucket"
    Environment = "Dev"
  }
}
