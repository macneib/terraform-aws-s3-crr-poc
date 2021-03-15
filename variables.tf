
# variable "iam_bucket_actions_query" {
#   default = [
#     "s3:ListBucket",
#     "s3:GetReplicationConfiguration",
#     "s3:GetObjectVersionForReplication",
#     "s3:GetObjectVersionAcl",
#     "s3:GetObjectVersionTagging",
#     "s3:GetObjectRetention",
#     "s3:GetObjectLegalHold"
#   ]
# }

# variable "bucket_resources_arn_query" {
#   default = [
#     "arn:aws:s3:::${local.name}-us-west-2",
#     "arn:aws:s3:::${local.name}-us-west-2/*",
#     "arn:aws:s3:::${local.name}-us-east-2",
#     "arn:aws:s3:::${local.name}-us-east-2/*",
#     "arn:aws:s3:::${local.name}-eu-west-2",
#     "arn:aws:s3:::${local.name}-eu-west-2/*"
#   ]
# }

# variable "iam_bucket_actions_replication" {
#   default = [
#     "s3:ReplicateObject",
#     "s3:ReplicateDelete",
#     "s3:ReplicateTags",
#     "s3:ObjectOwnerOverrideToBucketOwner"
#   ]
# }

# variable "bucket_resources_arn_replication" {
#   default = [
#     "arn:aws:s3:::${local.name}-us-west-2/*",
#     "arn:aws:s3:::${local.name}-us-east-2/*",
#     "arn:aws:s3:::${local.name}-eu-west-2/*"
#   ]
# }