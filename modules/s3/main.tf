
variable bucket_region {}
variable bucket_name {}
variable bucket_regions {}

resource "aws_s3_bucket" "bucket" {
  bucket = "${var.bucket_name}-${var.bucket_region}"
  acl    = "private"
  force_destroy = true

  versioning {
    enabled = true
  }

  replication_configuration {
    role = "arn:aws:iam::473648414978:role/${var.bucket_name}-role"

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