locals {
    regions = ["us-east-2", "us-west-2", "eu-west-2"]
    name = "tf-cosmic-12345"
}
variable "bucket_regions" {
  default = {
    "us-east-2" = {
      "region_alias"        = "aws.useast2"
      "repl_destination_p1" = "us-west-2"
      "repl_destination_p2" = "eu-west-2"
    },
    "us-west-2" = {
      "region_alias"        = "aws.uswest2"
      repl_destination_p1   = "us-east-2"
      repl_destination_p2   = "eu-west-2"
    },
    "eu-west-2" = {
      "region_alias"        = "aws.euwest2"
      repl_destination_p1   = "us-east-2"
      repl_destination_p2   = "us-west-2"
    }
  }
}

provider "aws" {
  region = "us-west-1"
}
provider "aws" {
  alias  = "usw2"
  region = "us-west-2"
}

provider "aws" {
  alias  = "use2"
  region = "us-east-2"
}

provider "aws" {
  alias  = "euw2"
  region = "eu-west-2"
}


module "eu_west_2_bucket_module" {
  source = "./modules/s3"
  providers = {
    aws = aws.euw2
  }
  bucket_name = local.name
  bucket_region = "eu-west-2"
  bucket_regions = var.bucket_regions
  depends_on = [aws_iam_role.replication]
}

module "us_east_2_bucket_module" {
  source = "./modules/s3"
  providers = {
    aws = aws.usw2
  }
  bucket_name = local.name
  bucket_region = "us-west-2"
  bucket_regions = var.bucket_regions
  depends_on = [aws_iam_role.replication]
}

module "us_west_2_bucket_module" {
  source = "./modules/s3"
  providers = {
    aws = aws.use2
  }
  bucket_name = local.name
  bucket_region = "us-east-2"
  bucket_regions = var.bucket_regions
  depends_on = [aws_iam_role.replication]
}








