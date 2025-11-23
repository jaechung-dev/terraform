##############################################
# modules/ecr/variables.tf
##############################################

variable "project_name" {
  type        = string
  description = "Project name (e.g. payload)"
}

variable "environment" {
  type        = string
  description = "Environment (e.g. dev, prod)"
}

variable "tags" {
  type        = map(string)
  description = "Common tags"
  default     = {}
}