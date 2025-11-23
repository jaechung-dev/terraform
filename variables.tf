##############################################
# Root Variables
##############################################

variable "region" {
  description = "AWS region"
  type        = string
}

variable "project_name" {
  description = "Project name prefix for tagging"
  type        = string
}

variable "environment" {
  description = "Environment name (dev/staging/prod)"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR for VPC"
  type        = string
}

variable "image_url" {
  description = "Full ECR image URL incl. tag"
  type        = string
}

variable "public_subnet_cidrs" {
  description = "List of CIDR blocks for public subnets"
  type        = list(string)
}

variable "private_subnet_cidrs" {
  description = "List of CIDR blocks for private subnets"
  type        = list(string)
}

variable "enable_nat_gateway" {
  description = "Whether to create NAT Gateway"
  type        = bool
  default     = true
}

variable "tags" {
  description = "Common tags"
  type        = map(string)
  default     = {}
}

variable "azs" {
  description = "List of availability zones to use"
  type        = list(string)
}

variable "github_org" {
  type        = string
  description = "GitHub user or org that owns the repo"
}

variable "github_repo" {
  type        = string
  description = "GitHub repo name for this infra"
}