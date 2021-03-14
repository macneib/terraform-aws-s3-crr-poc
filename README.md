

# S3 bucket with Cross-Region Replication (CRR) enabled example

Configuration in this directory creates 3 S3 buckets in three regions and configures CRR to replicate files between all 3 buckets.


## Usage:

This projects features a dev container usable in vscode.
In your dev container set your aws credentials as follows:

```
export AWS_ACCESS_KEY_ID="awsaccesskey"
export AWS_SECRET_ACCESS_KEY="awssecretkey"
```

To run this example you need to execute:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

Note that this example may create resources which cost money. Run `terraform destroy` when you don't need these resources.


## Requirements

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12.26 |
| aws | >= 3.32.0 |


## Providers

| Name | Version |
|------|---------|
| aws | >= 3.0 |


## Modules

| Name | Source | Version |
|------|--------|---------|
| s3   | ../../ |  |


## Resources

| Name |
|------|
| [aws_caller_identity](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) |
| [aws_iam_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) |
| [aws_iam_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy_attachment) |
| [aws_iam_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) |


## Inputs

No input.


## Outputs

No output.