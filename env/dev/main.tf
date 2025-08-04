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

module "eks" {
  source          = "../../modules/eks"
  project_name    = var.main_project_name

  vpc_id          = module.networking.fp-vpc-id
  subnet_ids      = module.networking.fb-pub-subnet-ids

  cluster_version = var.main_cluster_version

  service_ipv4_cidr = var.main_service_ipv4_cidr

  instance_type   = var.main_instance_type

  min_size        = var.main_min_size
  max_size        = var.main_max_size
  desired_capacity = var.main_desired_capacity

  on_demand_base_capacity = var.main_on_demand_base_capacity
  on_demand_percentage_above_base_capacity = var.main_on_demand_percentage_above_base_capacity
  spot_allocation_strategy = var.main_spot_allocation_strategy

}