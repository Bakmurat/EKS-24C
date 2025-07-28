variable "project_name" {
  description = "b24c-project"
  type = string
}

variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "pub_subnet_cidr" {
  description = "List of CIDR blocks for public subnets"
  type        = list(string)
}

variable "priv_subnet_cidr" {
  description = "List of CIDR blocks for private subnets"
  type        = list(string)
  default     = []
}

variable "subs_az" {
  description = "List of availability zones"
  type        = list(string)
  default = [ "us-west-2a", "us-west-2b", "us-west-2c" ]
}


