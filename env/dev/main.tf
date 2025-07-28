provider "aws" {
    region = var.region
}

terraform {
  backend "s3" {
    bucket         = "studentgroup-terraform-state-file"
    key            = "dev/terraform.tfstate"
    region         = "us-west-2"
  }
}

module "networking" {
    source          = "../../modules/networking"
    project_name    = var.main_project_name
    vpc_cidr_block  = var.main_vpc_cidr_block
    pub_subnet_cidr = var.main_pub_subnets_cidr
    priv_subnet_cidr = var.main_priv_subnets_cidr
    subs_az        = var.main_subs_az
}

# module "eks" {
#     source          = "../../modules/eks"
#     project_name    = var.main_project_name

#     vpc_id          = module.networking.fp-vpc-id
#     subnet_ids  = module.networking.fb-pub-subnet-ids


# }