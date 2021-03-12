module "us_east_2_bucket_module" {
    source = "./modules/us-east-2"
    # provider_alias = "us-east-2"
}

module "us_west_2_bucket_module" {
    source = "./modules/us-west-2"
    # provider_alias = "us-west-2"
}

module "eu_west_2_bucket_module" {
    source = "./modules/eu-west-2"
    # provider_alias = "eu-west-2"
}