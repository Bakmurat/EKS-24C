variable "region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-west-2"
}

variable "main_project_name" {
  description = "Name of the main project"
  type        = string
  default     = "b24c-project"
}

variable "main_vpc_cidr_block" {
  description = "CIDR block for the main VPC"
  type        = string
  default     = "10.0.0.0/16"

}

variable "main_priv_subnets_cidr" {
  description = "List of CIDR blocks for private subnets in the main project"
  type        = list(string)
}

variable "main_pub_subnets_cidr" {
  description = "List of CIDR blocks for public subnets in the main project"
  type        = list(string)
}

variable "main_subs_az" {
  description = "List of availability zones for the subnets"
  type        = list(string)
  default     = ["us-west-2a", "us-west-2b", "us-west-2c"]
}

variable "main_cluster_version" {
    type       = string
    default    = "1.31"
}

variable "main_service_ipv4_cidr" {
  description = "The CIDR block for the Kubernetes service network"
  type        = string
}

variable "main_instance_type" {
  description = "Instance type for the EKS worker nodes"
  type        = string
  default     = "t2.medium"
}

variable "main_min_size" {
  description = "Minimum number of worker nodes in the EKS cluster"
  type        = number
  default     = 2
}

variable "main_max_size" {
  description = "Maximum number of worker nodes in the EKS cluster"
  type        = number
  default     = 5
}

variable "main_desired_capacity" {
  description = "Desired number of worker nodes in the EKS cluster"
  type        = number
  default     = 3
}

variable "main_on_demand_base_capacity" {
  description = "Base capacity for on-demand instances in the EKS cluster"
  type        = number
  default     = 1 
}

variable "main_on_demand_percentage_above_base_capacity" {
  description = "Percentage of on-demand instances above the base capacity in the EKS cluster"
  type        = number
  default     = 50
}

variable "main_spot_allocation_strategy" {
  description = "Allocation strategy for spot instances in the EKS cluster"
  type        = string
  default     = "lowest-price" 
}

