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

