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