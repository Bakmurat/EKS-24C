variable "project_name" {
  description = "Name of the project"
  type        = string
  default     = "b24c-project"
}

variable "cluster_version" {
    type       = string
    default    = "1.31"
}

variable "vpc_id" {
  description = "VPC ID where the EKS cluster will be created"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs for the EKS cluster"
  type        = list(string)
}

variable "instance_type" {
  description = "Instance type for the EKS worker nodes"
  type        = string
  default     = "t2.medium"
}

variable "min_size" {
  description = "Minimum number of worker nodes in the EKS cluster"
  type        = number
  default     = 2
}

variable "max_size" {
  description = "Maximum number of worker nodes in the EKS cluster"
  type        = number
  default     = 5
}

variable "desired_capacity" {
  description = "Desired number of worker nodes in the EKS cluster"
  type        = number
  default     = 3
}

variable "on_demand_base_capacity" {
  description = "Base capacity for on-demand instances in the EKS cluster"
  type        = number
  default     = 1 
}

variable "on_demand_percentage_above_base_capacity" {
  description = "Percentage of on-demand instances above the base capacity in the EKS cluster"
  type        = number
  default     = 50
}

variable "spot_allocation_strategy" {
  description = "Allocation strategy for spot instances in the EKS cluster"
  type        = string
  default     = "lowest-price" 
}

variable "service_ipv4_cidr" {
  description = "The CIDR block for the Kubernetes service network"
  type        = string
}
