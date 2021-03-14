
variable bucket_region {}
variable bucket_name {}
variable bucket_regions {}


data "aws_iam_role" "bucket_role_arn" {
  name = var.bucket_name
}
resource "aws_s3_bucket" "bucket" {
  bucket = "${var.bucket_name}-${var.bucket_region}"
  acl    = "private"
  force_destroy = true

  versioning {
    enabled = true
  }

  replication_configuration {
    role = data.aws_iam_role.bucket_role_arn.arn

    rules {
      id       = "repl-rule-${var.bucket_region}-to-${lookup(var.bucket_regions, var.bucket_region).repl_destination_p1}"
      status   = "Enabled"
      priority = 0
      filter {}
      destination {
        bucket        = "arn:aws:s3:::${var.bucket_name}-${lookup(var.bucket_regions, var.bucket_region).repl_destination_p1}"
        storage_class = "STANDARD"
      }
    }

    rules {
      id       = "repl-rule-${var.bucket_region}-to-${lookup(var.bucket_regions, var.bucket_region).repl_destination_p2}"
      status   = "Enabled"
      priority = 1
      filter {
      }
      destination {
        bucket        = "arn:aws:s3:::${var.bucket_name}-${lookup(var.bucket_regions, var.bucket_region).repl_destination_p2}"
        storage_class = "STANDARD"
      }
    }
  }
}


# output "this_s3_bucket_id "{
#   description = "The name of the bucket."
#   value = aws_s3_bucket.
# }