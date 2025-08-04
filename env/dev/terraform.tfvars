# Generic values
region = "us-west-2"
main_project_name = "B24c-project"

# EKS networking values
main_vpc_cidr_block = "10.0.0.0/16"
main_pub_subnets_cidr = [ "10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
main_priv_subnets_cidr = [ "10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
main_subs_az = [ "us-west-2a", "us-west-2b", "us-west-2c" ]

# EKS values
main_cluster_version = "1.31"
main_service_ipv4_cidr = "172.20.0.0/16"
main_instance_type = "t2.medium"

main_min_size = 2
main_max_size = 4
main_desired_capacity = 3

main_on_demand_base_capacity = 0
main_on_demand_percentage_above_base_capacity = 20
main_spot_allocation_strategy = "lowest-price"
