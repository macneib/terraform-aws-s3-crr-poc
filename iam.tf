resource "aws_iam_role" "replication" {
  name = local.name

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "s3.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
POLICY
}

resource "aws_iam_policy" "replication" {
  name = local.name

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
                "s3:ListBucket",
                "s3:GetReplicationConfiguration",
                "s3:GetObjectVersionForReplication",
                "s3:GetObjectVersionAcl",
                "s3:GetObjectVersionTagging",
                "s3:GetObjectRetention",
                "s3:GetObjectLegalHold"
      ],
      "Effect": "Allow",
      "Resource": [
        "arn:aws:s3:::${local.name}-us-west-2",
        "arn:aws:s3:::${local.name}-us-west-2/*",
        "arn:aws:s3:::${local.name}-us-east-2",
        "arn:aws:s3:::${local.name}-us-east-2/*",
        "arn:aws:s3:::${local.name}-eu-west-2",
        "arn:aws:s3:::${local.name}-eu-west-2/*"
      ]
    },
    {
      "Action": [
                "s3:ReplicateObject",
                "s3:ReplicateDelete",
                "s3:ReplicateTags",
                "s3:ObjectOwnerOverrideToBucketOwner"
      ],
      "Effect": "Allow",
      "Resource": [
        "arn:aws:s3:::${local.name}-us-west-2/*",
        "arn:aws:s3:::${local.name}-us-east-2/*",
        "arn:aws:s3:::${local.name}-eu-west-2/*"
      ]
    }
  ]
}
POLICY
}

resource "aws_iam_policy_attachment" "replication" {
  name       = local.name
  roles      = [aws_iam_role.replication.name]
  policy_arn = aws_iam_policy.replication.arn
}

output "aws_iam_role" {
  value       = aws_iam_role.replication.arn
  description = "The iam role for s3 bucket replication."
}