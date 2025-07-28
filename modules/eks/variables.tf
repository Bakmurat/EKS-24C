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